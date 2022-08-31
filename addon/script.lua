-- NameousChangey 2022
-- FarmerJack Test Addon - As proof of concept for LifeBoatAPI addon code 

require("LifeBoatAPI")

require("JacksQuest")



LB.events.onCreate:register(function (l, context)
    -- run Jack's Quest mission on create, as it has no pre-requisites
    Mission_JacksQuest:startUnique()
end)


onCreate = function(isWorldCreate)
	-- Initialize LB settings, and pick which (of the more expensive, e.g. vehicleDamage) events to care about
	LB.events.trackPlayerChat = true
    LB.events.trackButtonPress = true
	LB:init()
end


LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
    local args = {...}

    if command == "?lb_reset" then
        --clear chat
        --server.announce("", string.rep("_\n", 20))

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
        g_savedata.jacksQuestComplete = false
        Mission_JacksQuest:startUnique()
    end
end)