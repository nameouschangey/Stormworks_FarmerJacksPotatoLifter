-- NameousChangey 2022
-- FarmerJack Test Addon - As proof of concept for LifeBoatAPI addon code 

require("LifeBoatAPI")


--[[ Overall Jacks-Quest storyline, made of multiple missions/chapters]]
local jacksQuest = LifeBoatAPI.Mission:new("Jacks Forkin' Lift", function (self, savedata, params)
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
    jacksQuest:addStage(function (self, savedata, params)
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


    jacksQuest:addNamedStage("accept_quest", function (self, savedata, params)
        server.announce("accept_quest", "We've accepted the quest! Cool")

        LifeBoatAPI.CoroutineUtils.delay(300)
            :andThen(function (cr, deltaTicks, lastResult)
                server.announce("finished", "timer run out, everything should be despawning")
                self:terminate()
            end)
    end)

onCreate = function(isWorldCreate)
	server.announce("FarmerJack Test Addon", "Reloaded - by Nameous")
	
	-- Initialize LB settings, and pick which (of the more expensive, e.g. vehicleDamage) events to care about
	LB.events.trackPlayerChat = true
	LB:init()

    local instance = jacksQuest:startUnique()
    instance.onComplete:register(function (l, context, mission)
        server.announce("Jacks Quest", "Complete from Init Callback!")
    end)

end

LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
    local args = {...}

    if command == "?edit" then
        server.announce("setting vehicle editable", tostring(lifterID))
        server.setVehicleEditable(lifterID, true)
    end
    if command == "?reset" then

        --clear chat
        server.announce("", string.rep("_\n", 20))

        -- clear all
        local clear = function(list)
            for k,v in pairs(list) do
                LifeBoatAPI.lb_dispose(v)
            end
        end;
        clear(LB.objects.objectsByID)
        clear(LB.objects.vehiclesByID)
        clear(LB.objects.zonesByID)
        clear(LB.objects.npcsByID)
        clear(LB.objects.firesByID)
        clear(LB.ui.uiByID)
        clear(LB.missions.missionsByID)

        -- clear g_savedata
        g_savedata = {}
    end


    if command == "?clearchat" then
        server.announce("", string.rep("_\n", 20))
    end
    if command == "?objects" then
        local print = function(list)
            for k,v in pairs(list) do
                server.announce("object", tostring(k) .. " -> " .. tostring(v))
            end
        end;
        print(LB.objects.savedata.objectsByID)
        print(LB.objects.savedata.vehiclesByID)
        print(LB.objects.savedata.zonesByID)
        print(LB.objects.savedata.npcsByID)
        print(LB.objects.savedata.firesByID)
    end

    if command == "?testnotify" then
        server.notify(-1, "TEST NOTIFICATION", "I'm in the zone!\nAnd this is actually a long story, but can you help us? Our ship is sunk.\n\n['ok', 'who', 'no']", 8)
    end

    if command == "?objectscount" then
        local total = 0
        local print = function(list)
            for k,v in pairs(list) do
                total = total + 1
            end
        end;
        print(LB.objects.savedata.objectsByID)
        print(LB.objects.savedata.vehiclesByID)
        print(LB.objects.savedata.npcsByID)
        print(LB.objects.savedata.firesByID)

        server.announce("total objects", tostring(total))
    end
    
    if command == "?zonescount" then
        local total = 0
        local print = function(list)
            for k,v in pairs(list) do
                total = total + 1
            end
        end;
        print(LB.objects.savedata.zonesByID)
        server.announce("total zones", tostring(total))
    end

    if command == "?clear" then
        ---@param list LifeBoatAPI.GameObject[]
        local clear = function(list)
            for k,v in pairs(list) do
                v:despawn()
            end
        end;
        clear(LB.objects.objectsByID)
        clear(LB.objects.vehiclesByID)
        clear(LB.objects.zonesByID)
        clear(LB.objects.npcsByID)
        clear(LB.objects.firesByID)
    end

    if command == "?uicount" then
        local total = 0
        local print = function(list)
            for k,v in pairs(list) do
                total = total + 1
            end
        end;
        print(LB.ui.uiByID)
        server.announce("total zones", tostring(total))
    end

    if command == "?uisavedcount" then
        local total = 0
        local print = function(list)
            for k,v in pairs(list) do
                total = total + 1
            end
        end;
        print(LB.ui.savedata.uiByID)
        server.announce("total zones", tostring(total))
    end

    if command == "?clearUI" then
        ---@param list LifeBoatAPI.GameObject[]
        local clear = function(list)
            for k,v in pairs(list) do
                v:despawn()
            end
        end;
        clear(LB.ui.uiByID)
    end

    if command == "?spawnobj" then
        local location = LB.addons.this.locations[1]
        local tilePosition = LB.players.players[1]:getTransform() -- location:getPosition()
        for i=1, (tonumber(args[1]) or 1) do
            local obj = location.componentsByName["object1"]:spawnRelativeToPosition(tilePosition)
            if not obj then
                server.announce("spawn failed", tostring(i))
            end
        end
    end


end)