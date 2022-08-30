-- NameousChangey 2022
-- FarmerJack Test Addon - As proof of concept for LifeBoatAPI addon code 

require("LifeBoatAPI")


--[[ Overall Jacks-Quest storyline, made of multiple missions/chapters]]
local jacksQuest = LifeBoatAPI.Mission:new("Jacks Forkin' Lift")

jacksQuest:addStage(function (mission, stage, savedata, params)
    server.announce("Jacks Quest", "startup")
    -- spawn
    if g_savedata.jacksQuestComplete then
        return -- sit idly on this stage forever, mission is already complete; can't repeat it 
    end

    local location = LB.addons.this.locationsByName["Location1"]
    local tilePosition = location:getPosition()
    savedata.jackID = location.componentsByName["FarmerJack"]:spawnRelativeToPosition(tilePosition).id
    
    mission:next()
end)


jacksQuest:addNamedStage("offer_quest", function (mission, stage, missionSave, stageSave, params)
    server.announce("Jacks Quest", "offer_quest")

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

    local jack = LB.objects:getNPC(missionSave.jackID)
    local zone = jack.childZones[1]

    local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "Oh, well goodbye I guess!",
    function (dialog)
        -- when starting the dialog, decide the starting point by previous options picked
        dialog:gotoNextLine(stageSave.hasAccepted and "accept" or stageSave.hasSpokenOnce and "altstart" or "start")
    end,
    function (l, context, dialog, results, player)
        -- on dialog ended, save the results
        LifeBoatAPI.lb_copy(results, stageSave)
        if results.missionAccepted then
            server.notify(-1, "Jack's Forkin' Lift", "Take Jack's forklift to the workbench\n\nAnd fix it so the forks life again.", 0)
        end
    end)

    stage:attach(dialogHandler)
end)


jacksQuest:addNamedStage("accept_quest", function (mission, stage, savedata, params)
    stage:attach(
        LifeBoatAPI.CoroutineUtils.delay(360)
        :andThen(function (cr, deltaTicks, lastResult)
            server.announce("Jack's Quest", "Complete!")
            local jack = LB.objects:getNPC(savedata.jackID)
            if jack then
                jack:despawn()
            end
            mission:next()
        end))
end)


onCreate = function(isWorldCreate)
	server.announce("FarmerJack Test Addon", "Reloaded - by Nameous")
	
	-- Initialize LB settings, and pick which (of the more expensive, e.g. vehicleDamage) events to care about
	LB.events.trackPlayerChat = true
	LB:init()

    local instance = jacksQuest:startUnique()
    instance.onComplete:register(function (l, context, mission)
        --server.announce("Jacks Quest", "Complete from Init Callback!")
    end)

end
--[[

    LB.events.trackButtonPress = true
    LB.events.trackPlayerChat = true
    LB.events.trackPlayerCommand = true
    LB.events.trackPlayerLife = false
    LB.events.trackPlayerMap = false
    LB.events.trackPlayerSpawnVehicle = false
    LB.events.trackSitUnsit = false
    LB.events.trackVehicleTeleport = false
    LB.events.trackVehicleDamage = false -- we're not a combat plugin, not needed here at all
    -- rarely needed: LB.players.enablePlayerSaveTracking = true
]]

LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
    local args = {...}

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