-- Author: Nameous Changey
-- GitHub: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension
-- Workshop: https://steamcommunity.com/id/Bilkokuya/myworkshopfiles/?appid=573090
--
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey

--[[ Overall Jacks-Quest storyline, made of multiple missions/chapters]]
Mission_JacksQuest = LifeBoatAPI.Mission:new("Jacks Forkin' Lift", function (self, savedata, params)
    server.announce("Jacks Quest", "startup/spawn")
    -- spawn
    if g_savedata.jacksQuestComplete then
        self:terminate()
        return -- sit idly on this stage forever, mission is already complete; can't repeat it 
    end

    -- if we've not yet spawned the stuff needed for the mission, spawn it
    if not savedata.isSpawned then
        local location = LB.addons.this.locationsByName["FixTheLifter"]
        local tilePosition = location:getPosition()

        savedata.jackID           = location.componentsByName["FarmerJack"]:spawnRelativeToPosition(tilePosition).id
        savedata.lifterID         = location.componentsByName["JacksLifter"]:spawnRelativeToPosition(tilePosition).id
        savedata.lifterReturnZoneID = location.componentsByName["LifterReturnZone"]:spawnRelativeToPosition(tilePosition).id
        savedata.workbenchZoneID    = location.componentsByName["WorkbenchZone"]:spawnRelativeToPosition(tilePosition).id
        savedata.propsID          = location:spawnMultipleRelativeToPosition(tilePosition, function (component) return component.tags["isProp"] end).id
        savedata.isSpawned = true;
    end

    -- attach all our spawned stuff to this mission, so it automatically despawns/gets cleaned up when we're done
    LifeBoatAPI.lb_attachMultiple(self,
        LB.objects:getNPC(savedata.jackID),
        LB.objects:getVehicle(savedata.lifterID),
        LB.objects:getZone(savedata.lifterReturnZoneID),
        LB.objects:getZone(savedata.workbenchZoneID),
        LB.objects:getObjectCollection(savedata.propsID)
    )
end)

--[[ MISSION STAGES ]]

    -- 1. Jack offers you the quest
    Mission_JacksQuest:addStage(function (self, savedata, params)
        server.announce("offer_quest", "Jack has a quest for us")

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
        local jack = LB.objects:getNPC(self.parent.savedata.jackID)
        local zone = jack.childZones[1]

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
                    server.notify(-1, "Jack's Forkin' Lift", "Take Jack's forklift to the workbench\n\nAnd fix it so the forks life again.", 0)
                    server.announce("terminating", "manually")
                    self:terminate()
                    server.announce("post-terminating", "manually")
                end
            end)

        self:attach(dialogHandler)
    end)


    Mission_JacksQuest:addNamedStage("accept_quest", function (self, savedata, params)
        server.announce("accept_quest", "We've accepted the quest! Cool")

        LifeBoatAPI.CoroutineUtils.delay(300)
            :andThen(function (cr, deltaTicks, lastResult)
                server.announce("finished", "timer run out, everything should be despawning")
                self:terminate()
            end)
    end)