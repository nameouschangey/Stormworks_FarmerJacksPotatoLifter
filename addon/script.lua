-- NameousChangey 2022
-- FarmerJack Test Addon - As proof of concept for LifeBoatAPI addon code 

require("LifeBoatAPI")

require("JacksQuest")



LB.events.onCreate:register(function (l, context)
    -- run Jack's Quest mission on create, as it has no pre-requisites
    local instance = Mission_JacksQuest:startUnique()
    instance.onComplete:register(function (l, context, mission)
        server.announce("Jacks Quest", "Complete from Init Callback!")
    end)
end)


onCreate = function(isWorldCreate)
	server.announce("FarmerJack Test Addon", "Reloaded - by Nameous")
	
	-- Initialize LB settings, and pick which (of the more expensive, e.g. vehicleDamage) events to care about
	LB.events.trackPlayerChat = true
	LB:init()
end




























--[[

NON MISSION DEBUG/HELPERS
DO NOT INCLUDE IN MISSION NOW THIS IS ALL TESTED
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