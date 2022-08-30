-- Author: Nameous Changey
-- GitHub: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension
-- Workshop: https://steamcommunity.com/id/Bilkokuya/myworkshopfiles/?appid=573090
--
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey

--[[ Overall Jacks-Quest storyline, made of multiple missions/chapters]]
Mission_JacksQuest = LifeBoatAPI.Mission:new("Jack's Fork'd Lifter", function (self, savedata, params)
    server.announce("Mission Spawn", "Jack's Fork'd Lifter is ready")
    -- spawn
    if g_savedata.jacksQuestComplete then
        self:terminate()
        return -- sit idly on this stage forever, mission is already complete; can't repeat it 
    end

    -- if we've not yet spawned the stuff needed for the mission, spawn it
    -- see the mission location data in-game
    if savedata.isSpawned ~= 8 then
        local location = LB.addons.this.locationsByName["FixTheLifter"]
        local tilePosition = location:getPosition()

        savedata.jackID             = location.componentsByName["FarmerJack"]:spawnRelativeToPosition(tilePosition).id
        savedata.lifterID           = location.componentsByName["JacksLifter"]:spawnRelativeToPosition(tilePosition).id
        savedata.lifterReturnZoneID = location.componentsByName["LifterReturnZone"]:spawnRelativeToPosition(tilePosition).id
        savedata.workbenchZoneID    = location.componentsByName["WorkbenchZone"]:spawnRelativeToPosition(tilePosition).id
        savedata.workbenchCenterID  = location.componentsByName["WorkbenchCenter"]:spawnRelativeToPosition(tilePosition).id
        savedata.jackMoveTo1        = location.componentsByName["JackMoveTo1"]:spawnRelativeToPosition(tilePosition).id
        savedata.jackMoveTo2        = location.componentsByName["JackMoveTo2"]:spawnRelativeToPosition(tilePosition).id
        savedata.propsID            = location:spawnMultipleRelativeToPosition(tilePosition, function (component) return component.tags["isProp"] end).id
        savedata.isSpawned = 8;
    end

    -- attach all our spawned stuff to this mission, so it automatically despawns/gets cleaned up when we're done
    LifeBoatAPI.lb_attachMultiple(self,
        LB.objects:getNPC(savedata.jackID),
        LB.objects:getVehicle(savedata.lifterID),
        LB.objects:getZone(savedata.lifterReturnZoneID),
        LB.objects:getZone(savedata.workbenchZoneID),
        LB.objects:getZone(savedata.workbenchCenterID),
        LB.objects:getZone(savedata.jackMoveTo1),
        LB.objects:getZone(savedata.jackMoveTo2),
        LB.objects:getObjectCollection(savedata.propsID)
    )
end)

--[[ MISSION STAGES ]]

    -- 1. Jack offers you the quest
    Mission_JacksQuest:addStage(function (self, savedata, params)
        server.announce("part 1", "dialog")
        local mainsave = self.parent.savedata

        local jackDialogModel = LifeBoatAPI.Dialog:new({
            { id="start",      text = "Hey, nice to meet you, I'm Jack.", result={hasSpokenOnce=true}},
            {                  text = "I've got a favour to ask.\n\nDo you think can you help me?",
                                    choices={ {phrase="sure", next="accept", result={hasAccepted=true}},
                                            {phrase="nope", next="decline"}}, showChoices=true},
                        
            { id="altstart",    text = "Oh, chaged your mind?"},
            {                   text = "Think you can help?\n\nIt'll be quick, I promise.",
                                    choices= { {phrase="sure", next="accept", result={hasAccepted=true}},
                                            {phrase="nope", next="decline"}}, showChoices=true },
        
            { id="accept",      text = "Great, so the problem I've got is."},
            {                   text = "We've got tons of these potatoes\n\nBut my lifter's broken"},
            {                   text = "I need you to take it to the workbench, and fix it", timeout=180},
            {                   text = "When I press the button, the forks should lift up.\n\nBut for some reason they won't move"},
            {                   text = "It's just over there.", result={missionAccepted=true}, terminate=true},
        
            { id="decline",     text = "Oh, nevermind then.\n\nIf you change your mind just come back", result={missionAccepted=false}, terminate=true},
        }, 120)

        -- retrieve the actual Jack instance object
        local jack = LB.objects:getNPC(mainsave.jackID)
        local zone = jack.childZones[1]

        if savedata.isNew then
            local popup = LifeBoatAPI.UIPopup:new(nil, "new", 0, 2, 0, 500, jack, true)
            self:attach( zone.onCollision:await():andImmediately(function (cr, deltaTicks, lastResult)
                popup:despawn()
                savedata.isNew = false
            end) )
            self:attach(popup)
        end

        -- simple dialog handling
        local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "Oh, well goodbye I guess!",
            function (dialog)
                -- when starting the dialog, decide the starting point by previous options picked
                dialog:gotoNextLine(savedata.hasAccepted and "accept" or savedata.hasSpokenOnce and "altstart" or "start")
            end,
            function (l, context, dialog, results, player)
                -- on dialog ended, save the results
                LifeBoatAPI.lb_copy(results, savedata)
                if results.missionAccepted then
                    server.notify(-1, "Jack's Fork'd Lifter", "Accepted.\n\nTake Jack's lifter to the workbench and fix it.", LifeBoatAPI.Constants.NotifiationTypes.new_mission)
                    self:terminate()
                end
            end)

        self:attach(dialogHandler)
    end)

    --2. Move the lifter to the workbench area
    Mission_JacksQuest:addStage(function (self, savedata, params)
        local mainsave = self.parent.savedata
        server.announce("part 2", "move the lifter")

        local lifter = LB.objects:getVehicle(mainsave.lifterID)
        local workbenchZone = LB.objects:getZone(mainsave.workbenchZoneID)
        local workbenchCenter = LB.objects:getZone(mainsave.workbenchCenterID)

        local lifterPopupText = "Jack's Lifter."
        local lifterPopup = LifeBoatAPI.UIPopup:new(nil, lifterPopupText, 0, 1.5, 0, 500, lifter, true)
        self:attach(lifterPopup)

        -- DEBUG, allow cheating to skip to the next stage, what's very cool is it works
        self:attach(
            LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
                if command == "?cheat" then
                    server.setVehiclePos(lifter.id, workbenchZone.transform)
                end
            end)
        )

        local collisionListener = workbenchZone.onCollision:register(function (l, context, zone, collision, collidingWith)
            -- hide the popup while colliding
            lifterPopup:edit("")

            -- add a new popup to point the player to touch the actual workbench itself (delete when the vehicle leaves the collider, e.g. gets workbenched)
            collision:attach(LifeBoatAPI.UIPopupRelativePos:new(nil, "Use workbench to edit Jack's Lifter", LifeBoatAPI.Matrix:newMatrix(0, 0, 0), nil, 50, workbenchCenter, true))

            collision.onCollisionEnd:register(function (l, context, collision)
                -- put the lifter popup back on, in case you moved it *out* of the zone...
                lifterPopup:edit(lifterPopupText)
            end)
        end)
        self:attach(collisionListener)

        -- when the lifter despawns, we have to assume it was opened in the workbench. If it wasn't...whomp whomp
        local lifterDespawnListener = lifter.onDespawn:await()
        :andImmediately(function (cr, deltaTicks, lastResult)
            -- when the player's not looking - sneakily shove jack over to the lifter
            local jack = LB.objects:getNPC(mainsave.jackID)
            local jackMoveTo = LB.objects:getZone(mainsave.jackMoveTo2)
            server.setObjectPos(jack.id, jackMoveTo.transform)

            self:next() -- goto the next mission
        end)
        self:attach(lifterDespawnListener)
        
    end)

    -- 3. Fix the Lifter
    local fixQuest = Mission_JacksQuest:addNamedStage("FixLifter", function (self, savedata, params)
        server.announce("part 3", "nothing")
    end)

        -- loop these quest stages, until we have a working/valid vehicle
        -- 3.1. Wait for the player to spawn the fixed lifter
        fixQuest:addNamedStage("WaitForSpawn", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            server.announce("part 3.1", "waiting")
            local listener = LB.events.onVehicleSpawn:register(function (l, context, vehicleID, peerID, x, y, z, cost)
                if peerID >= 0 then
                    local vehicle = LifeBoatAPI.Vehicle:fromUntrackedSpawn(vehicleID, peerID, cost)
                    
                    vehicle:awaitLoaded()
                    :andThen(function (cr, deltaTicks, lastResult)
                        local dial, success = server.getVehicleDial(vehicleID, "LBJACKLIFTER")
                        if success then
                            mainsave.lifterID = vehicle.id
                            self:terminate()
                        end
                    end)
                end
            end)
    
            self:attach(listener)
        end)

        --- 3.2 Test that this lifter is actually fixed
        fixQuest:addNamedStage("TestLifter", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            server.announce("part 3.2", "testing")
            local vehicle = LB.objects:getVehicle(mainsave.lifterID)
            -- be wary of the vehicle having been despawned, or despawning while "testing" it (e.g. re-entering the workbench)
            if not vehicle then
                self.parent:next("WaitForSpawn")
            else
                local vehicleListener = vehicle.onDespawn:await():andImmediately(function (cr, deltaTicks, lastResult)
                    self.parent:next("WaitForSpawn")
                end)
                self:attach(vehicleListener)

                -- got a valid vehicle reference, so use it
                
                -- tell the player to test that it works
                local jack = LB.objects:getNPC(mainsave.jackID)
                local popup = LifeBoatAPI.UIPopup:new(nil, "Nice, now give it a test run!", 0, 1, 0, 100, jack, true)
                LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
                self:attach(popup)

                -- listen for a result
                local onButton = vehicle.onButtonPress:register(function (l, context, vehicle, player, buttonName)
                    if buttonName == "MISSION_TURNON" and server.getVehicleButton(vehicle.id, buttonName).on then
                        server.announce("ok", "button pressed")

                        local popup = LifeBoatAPI.UIPopup:new(nil, "Ohh, it's moving...\n\nIt's...\n\nIt's...", 0, 1, 0, 100, jack, true)
                        LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 180)
                        self:attach(popup)
                        
                        -- wait 120 seconds and see if the max height was achieved
                        LifeBoatAPI.CoroutineUtils.delay(200)
                        :andImmediately(function (cr, deltaTicks, lastResult)
                            local dial, success = server.getVehicleDial(vehicle.id, "LBJACKLIFTER")
                            if success and dial.value > 1 then

                                local popup = LifeBoatAPI.UIPopup:new(nil, "It's...Working!\n\nCome over and let's talk!", 0, 1, 0, 100, jack, true)
                                LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
                                    :andThen(function (cr, deltaTicks, lastResult)
                                        self.parent:next("WaitForSpawn")
                                    end)
                                self:attach(popup)
                                
                            else
                                local popup = LifeBoatAPI.UIPopup:new(nil, "It's...\n\nStill broken...\n\nMaybe have another try in the workbench.", 0, 1, 0, 100, jack, true)
                                LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 180)
                                    :andThen(function (cr, deltaTicks, lastResult)
                                        self.parent:next("WaitForSpawn")
                                    end)
                                self:attach(popup)
                            end
                        end)
                    end
                end)
                self:attach(onButton)
            end
        end)

        --- 3.3 The lifter is fixed, we can return to the main flow
        local testSuccess = fixQuest:addNamedStage("TestSuccess", function (self, savedata, params)
            server.announce("part 3.3", "success")
            local mainsave = self.parent.parent.savedata

            -- retrieve the actual Jack instance object
            local jack = LB.objects:getNPC(mainsave.jackID)
            local zone = jack.childZones[1]

            local jackDialogModel = LifeBoatAPI.Dialog:new({
                { id="start",       text = "Thanks for fixing it!\n\nYou've done a great job.", result={hasSpokenOnce=true}},
                {                   text = "I know I'm asking a lot.\n\nBut could you give it a lick of paint too?",
                                        choices={ {phrase="ok", next="accept", result={paintJob=true}},
                                                  {phrase="reward", next="reward"},
                                                  {phrase="no", next="basic"}}, showChoices=true},
                            
                { id="reward",      text = "Well, I owe you $5000 for the main job"},
                {                   text = "I can throw in an extra $2500.\n\nIf you re-paint it for me",
                                        choices= { {phrase="ok",   next="accept", result={paintJob=true}},
                                                   {phrase="nope", next="basic"}}, showChoices=true },
            
                { id="accept",      text = "Great!\n\nJust paint it up, then bring it back to me."},
                {                   text = "I'll be back over by my truck", terminate=true},

                { id="basic",       text = "No worries."},
                { id="repeat",      text = "If you can bring it back over to my truck\n\nThen I'll pay you there."},
                {                   text = "Thanks again!", terminate=true},
            }, 120)
    
            -- simple dialog handling
            local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "",
                function (dialog)
                    -- when starting the dialog, decide the starting point by previous options picked
                    -- if you rudley cut out, you miss out on the side quest - that's your own fault.
                    dialog:gotoNextLine(savedata.hasSpokenOnce and "repeat" or "start")
                end,
                function (l, context, dialog, results, player)
                    -- on dialog ended, save the results
                    LifeBoatAPI.lb_copy(results, savedata)
                    if results.paintJob then
                        mainsave.wasPaintJobOffered = true
                        server.notify(-1, "Additional Task", "Scrape off the rust and re-paint Jack's lifter for an extra $2500", LifeBoatAPI.Constants.NotifiationTypes.new_mission)
                    end
                end)
            self:attach(dialogHandler)

            -- track if a paintjob was done (vehicle respawned, is the best we can do really)
            -- we only need to listen to it once
            local listener = LB.events.onVehicleSpawn:register(function (l, context, vehicleID, peerID, x, y, z, cost)
                if peerID >= 0 then
                    local vehicle = LifeBoatAPI.Vehicle:fromUntrackedSpawn(vehicleID, peerID, cost)
                    
                    vehicle:awaitLoaded()
                    :andThen(function (cr, deltaTicks, lastResult)
                        local dial, success = server.getVehicleDial(vehicleID, "LBJACKLIFTER")
                        if success then
                            mainsave.lifterID = vehicle.id
                            mainsave.wasPaintJobComplete = savedata.paintJob -- can't get the paintjob bonus if you didn't even listen to him
                            l.isDisposed = true
                        end
                    end)
                end
            end)
            self:attach(listener)

            -- wait for the it to be done (lets us talk to jack in the meantime)
            local lifterReturnZone = LB.objects:getZone(mainsave.lifterReturnZoneID)
            local collisionListener = lifterReturnZone.onCollision:register(function (l, context, zone, collision, collidingWith)
                if collidingWith.id == mainsave.lifterID then
                    self.parent:next()
                end
            end)
            self:attach(collisionListener)
        end)


        --- 3.4 Optional quest to repaint the lifter, or return it
        fixQuest:addNamedStage("RepaintAndReturn", function (self, savedata, params)
            server.announce("part 3.4", "success")
            local mainsave = self.parent.parent.savedata

            -- retrieve the actual Jack instance object
            local jack = LB.objects:getNPC(mainsave.jackID)
            local zone = jack.childZones[1]

            local jackDialogModel = LifeBoatAPI.Dialog:new({
                { id="start",       text = "Thanks for fixing it!\n\nYou've done a great job.", result={hasSpokenOnce=true}},
                {                   text = "I know I'm asking a lot.\n\nBut could you give it a lick of paint too?",
                                    choices={ {phrase="ok", next="accept", result={paintJob=true}},
                                                {phrase="reward", next="reward"},
                                                {phrase="no", next="basic"}}, showChoices=true},
                            
                { id="reward",      text = "Well, I owe you $5000 for the main job"},
                {                   text = "I can throw in an extra $2500.\n\nIf you re-paint it for me",
                                    choices= { {phrase="ok",   next="accept", result={paintJob=true}},
                                                {phrase="nope", next="basic"}}, showChoices=true },
            
                { id="accept",      text = "Great!\n\nJust paint it up, then bring it back to me."},
                {                   text = "I'll be back over by my truck", terminate=true},

                { id="basic",       text = "No worries."},
                { id="repeat",      text = "If you can bring it back over to my truck\n\nThen I'll pay you there."},
                {                   text = "Thanks again!", terminate=true},
            }, 120)
    
            -- simple dialog handling
            local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "",
                function (dialog)
                    -- when starting the dialog, decide the starting point by previous options picked
                    -- if you rudley cut out, you miss out on the side quest - that's your own fault.
                    dialog:gotoNextLine(savedata.hasSpokenOnce and "repeat" or "start")
                end,
                function (l, context, dialog, results, player)
                    -- on dialog ended, save the results
                    LifeBoatAPI.lb_copy(results, savedata)
                    if results.paintJob then
                        server.notify(-1, "Additional Task", "Scrape off the rust and re-paint Jack's lifter for an extra $2500", LifeBoatAPI.Constants.NotifiationTypes.new_mission)
                        self:terminate()
                    end
                end)
    
            self:attach(dialogHandler)


            -- loop back for testing purposes
            self.parent:next("WaitForSpawn")
        end)

    -- 4. The lifter is fixed, and Jack wants to use it, or something like that
    Mission_JacksQuest:addStage(function (self, savedata, params)
        server.announce("complete,ish", "use this to go *back* to a stage if we mess up")
        self.parent:next("FixLifter")
    end)

    Mission_JacksQuest:addStage(function (self, savedata, params)
        server.announce("ish3332", "use this to go *back* to a stage if we mess up")
    end)