 

LifeBoatAPI = LifeBoatAPI or {}

LifeBoatAPI.Bitwise = {

    bitFlagsToNumber = function(flags)
        local result = 0;
        for i=1, 24 do
            result = result | (flags[i] and 1 or 0) << (i-1)
        end
        return result
    end;

    numberToBitFlags = function(bytes)
        local flags = {}
        for i=1, 24 do
            local bitVal = bytes & (1 << (i-1))
            flags[i] = bitVal > 0 
        end
        return flags
    end;
}

LifeBoatAPI.Constants = {
    AddonComponentTypes = {
        zone = 0, 
        object = 1, 
        character = 2, 
        vehicle = 3, 
        flare = 4, 
        fire = 5, 
        loot = 6, 
        button = 7, 
        animal = 8, 
        ice = 9, 
        cargo_zone = 10,
    };

    DynamicObjectTypes = {
        none = 0,
        character = 1,
        crate_small = 2,
        collectable = 3,    
        basketball = 4,
        television = 5,
        barrel = 6,
        schematic = 7,      
        debris = 8,         
        chair = 9,
        trolley_food = 10,
        trolley_med = 11,
        clothing = 12,      
        office_chair = 13,
        book = 14,
        bottle = 15,
        fryingpan = 16,
        mug = 17,
        saucepan = 18,
        stool = 19,
        telescope = 20,
        log = 21,
        bin = 22,
        book_2 = 23,
        loot = 24,
        blue_barrel = 25,
        buoyancy_ring = 26,
        container = 27,
        gas_canister = 28,
        pallet = 29,
        storage_bin = 30,
        fire_extinguisher = 31,
        trolley_tool = 32,
        cafetiere = 33,
        drawers_tools = 34,
        glass = 35,
        microwave = 36,
        plate = 37,
        box_closed = 38,
        box_open = 39,
        desk_lamp = 40,
        eraser_board = 41,
        folder = 42,
        funnel = 43,
        lamp = 44,
        microscope = 45,
        notebook = 46,
        pen_marker = 47,
        pencil = 48,
        scales = 49,
        science_beaker = 50,
        science_cylinder = 51,
        science_flask = 52,
        tub_1 = 53,
        tub_2 = 54,
        filestack = 55,
        barrel_toxic = 56,
        flare = 57,
        fire = 58,
        animal = 59,
        map_label = 60,  
        iceberg = 61,    
        gun_flare = 62,
        _vehicle_flare = 63,
        ammo_shell = 64,
        binoculars = 65,
        C4 = 66,
        grenade = 67,
        vehicle_flare = 68,
        coal = 69,
        meteorite = 70,
        glowstick = 71,
    };

    TankFluidTypes = {
        freshwater = 0,
        diesel = 1,
        jetfuel = 2,
        air = 3,
        exhaust = 4,
        oil = 5,
        seawater = 6,
        steam = 7
    };

    GameSettings = {
        third_person = "third_person", 
        third_person_vehicle = "third_person_vehicle", 
        vehicle_damage = "vehicle_damage", 
        player_damage = "player_damage", 
        npc_damage = "npc_damage", 
        sharks = "sharks", 
        fast_travel = "fast_travel", 
        teleport_vehicle = "teleport_vehicle", 
        rogue_mode = "rogue_mode", 
        auto_refuel = "auto_refuel", 
        megalodon = "megalodon", 
        map_show_players = "map_show_players", 
        map_show_vehicles = "map_show_vehicles", 
        show_3d_waypoints = "show_3d_waypoints", 
        show_name_plates = "show_name_plates", 
        day_night_length = "day_night_length",  
        sunrise = "sunrise",  
        sunset = "sunset",  
        infinite_money = "infinite_money", 
        settings_menu = "settings_menu", 
        unlock_all_islands = "unlock_all_islands", 
        infinite_batteries = "infinite_batteries", 
        infinite_fuel = "infinite_fuel", 
        engine_overheating = "engine_overheating", 
        no_clip = "no_clip", 
        map_teleport = "map_teleport", 
        cleanup_vehicle = "cleanup_vehicle", 
        clear_fow = "clear_fow",  
        vehicle_spawning = "vehicle_spawning", 
        photo_mode = "photo_mode", 
        respawning = "respawning", 
        settings_menu_lock = "settings_menu_lock", 
        despawn_on_leave = "despawn_on_leave",  
        unlock_all_components = "unlock_all_components", 
        override_weather = "override_weather",
    };

    LabelTypes = {
        none = 0,
        cross = 1,
        wreckage = 2,
        terminal = 3,
        military = 4,
        heritage = 5,
        rig = 6,
        industrial = 7,
        hospital = 8,
        science = 9,
        airport = 10,
        coastguard = 11,
        lighthouse = 12,
        fuel = 13,
        fuel_sell = 14
    };

    PositionTypes = {
        fixed = 0,
        vehicle = 1,
        object = 2
    };

    MarkerTypes = {
        delivery_target = 0,
        survivor = 1,
        object = 2,
        waypoint = 3,
        tutorial = 4,
        fire = 5,
        shark = 6,
        ice = 7,
        search_radius = 8,
        flag_1 = 9,
        flag_2 = 10,
        house = 11,
        car = 12,
        plane = 13,
        tank = 14,
        heli = 15,
        ship = 16,
        boat = 17,
        attack = 18,
        defend = 19
    };

    NotifiationTypes = {
        new_mission = 0,
        new_mission_critical = 1,
        failed_mission = 2,
        failed_mission_critical = 3,
        complete_mission = 4,
        network_connect = 5,
        network_disconnect = 6,
        network_info = 7,
        chat_message = 8,
        network_info_critical = 9
    };

    OutfitType = {
        none = 0,
        worker = 1,
        fishing = 2,
        waiter = 3,
        swimsuit = 4,
        military = 5,
        office = 6,
        police = 7,
        science = 8,
        medical = 9,
        wetsuit = 10,
        civilian = 11
    };

    AnimalTypes = {
        shark = 0,
        whale = 1,
        seal = 2,
        penguin = 3
    };

    EquipmentSlotNumber = {
        Large_Equipment_Slot1 = 1,
        Small_Equipment_Slot2 = 2,
        Small_Equipment_Slot3 = 3,
        Small_Equipment_Slot4 = 4,
        Small_Equipment_Slot5 = 5,
        Outfit_Slot = 6
    };

    EquipmentTypes = { 
        none = 0,
        diving = 1,
        firefighter = 2,
        scuba = 3,
        parachute = 4,                  
        arctic = 5,
        hazmat = 29,
        binoculars = 6,
        cable = 7,
        compass = 8,
        defibrillator = 9,              
        fire_extinguisher = 10,         
        first_aid = 11,                 
        flare = 12,                     
        flaregun = 13,                  
        flaregun_ammo = 14,             
        flashlight = 15,                
        hose = 16,                      
        night_vision_binoculars = 17,   
        oxygen_mask = 18,               
        radio = 19,                     
        radio_signal_locator = 20,      
        remote_control = 21,            
        rope = 22,                
        strobe_light = 23,              
        strobe_light_infrared = 24,     
        transponder = 25,               
        underwater_welding_torch = 26,  
        welding_torch = 27,             
        coal = 28,
        radiation_detector = 30,        
        c4 = 31,                        
        c4_detonator = 32,      
        speargun = 33,                  
        speargun_ammo = 34,         
        pistol = 35,                    
        pistol_ammo = 36,           
        smg = 37,                       
        smg_ammo = 38,              
        rifle = 39,                     
        rifle_ammo = 40,            
        grenade = 41,                   
        machine_gun_ammo_box_k = 42,
        machine_gun_ammo_box_he = 43,
        machine_gun_ammo_box_he_frag = 44,
        machine_gun_ammo_box_ap = 45,
        machine_gun_ammo_box_i = 46,
        light_auto_ammo_box_k = 47,
        light_auto_ammo_box_he = 48,
        light_auto_ammo_box_he_frag = 49,
        light_auto_ammo_box_ap = 50,
        light_auto_ammo_box_i = 51,
        rotary_auto_ammo_box_k = 52,
        rotary_auto_ammo_box_he = 53,
        rotary_auto_ammo_box_he_frag = 54,
        rotary_auto_ammo_box_ap = 55,
        rotary_auto_ammo_box_i = 56,
        heavy_auto_ammo_box_k = 57,
        heavy_auto_ammo_box_he = 58,
        heavy_auto_ammo_box_he_frag = 59,
        heavy_auto_ammo_box_ap = 60,
        heavy_auto_ammo_box_i = 61,
        battle_shell_k = 62,
        battle_shell_he = 63,
        battle_shell_he_frag = 64,
        battle_shell_ap = 65,
        battle_shell_i = 66,
        artillery_shell_k = 67,
        artillery_shell_he = 68,
        artillery_shell_he_frag = 69,
        artillery_shell_ap = 70,
        artillery_shell_i = 71,
        chemlight = 72
    };

}

LifeBoatAPI.CoroutineUtils = {

    disposeAfterDelay = function(disposable, numTicks)
        local cr = LifeBoatAPI.Coroutine:start(nil, true)
        LB.ticks:register(function (listener, context, deltaGameTicks) 
            if disposable.onDispose or disposable.disposables then
                LifeBoatAPI.lb_dispose(disposable)
            else
                disposable.isDisposed = true
            end
            cr:trigger()
        end, nil, -1, numTicks)
        return cr
    end;

    delay = function(numTicks)
        local cr = LifeBoatAPI.Coroutine:start(nil, true)
        LB.ticks:register(function() cr:trigger() end, cr, -1, numTicks, nil, true); 
        return cr
    end;

    awaitAll = function(...)
        local coroutines = {...}
        local awaitAllRoutine = LifeBoatAPI.Coroutine:start(nil, true)

        local results = {} 

        local numToAwait = 0
        for i=1, #coroutines do
            local coroutine = coroutines[i]

            if coroutine.status == 2 or coroutine.isDisposed then
                if coroutine.lastResult then
                    results[i] = coroutine.lastResult
                end
            else
                numToAwait = numToAwait + 1

                coroutine.listeners[#coroutine.listeners+1] = {
                    trigger = function(l)
                        l.isDisposed = true 
                        results[i] = coroutine.lastResult

                        numToAwait = numToAwait - 1

                        if numToAwait == 0 then
                            awaitAllRoutine.lastResult = results 
                            awaitAllRoutine:trigger()
                        end
                    end
                }
            end
        end
        
        return awaitAllRoutine
    end;

    awaitAny = function(...)
        local coroutines = {...}
        local cr = LifeBoatAPI.Coroutine:start(nil, true)

        for i=1, #coroutines do
            local coroutine = coroutines[i]
            if coroutine.status==2 or coroutine.isDisposed then
                cr.lastResult = coroutine.lastResult
                cr:trigger()
                return cr
            end
        end

        local triggers = {}
        for i=1, #coroutines do
            local coroutine = coroutines[i]
            local trigger = {
                parent = coroutine;
                trigger = function(self)
                    
                    for i=1, #triggers do
                        triggers[i].isDisposed = true 
                    end

                    cr.lastResult = coroutine.lastResult 
                    cr:trigger()
                end
            }
            triggers[#triggers+1] = trigger
            coroutine.listeners[#coroutine.listeners+1] = trigger
        end
        
        return cr
    end;
}

LifeBoatAPI.SimpleDisposable = {
    new = function(cls)
        return {
            disposables = {},

            attach = LifeBoatAPI.lb_attachDisposable
        }
    end;
}

LifeBoatAPI.lb_dispose = function(disposable)
    
    if disposable.disposables then
        local disposablesStack = {disposable}

        local iStack = 1
        local numDisposables = 1
        while iStack <= numDisposables do
            local disposable = disposablesStack[iStack]
            iStack = iStack + 1

            if not disposable.isDisposed then
                if disposable.disposables then
                    for i=1, #disposable.disposables do
                        numDisposables = numDisposables + 1
                        disposablesStack[numDisposables] = disposable.disposables[i]
                    end
                end
                disposable.isDisposed = true
                if disposable.onDispose then
                    disposable:onDispose()
                end
            end
        end
    else
        
        disposable.isDisposed = true
        if disposable.onDispose then
            disposable:onDispose()
        end
    end
end;

LifeBoatAPI.lb_attachMultiple = function(self, ...)
    local children = {...}
    for i=1, #children do
        local child = children[i]
        if not self.isDisposed then
            self.disposables = self.disposables or {}
            self.disposables[#self.disposables+1] = child
        else
            
            LifeBoatAPI.lb_dispose(child)
        end
    end
end;

LifeBoatAPI.lb_attachDisposable = function(self, child)
    if not self.isDisposed then
        self.disposables = self.disposables or {}
        self.disposables[#self.disposables+1] = child
    else
        
        LifeBoatAPI.lb_dispose(child)
    end
end;

LifeBoatAPI.lb_empty = function()end

LifeBoatAPI.lb_tostring = function(t, indent)
    local typeof = type(t)
    if typeof == "table" then
        indent = (indent or 0)+1
        local s = {}
        for k,v in pairs(t) do
            if type(k) ~= "number" then
                s[#s+1] = string.rep(" ", indent*2) .. "[" .. tostring(k) .. "] = " .. LifeBoatAPI.lb_tostring(v, indent)
            end
        end
        for i=1,#t do
            s[#s+1] = string.rep(" ", indent*2) .. LifeBoatAPI.lb_tostring(t[i])
        end
        return "{\n" .. table.concat(s, ",\n") .. "\n" .. string.rep(" ", (indent-1)*2) .. "}"
    else
        return tostring(t)
    end
end;

LifeBoatAPI.lb_copy = function(parent, child)
    child = child or {}
    
    for k,v in pairs(parent) do
        if child[k] == nil then
            child[k] = v
        end
    end
    return child
end;

LifeBoatAPI.lb_deepcopy = function(parent, child, tablesSeen)
    child = child or {}
    local tablesSeen = tablesSeen or {}
    tablesSeen[parent] = child

    for k,v in pairs(parent) do
        if type(v) == "table" then
            if tablesSeen[v] then
                child[k] = tablesSeen[v]
            else
                child[k] = LifeBoatAPI.lb_deepcopy(v, child[k], tablesSeen)
            end
        elseif child[k] == nil then
            child[k] = v
        end
    end
    return child
end;

LifeBoatAPI.Colliders = {

    isPointInSphere = function(point, sphereCenter, radius)
        local Px,Py,Pz;
        local Sx,Sy,Sz;
        if point[16] then
            Px,Py,Pz = point[13],point[14],point[15]
        else
            Px,Py,Pz = point[1],point[2],point[3]
        end

        if sphereCenter[16] then
            Sx,Sy,Sz = sphereCenter[13],sphereCenter[14],sphereCenter[15]
        else
            Sx,Sy,Sz = sphereCenter[1],sphereCenter[2],sphereCenter[3]
        end

        local dx,dy,dz = Px-Sx, Py-Sy, Pz-Sz
        return (dx*dx)+(dy*dy)+(dz*dz) <= (radius * radius)
    end;

    isLineInSphere = function(point, endPoint, sphereCenter, radius)
        
        local Cx,Cy,Cz;
        if sphereCenter[16] then
            Cx,Cy,Cz = sphereCenter[13],sphereCenter[14],sphereCenter[15]
        else
            Cx,Cy,Cz = sphereCenter[1],sphereCenter[2],sphereCenter[3]
        end

        local Ax,Ay,Az;
        if endPoint[16] then
            Ax,Ay,Az = endPoint[13]-Cx,endPoint[14]-Cy,endPoint[15]-Cz
        else
            Ax,Ay,Az = endPoint[1]-Cx,endPoint[2]-Cy,endPoint[3]-Cz
        end
        
        local Bx,By,Bz;
        if point[16] then
            Bx,By,Bz = point[13]-Cx,point[14]-Cy,point[15]-Cz
        else
            Bx,By,Bz = point[1]-Cx,point[2]-Cy,point[3]-Cz
        end

        local BAx, BAy, BAz = Ax-Bx, Ay-By, Az-Bz
        local BAlen2 = (BAx*BAx) + (BAy*BAy) + (BAz*BAz)

        local BAlen = BAlen2^0.5
        local BAlenR = 1/BAlen
        local BAnx, BAny, BAnz = (BAlenR*BAx), (BAlenR * BAy), (BAlenR * BAz)

        local projection = -(Bx*BAnx)-(By*BAny)-(Bz*BAnz)

        if projection < 0 or BAlen < 0.01 then
            return (Bx*Bx)+(By*By)+(Bz*Bz) <= (radius * radius)

        elseif projection > BAlen then
            return (Ax*Ax)+(Ay*Ay)+(Az*Az) <= (radius*radius)

        else

            local Px,Py,Pz = Bx+(projection*BAnx), By+(projection*BAny), Bz+(projection*BAnz)
            return (Px*Px)+(Py*Py)+(Pz*Pz) <= (radius*radius)
        end
    end;

    isPointInZone = function(point, zoneMatrix, xSize, ySize, zSize)

        local i1,i2,i3, i5,i6,i7, i9,i10,i11 = 
        zoneMatrix[1],        zoneMatrix[5],        zoneMatrix[9],
        zoneMatrix[2],        zoneMatrix[6],        zoneMatrix[10], 
        zoneMatrix[3],        zoneMatrix[7],        zoneMatrix[11] 

        local Ax,Ay,Az;
        if point[16] then
            Ax,Ay,Az = point[13]-zoneMatrix[13], point[14]-zoneMatrix[14], point[15]-zoneMatrix[15]
        else
            Ax,Ay,Az = point[1]-zoneMatrix[13], point[2]-zoneMatrix[14], point[3]-zoneMatrix[15]
        end

        Ax,Ay,Az = (Ax * i1 + Ay * i5 + Az * i9) 
                  ,(Ax * i2 + Ay * i6 + Az * i10)
                  ,(Ax * i3 + Ay * i7 + Az * i11)

        return not ( 
                (Ax >  xSize)
             or (Ax < -xSize)
             or (Ay >  ySize)
             or (Ay < -ySize)
             or (Az >  zSize)
             or (Az < -zSize))
    end;

    isLineInZone = function(point, endPoint, zoneMatrix, xSize, ySize, zSize)

        local i1,i2,i3, i5,i6,i7, i9,i10,i11, i13,i14,i15 = 
            zoneMatrix[1],        zoneMatrix[5],        zoneMatrix[9],
            zoneMatrix[2],        zoneMatrix[6],        zoneMatrix[10], 
            zoneMatrix[3],        zoneMatrix[7],        zoneMatrix[11],
            zoneMatrix[13],       zoneMatrix[14],       zoneMatrix[15]  
        
        local Ax,Ay,Az;
        if point[16] then
            Ax,Ay,Az = point[13]-i13, point[14]-i14, point[15]-i15
        else
            Ax,Ay,Az = point[1]-i13, point[2]-i14, point[3]-i15
        end

        Ax,Ay,Az = (Ax * i1 + Ay * i5 + Az * i9) 
                  ,(Ax * i2 + Ay * i6 + Az * i10)
                  ,(Ax * i3 + Ay * i7 + Az * i11)

        local Bx,By,Bz;
        if endPoint[16] then
            Bx,By,Bz = endPoint[13]-i13, endPoint[14]-i14, endPoint[15]-i15
        else
            Bx,By,Bz = endPoint[1]-i13, endPoint[2]-i14, endPoint[3]-i15
        end

        Bx,By,Bz = (Bx * i1 + By * i5 + Bz * i9) 
                  ,(Bx * i2 + By * i6 + Bz * i10)
                  ,(Bx * i3 + By * i7 + Bz * i11)

        local BAx, BAy, BAz = Ax-Bx, Ay-By, Az-Bz
        local BAlen2 = (BAx*BAx) + (BAy*BAy) + (BAz*BAz)

        local BAlen = BAlen2^0.5
        local BAlenR = 1/BAlen
        local BAnx, BAny, BAnz = (BAlenR*BAx), (BAlenR * BAy), (BAlenR * BAz)

        local projection = -(Bx*BAnx)-(By*BAny)-(Bz*BAnz)

        if projection < 0 or BAlen < 0.01 then
            return not ( 
                (Bx > xSize)
             or (Bx < -xSize)
             or (By > ySize)
             or (By < -ySize)
             or (Bz > zSize)
             or (Bz < -zSize))

        elseif projection > BAlen then
            return not ( 
                (Ax > xSize)
             or (Ax < -xSize)
             or (Ay > ySize)
             or (Ay < -ySize)
             or (Az > zSize)
             or (Az < -zSize))

        else

            local Px,Py,Pz = Bx+(projection*BAnx), By+(projection*BAny), Bz+(projection*BAnz)
            return not ( 
                (Px > xSize)
             or (Px < -xSize)
             or (Py > ySize)
             or (Py < -ySize)
             or (Pz > zSize)
             or (Pz < -zSize))
        end
    end;
}

LifeBoatAPI.Matrix = {

    newMatrix = function(cls, posX, posY, posZ, yaw, pitch, roll)
        yaw     = yaw or 0
        pitch   = pitch or 0
        roll    = roll or 0

        if yaw ~= 0 or pitch ~= 0 or roll ~= 0 then
            
            local sinRoll = roll ~= 0 and math.sin(roll) or 0
            local cosRoll = roll ~= 0 and math.cos(roll) or 1

            local sinYaw = yaw ~= 0 and math.sin(yaw) or 0
            local cosYaw = yaw ~= 0 and math.cos(yaw) or 1

            local sinPitch = pitch ~= 0 and math.sin(pitch) or 0
            local cosPitch = pitch ~= 0 and math.cos(pitch) or 1

            return {
                
                cosRoll*cosYaw,     cosRoll*sinYaw*sinPitch - sinRoll*cosPitch, cosRoll*sinYaw*cosPitch + sinRoll*sinPitch,     0,
                sinRoll*cosYaw,     sinRoll*sinYaw*sinPitch + cosRoll*cosPitch, sinRoll*sinYaw*cosPitch - cosRoll*sinPitch,     0,
                -sinYaw,            cosYaw*sinPitch,                            cosYaw*cosPitch,                                0,
                posX or 0,          posY or 0,                                  posZ or 0,                                      1,
            }
        else
            return {
                1,0,0,0,
                0,1,0,0,
                0,0,1,0,
                posX or 0, posY or 0, posZ or 0, 1,
            }
        end
    end;

    newFacingMatrix = function(cls, position, positionToFace)

        local Mx,My,Mz = position[13],position[14],position[15]
        if position[16] then
            Mx,My,Mz = position[13],position[15],position[15]
        else
            Mx,My,Mz = position[1],position[2],position[3]
        end

        local x,y,z;
        if positionToFace[16] then
            x,y,z = positionToFace[13],positionToFace[15],positionToFace[15]
        else
            x,y,z = positionToFace[1],positionToFace[2],positionToFace[3]
        end

        local Zx,Zy,Zz = x-Mx, y-My, z-Mz

        local Zlen = (Zx*Zx)+(Zy*Zy)+(Zz*Zz)
        if Zlen == 0 then
            Zx,Zy,Zz = 0,0,1
            Zlen = 1
        else
            Zlen = 1/(Zlen^0.5)
            Zx,Zy,Zz = Zx * Zlen, Zy *Zlen, Zz * Zlen
        end

        local Xx, Xy, Xz = Zz, 0, -Zx

        local Xfactor = 0.5 * (3 - (Xx*Xx+Xy*Xy+Xz*Xz))
        Xx,Xy,Xz = Xfactor*Xx, Xfactor*Xy, Xfactor*Xz

        local Yx,Yy,Yz;
        Yx, Yy, Yz = Zy*Xz - Zz*Xy,
                     Zz*Xx - Zx*Xz,
                     Zx*Xy - Zy*Xx

        local Yfactor = 0.5 * (3 - (Yx*Yx+Yy*Yy+Yz*Yz))
        Yx,Yy,Yz = Yfactor*Yx, Yfactor*Yy, Yfactor*Yz
    
        return {
            Xx,Xy,Xz,0,
            Yx,Yy,Yz,0,
            Zx,Zy,Zz,0,
            Mx,My,Mz,1
        }
    end;

    clone = function(m)
        return {
            m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15],m[16]
        }
    end;

    cloneOffset = function(m, x,y,z)
        return {
            m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],
            m[13]+x,m[14]+y,m[15]+z,
            m[16]
        }
    end;

    equals = function(a, b)
        
        return a[1] == b[1]
           and a[2] == b[2]
           and a[3] == b[3]
           and a[4] == b[4]
           and a[5] == b[5]
           and a[6] == b[6]
           and a[7] == b[7]
           and a[8] == b[8]
           and a[9] == b[9]
           and a[10] == b[10]
           and a[11] == b[11]
           and a[12] == b[12]
           and a[13] == b[13]
           and a[14] == b[14]
           and a[15] == b[15]
           and a[16] == b[16]
    end;

    left = function(m)
        return {m[1], m[2], m[3],0}
    end;

    up = function(m)
        return {m[5], m[6], m[7],0}
    end;

    forward = function(m)
        return {m[8], m[9], m[10],0}
    end;

    position = function(m)
        return {m[13],m[14],m[15]}
    end;

    matchPosition = function(a, b)
        if b[16] then
            a[13] = b[13]
            a[14] = b[14]
            a[15] = b[15]
        else
            a[13] = b[1]
            a[14] = b[2]
            a[15] = b[3]
        end
        return a
    end;

    matchRotation = function(a, b)
        a[1] = b[1]
        a[2] = b[2]
        a[3] = b[3]
        a[5] = b[5]
        a[6] = b[6]
        a[7] = b[7]
        a[9] = b[9]
        a[10] = b[10]
        a[11] = b[11]
        return a
    end;

    multiplyMatrix = function(a, b)

        local a1,a2,a3,a5,a6,a7,a9,a10,a11,a13,a14,a15 = a[1],a[2],a[3],a[5],a[6],a[7],a[9],a[10],a[11],a[13],a[14],a[15]
        local b1,b2,b3,b5,b6,b7,b9,b10,b11,b13,b14,b15 = b[1],b[2],b[3],b[5],b[6],b[7],b[9],b[10],b[11],b[13],b[14],b[15]

        return {
            (a1 * b1) + (a2 * b5) + (a3 * b9),
            (a1 * b2) + (a2 * b6) + (a3 * b10),
            (a1 * b3) + (a2 * b7) + (a3 * b11),
            0,
            
            (a5 * b1) + (a6 * b5) + (a7 * b9),
            (a5 * b2) + (a6 * b6) + (a7 * b10),
            (a5 * b3) + (a6 * b7) + (a7 * b11),
            0,
            
            (a9 * b1) + (a10 * b5) + (a11 * b9),
            (a9 * b2) + (a10 * b6) + (a11 * b10),
            (a9 * b3) + (a10 * b7) + (a11 * b11),
            0,
            
            (a13 * b1) + (a14 * b5) + (a15 * b9) + b13,
            (a13 * b2) + (a14 * b6) + (a15 * b10) + b14,
            (a13 * b3) + (a14 * b7) + (a15 * b11) + b15,
            1
        }
    end;

    multiplyVector = function(m, vec)
        local x,y,z,w = vec[1], vec[2], vec[3], vec[4] or 1

        return {
            (x * m[1] + y * m[5] + z * m[9])  + w * m[13],
            (x * m[2] + y * m[6] + z * m[10]) + w * m[14],
            (x * m[3] + y * m[7] + z * m[11]) + w * m[15],
            w
        }

    end;

    invert = function(m)
        local m1,m2,m3, m5,m6,m7, m9,m10,m11 = m[1],m[2],m[3], m[5],m[6],m[7], m[9],m[10],m[11]
    
        local x,y,z = -m[13], -m[14], -m[15]
        local Tx = (x * m1 + y * m2 + z * m3)
        local Ty = (x * m5 + y * m6 + z * m7)
        local Tz = (x * m9 + y * m10 + z * m11)
    
        return {
            m1,        m5,        m9,   0,
            m2,        m6,        m10,  0,
            m3,        m7,        m11,  0,
            Tx,        Ty,        Tz,   1
        }
    end;

    transposeRotation = function (m)
        return {
            m[1],    m[5],    m[9],    m[4],
            m[2],    m[6],    m[10],   m[8],
            m[3],    m[7],    m[11],   m[12],
            m[13],   m[14],   m[15],   m[16]
        }
    end;

    transpose = function (m)
        return {
            m[1],    m[5],    m[9],    m[13],
            m[2],    m[6],    m[10],   m[14],
            m[3],    m[7],    m[11],   m[15],
            m[4],    m[8],    m[12],   m[16]
        }
    end;

    calculateOrthographicError = function(m)
        local Zx,Zy,Zz = m[9],m[10],m[11]
        local Yx,Yy,Yz = m[5],m[6],m[7]

        return 1-(Zx*Yx + Zy*Yy + Zz*Yz)
    end;

    reduceOrthographicError = function(m)
        
        local Yx,Yy,Yz = m[5],m[6],m[7]
        local Zx,Zy,Zz = m[9],m[10],m[11]

        local error = Zx*Yx + Zy*Yy + Zz*Yz
        local halfError = error/2

        Zx,Zy,Zz,Yx,Yy,Yz = Zx - (Yx*halfError),
                            Zy - (Yy*halfError),
                            Zz - (Yz*halfError),
                            Yx - (Zx*halfError),
                            Yy - (Zy*halfError),
                            Yz - (Zz*halfError)

        local Xx,Xy,Xz = Yy*Zz - Yz*Zy,
                         Yz*Zx - Yx*Zz,
                         Yx*Zy - Yy*Zx

        local Xfactor = 0.5 * (3 - (Xx*Xx+Xy*Xy+Xz*Xz))
        Xx,Xy,Xz = Xfactor*Xx, Xfactor*Xy, Xfactor*Xz

        local Yfactor = 0.5 * (3 - (Yx*Yx+Yy*Yy+Yz*Yz))
        Yx,Yy,Yz = Yfactor*Yx, Yfactor*Yy, Yfactor*Yz

        local Zfactor = 0.5 * (3 - (Zx*Zx+Zy*Zy+Zz*Zz))
        Zx,Zy,Zz = Zfactor*Zx, Zfactor*Zy, Zfactor*Zz

        m[1],m[2],m[3] = Xx,Xy,Xz
        m[5],m[6],m[7] = Yx,Yy,Yz
        m[9],m[10],m[11] = Zx,Zy,Zz
        return m
    end;

    fullMultiplyMbtrix = function(a, b)

        local a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16 = a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[16]
        local b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16 = b[1],b[2],b[3],b[4],b[5],b[6],b[7],b[8],b[9],b[10],b[11],b[12],b[13],b[14],b[15],b[16]
        return {
            (a1 * b1) + (a2 * b5) + (a3 * b9) + (a4 * b13),
            (a1 * b2) + (a2 * b6) + (a3 * b10) + (a4 * b14),
            (a1 * b3) + (a2 * b7) + (a3 * b11) + (a4 * b15),
            (a1 * b4) + (a2 * b8) + (a3 * b12) + (a4 * b16),
            
            (a5 * b1) + (a6 * b5) + (a7 * b9) + (a8 * b13),
            (a5 * b2) + (a6 * b6) + (a7 * b10) + (a8 * b14),
            (a5 * b3) + (a6 * b7) + (a7 * b11) + (a8 * b15),
            (a5 * b4) + (a6 * b8) + (a7 * b12) + (a8 * b16),
            
            (a9 * b1) + (a10 * b5) + (a11 * b9) + (a12 * b13),
            (a9 * b2) + (a10 * b6) + (a11 * b10) + (a12 * b14),
            (a9 * b3) + (a10 * b7) + (a11 * b11) + (a12 * b15),
            (a9 * b4) + (a10 * b8) + (a11 * b12) + (a12 * b16),
            
            (a13 * b1) + (a14 * b5) + (a15 * b9) + (a16 * b13),
            (a13 * b2) + (a14 * b6) + (a15 * b10) + (a16 * b14),
            (a13 * b3) + (a14 * b7) + (a15 * b11) + (a16 * b15),
            (a13 * b4) + (a14 * b8) + (a15 * b12) + (a16 * b16)
        }
    end;

    fullMultiplyVector = function(m, vec, skipWNormalization)
        local x,y,z,w = vec[1], vec[2], vec[3], vec[4] or 1

        local wResultReciprocal = skipWNormalization and 1 or (1/(x * m[4] + y * m[8] + z * m[12] + w * m[16]))
        return {
            (x * m[1] + y * m[5] + z * m[9]  + w * m[13]) * wResultReciprocal,
            (x * m[2] + y * m[6] + z * m[10] + w * m[14]) * wResultReciprocal,
            (x * m[3] + y * m[7] + z * m[11] + w * m[15]) * wResultReciprocal,
            w
        }
    end;

    fullInvert = function(m)
        
        local m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16 = m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15],m[16]

        local A2323 = m11 * m16 - m12 * m15;
        local A1323 = m10 * m16 - m12 * m14;
        local A1223 = m10 * m15 - m11 * m14;
        local A0323 = m9 * m16 - m12 * m13;
        local A0223 = m9 * m15 - m11 * m13;
        local A0123 = m9 * m14 - m10 * m13;
                
        local m6A2323 = m6 * A2323;
        local m5A2323 = m5 * A2323;
        local m5A1323 = m5 * A1323;
        local m5A1223 = m5 * A1223;
        local m7A1323 = m7 * A1323;
        local m7A0323 = m7 * A0323;

        local m6A0323 = m6 * A0323;
        local m6A0223 = m6 * A0223;
        local m8A1223 = m8 * A1223;
        local m8A0223 = m8 * A0223;
        local m8A0123 = m8 * A0123;
        local m7A0123 = m7 * A0123;

        local det = m1 * ( m6A2323 - m7A1323 + m8A1223 ) 
                - m2 * ( m5A2323 - m7A0323 + m8A0223 ) 
                + m3 * ( m5A1323 - m6A0323 + m8A0123 ) 
                - m4 * ( m5A1223 - m6A0223 + m7A0123 ) ;

        if det == 0 then
            return m, true 
        end
        
        det = 1 / det;

        local A2313 = m7 * m16 - m8 * m15;
        local A1313 = m6 * m16 - m8 * m14;
        local A1213 = m6 * m15 - m7 * m14;
        local A2312 = m7 * m12 - m8 * m11;
        local A1312 = m6 * m12 - m8 * m10;
        local A1212 = m6 * m11 - m7 * m10;
        local A0313 = m5 * m16 - m8 * m13;
        local A0213 = m5 * m15 - m7 * m13;
        local A0312 = m5 * m12 - m8 * m9;
        local A0212 = m5 * m11 - m7 * m9;
        local A0113 = m5 * m14 - m6 * m13;
        local A0112 = m5 * m10 - m6 * m9;
        
        return {
        det *   ( m6A2323 - m7A1323 + m8A1223 ),
        det * - ( m2 * A2323 - m3 * A1323 + m4 * A1223 ),
        det *   ( m2 * A2313 - m3 * A1313 + m4 * A1213 ),
        det * - ( m2 * A2312 - m3 * A1312 + m4 * A1212 ),
        det * - ( m5A2323 - m7A0323 + m8A0223 ),
        det *   ( m1 * A2323 - m3 * A0323 + m4 * A0223 ),
        det * - ( m1 * A2313 - m3 * A0313 + m4 * A0213 ),
        det *   ( m1 * A2312 - m3 * A0312 + m4 * A0212 ),
        det *   ( m5A1323 - m6A0323 + m8A0123 ),
        det * - ( m1 * A1323 - m2 * A0323 + m4 * A0123 ),
        det *   ( m1 * A1313 - m2 * A0313 + m4 * A0113 ),
        det * - ( m1 * A1312 - m2 * A0312 + m4 * A0112 ),
        det * - ( m5A1223 - m6A0223 + m7A0123 ),
        det *   ( m1 * A1223 - m2 * A0223 + m3 * A0123 ),
        det * - ( m1 * A1213 - m2 * A0213 + m3 * A0113 ),
        det *   ( m1 * A1212 - m2 * A0212 + m3 * A0112 ),
        }
    end;
}

LifeBoatAPI.Fire = {

    fromSavedata = function(cls, savedata)
        
        local parentID = savedata.parentID
        local parentType = savedata.parentType
        local parent;
        if parentID and parentType then
            parent = LB.objects:getByType(parentType, parentID)
        end

        local self = {
            savedata = savedata,
            id = savedata.id,
            transform = savedata.transform,
            parent = parent,
            nextUpdateTick = (parent and 0) or math.maxinteger, 

            onDespawn = LifeBoatAPI.Event:new(),

            getTransform = cls.getTransform,
            attach = LifeBoatAPI.lb_attachDisposable,
            despawn = LifeBoatAPI.GameObject.despawn,
            onDispose = LifeBoatAPI.GameObject.onDispose
        }

        if parentID and not parent then
            LifeBoatAPI.lb_dispose(self)
        elseif parent then
            parent.childFires[#parent.childFires+1] = self
            parent:attach(self)
        end

        if self.isDisposed then
            return self
        end

        self:getTransform()

        local script = LB.objects.onInitScripts[self.savedata.onInitScript]
        if script then
            script(self)
        end

        return self
    end;

    fromAddonSpawn = function(cls, component, spawnData, parent)

        local obj = cls:fromSavedata({
            id = spawnData.id,
            type = "fire",
            tags = component.tags,
            name = component.rawdata.display_name,
            transform = parent and component.rawdata.transform or spawnData.transform,
            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            onInitScript = component.tags["onInitScript"]
        })

        LB.objects:trackEntity(obj)
        return obj
    end;

    getTransform = function(self)
        local parent = self.parent
        if parent then
            
            if parent.nextUpdateTick <= LB.ticks.ticks then
                parent:getTransform()
            end

            if self.nextUpdateTick ~= parent.nextUpdateTick then
                self.transform = LifeBoatAPI.Matrix.multiplyMatrix(self.savedata.transform, parent.transform)
                self.nextUpdateTick = parent.nextUpdateTick
            end
        end
        
        return self.transform
    end;

    onDispose = function(self)

        if self.onDespawn.hasListeners then
            self.onDespawn:trigger(self)
        end
        LB.objects:stopTracking(self)
        server.despawnObject(self.id, true)
    end;
}

LifeBoatAPI.GameObject = {
    despawn = LifeBoatAPI.lb_dispose;

    setCollisionLayer = function(self, layerName)
        if layerName ~= self.savedata.collisionLayer then
            self.savedata.collisionLayer = layerName
            LB.collision:stopTracking(self)
            LB.collision:trackEntity(self)
        end
    end;
}

LifeBoatAPI.Object = {
    
    fromSavedata = function(cls, savedata)
        local self = {
            savedata = savedata,
            id = savedata.id,
            transform = savedata.transform or LifeBoatAPI.Matrix:newMatrix(),
            childFires = {},
            childZones = {},
            nextUpdateTick = 0,

            onLoaded = LifeBoatAPI.Event:new(),
            onDespawn = LifeBoatAPI.Event:new(),
            onCollision = LifeBoatAPI.Event:new(),

            awaitLoaded = cls.awaitLoaded,
            getTransform = cls.getTransform,
            attach = LifeBoatAPI.lb_attachDisposable,
            despawn = LifeBoatAPI.GameObject.despawn,
            onDispose = cls.onDispose,
            isLoaded = cls.isLoaded,
            init = cls.init,
            setCollisionLayer = LifeBoatAPI.GameObject.setCollisionLayer
        }

        return self
    end;

    init = function(self)
        
        self:getTransform()

        local script = LB.objects.onInitScripts[self.savedata.onInitScript]
        if script then
            script(self)
        end
        
        if server.getObjectSimulating(self.id) then
            LB.collision:trackEntity(self)
        end
    end;

    fromAddonSpawn = function(cls, component, spawnData)
        local obj = cls:fromSavedata({
            id = spawnData.id,
            type = component.rawdata.type == "character" and "npc" or "object",
            isAddonSpawn = true,
            tags = component.tags,
            dynamicType = component.rawdata.dynamic_object_type,
            name = component.rawdata.display_name,
            transform = spawnData.transform,
            isStatic = component.tags["isStatic"],
            collisionLayer = not component.tags["isStatic"] and component.tags["collisionLayer"] or nil,
            onInitScript = component.tags["onInitScript"]
        })

        LB.objects:trackEntity(obj)

        return obj
    end;

    fromUntrackedSpawn = function(cls, objectID, isNPC, isStatic, collisionLayer, onInitScript)
        local obj = cls:fromSavedata({
            id = objectID,
            type = isNPC and "npc" or "object",
            isAddonSpawn = false,
            isStatic = isStatic,
            collisionLayer = collisionLayer,
            onInitScript = onInitScript
        })

        obj:init()

        LB.objects:trackEntity(obj)
        
        return obj
    end;

    getTransform = function(self)
        local matrix, success = server.getObjectPos(self.id)
        if success then
            self.lastTransform = self.transform

            self.transform = matrix
            self.nextUpdateTick = LB.ticks.ticks + 30
        else

        end
        return self.transform
    end;

    awaitLoaded = function(self)
        local isLoaded = self:isLoaded()
        if isLoaded then
            return LifeBoatAPI.Coroutine:start()
        else
            return self.onLoaded:await()
        end
    end;

    isLoaded = function(self)
        
        local isLoaded, isSpawned = server.getObjectSimulating(self.id)
        if not isSpawned then
            self:despawn()
            return false
        end
        return isLoaded
    end;

    onDispose = function(self)
        if self.onDespawn.hasListeners then
            self.onDespawn:trigger(self)
        end
        self.isCollisionStopped = true
        LB.objects:stopTracking(self)
        server.despawnObject(self.id, true)
    end;
}

LifeBoatAPI.Player = {

    new = function (cls, peerID, steamID, isAdmin, isAuth, name, savedata)
        savedata.collisionLayer = savedata.collisionLayer or "player"
        savedata.type = "player"
        
        local self = {
            savedata = savedata;
            type = "player";
            id = peerID;
            steamID = steamID;
            isAdmin = isAdmin;
            isAuth = isAuth;
            displayName = name;
            transform = LifeBoatAPI.Matrix:newMatrix(),
            nextUpdateTick = 0,

            onDespawn = LifeBoatAPI.Event:new();
            onTeleport = LifeBoatAPI.Event:new();
            onButtonPress = LifeBoatAPI.Event:new();
            onSeatedChange = LifeBoatAPI.Event:new();
            onSpawnVehicle = LifeBoatAPI.Event:new();
            onAliveChanged = LifeBoatAPI.Event:new();
            onCommand = LifeBoatAPI.Event:new();
            onChat = LifeBoatAPI.Event:new();
            onToggleMap = LifeBoatAPI.Event:new();
            onCollision = LifeBoatAPI.Event:new();

            getTransform = cls.getTransform;
            attach = LifeBoatAPI.lb_attachDisposable,
            awaitLoaded = cls.awaitLoaded;
            onDispose = cls.onDispose;
        }

        self:getTransform()

        LB.collision:trackEntity(self)
        
        return self
    end;

    awaitLoaded = function(self, timeout)
        
        local timePassed = 0
        
        return LifeBoatAPI.Coroutine:start()
        :andImmediately(function (cr, deltaTicks, lastResult)
            
            timeout = timeout + deltaTicks

            local characterID, success = server.getPlayerCharacterID(self.id)
            if success then
                local loadedState, success = server.getObjectSimulating(characterID)
                if success and loadedState then
                    return cr.yield, characterID
                end
            end

            if self.isDisposed then
                return cr.yield, nil, "Player disconnected"
            end

            if timeout and timePassed > timeout then
                return cr.yield, nil, "Timeout reached before loading"
            end

            return cr.loop
        end)
    end;

    getTransform = function(self)
        local matrix, success = server.getPlayerPos(self.id)
        if success then
            self.lastTransform = self.transform
            
            self.transform = matrix
            self.nextUpdateTick = LB.ticks.ticks + 30
        end
        return self.transform
    end;

    onDispose = function(self)
        LB.collision:stopTracking(self)
    end;
}

LifeBoatAPI.Vehicle = {
    
    fromSavedata = function(cls, savedata)
        local self = {
            savedata = savedata,
            id = savedata.id,
            transform = savedata.transform or LifeBoatAPI.Matrix:newMatrix(),
            nextUpdateTick = 0,
            collisionRadius = 0,
            childFires = {},
            childZones = {},

            onDamaged = LifeBoatAPI.Event:new(),
            onTeleport = LifeBoatAPI.Event:new(),
            onButtonPress = LifeBoatAPI.Event:new(),
            onSeatedChange = LifeBoatAPI.Event:new(),
            onLoaded = LifeBoatAPI.Event:new(),
            onDespawn = LifeBoatAPI.Event:new(),
            onCollision = LifeBoatAPI.Event:new(),

            awaitLoaded = cls.awaitLoaded,
            getTransform = cls.getTransform,
            attach = LifeBoatAPI.lb_attachDisposable,
            despawn = LifeBoatAPI.GameObject.despawn,
            onDispose = cls.onDispose,
            init = cls.init,
            setCollisionLayer = LifeBoatAPI.GameObject.setCollisionLayer
        }
        return self
    end;

    init = function(self)
        
        self:getTransform()

        local script = LB.objects.onInitScripts[self.savedata.onInitScript]
        if script then
            script(self)
        end
        
        if server.getVehicleSimulating(self.id) then
            LB.collision:trackEntity(self)
        end
    end;

    fromAddonSpawn = function(cls, component, spawnData)
        local obj = cls:fromSavedata({
            id = spawnData.id,
            type = "vehicle",
            isAddonSpawn = true,
            tags = component.tags,
            dynamicType = component.rawdata.dynamic_object_type,
            name = component.rawdata.display_name,
            transform = spawnData.transform,
            collisionLayer = component.tags["collisionLayer"],
            onInitScript = component.tags["onInitScript"]
        })

        LB.objects:trackEntity(obj)

        return obj
    end;

    fromUntrackedSpawn = function(cls, vehicleID, ownerPeerID, spawnCost, collisionLayer, onInitScript)
        
        local existing = LB.objects:getVehicle(vehicleID)
        if existing then
            return existing
        end

        local obj = cls:fromSavedata({
            id = vehicleID,
            type = "vehicle",
            isAddonSpawn = false,
            ownerSteamID = LB.players.playersByPeerID[ownerPeerID].steamID,
            spawnCost = spawnCost,
            collisionLayer = collisionLayer,
            onInitScript = onInitScript
        })
        
        obj:init()

        LB.objects:trackEntity(obj)

        return obj
    end;

    awaitLoaded = function(self)
        local isLoaded = server.getVehicleSimulating(self.id)
        if isLoaded then
            return LifeBoatAPI.Coroutine:start()
        else
            return self.onLoaded:await()
        end
    end;

    isLoaded = function(self)
        
        local isLoaded, isSpawned = server.getVehicleSimulating(self.id)
        return isLoaded
    end;

    getTransform = function(self)
        local matrix, success = server.getVehiclePos(self.id, 0, 0, 0)
        if success then
            self.lastTransform = self.transform

            self.transform = matrix
            self.nextUpdateTick = LB.ticks.ticks + 30
        end
        return self.transform
    end;

    onDispose = function(self)
        if self.onDespawn.hasListeners then
            self.onDespawn:trigger(self)
        end
        LB.collision:stopTracking(self)
        LB.objects:stopTracking(self)
        server.despawnVehicle(self.id, true)
    end;
}

LifeBoatAPI.Zone = {
    _generateZoneID = function()
        g_savedata.lb_nextZoneID = g_savedata.lb_nextZoneID and (g_savedata.lb_nextZoneID + 1) or 0
        return g_savedata.lb_nextZoneID
    end;

    fromSavedata = function(cls, savedata)
        local parentID = savedata.parentID
        local parentType = savedata.parentType
        local parent;
        if parentID and parentType then
            parent = LB.objects:getByType(parentType, parentID)
        end

        local self = {
            savedata = savedata,
            id = savedata.id,
            transform = savedata.transform,
            parent = parent,
            nextUpdateTick = (parent and 0) or math.maxinteger, 
            
            onDespawn = LifeBoatAPI.Event:new(),
            onCollision = LifeBoatAPI.Event:new(),

            getTransform = cls.getTransform,
            attach = LifeBoatAPI.lb_attachDisposable,
            despawn = LifeBoatAPI.GameObject.despawn,
            onDispose = cls.onDispose,
            setCollisionLayer = LifeBoatAPI.GameObject.setCollisionLayer
        }

        if savedata.collisionType == "box" then
            
            self.boundingRadius = ((savedata.sizeX * savedata.sizeX) + (savedata.sizeY * savedata.sizeY) + (savedata.sizeZ*savedata.sizeZ)) ^ 0.5
        else
            self.boundingRadius = savedata.radius
        end

        if parentID and not parent then
            LifeBoatAPI.lb_dispose(self)
        elseif parent then
            parent.childZones[#parent.childZones+1] = self
            parent:attach(self)
        end

        if self.isDisposed then
            return self
        end

        self:getTransform()

        local script = LB.objects.onInitScripts[self.savedata.onInitScript]
        if script then
            script(self)    
        end
        
        if (not parent) or parent:isLoaded() then
            LB.collision:trackEntity(self)
        end
        
        return self
    end;

    fromAddonSpawn = function(cls, component, transform, parent)
        local obj = cls:fromSavedata({
            id = LifeBoatAPI.Zone._generateZoneID(),
            type = "zone",
            isAddonSpawn = true,
            name = component.rawdata.display_name,
            tags = component.tags,
            collisionType = (component.tags["collisionType"] == "sphere" and "sphere") or "box",
            collisionLayer = component.tags["collisionLayer"],
            transform = parent and component.rawdata.transform or transform,
            radius = component.tags["radius"] and tonumber(component.tags["radius"]) or 0,
            sizeX = component.tags["sizeX"] and tonumber(component.tags["sizeX"]) or 0,
            sizeY = component.tags["sizeY"] and tonumber(component.tags["sizeY"]) or 0,
            sizeZ = component.tags["sizeZ"] and tonumber(component.tags["sizeZ"]) or 0,

            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            onInitScript = component.tags["onInitScript"]
        })

        LB.objects:trackEntity(obj)

        return obj
    end;

    newSphere = function(cls, collisionLayer, transform, radius, parent, onInitScript, isTemporary)
        
        local obj = cls:fromSavedata({
            id = LifeBoatAPI.Zone._generateZoneID(),
            type = "zone",
            collisionType = "sphere",
            transform = transform,
            radius = radius,
            collisionLayer = collisionLayer,
            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            onInitScript = onInitScript
        })

        if not isTemporary and not obj.isDisposed then
            LB.objects:trackEntity(obj)
        end

        return obj
    end;

    newZone = function(cls, collisionLayer, transform, sizeX, sizeY, sizeZ, parent, onInitScript, isTemporary)
        local obj = cls:fromSavedata({
            id = LifeBoatAPI.Zone._generateZoneID(),
            type = "zone",
            collisionType = "box",
            transform = transform,
            sizeX = sizeX,
            sizeY = sizeY,
            sizeZ = sizeZ,
            collisionLayer = collisionLayer,
            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            onInitScript = onInitScript
        })

        if not isTemporary and not obj.isDisposed then
            LB.objects:trackEntity(obj)
        end

        return obj
    end;

    getTransform = function(self)
        local parent = self.parent
        if parent then
            
            if parent.nextUpdateTick <= LB.ticks.ticks then
                parent:getTransform()
            end

            if self.nextUpdateTick ~= parent.nextUpdateTick then
                self.transform = LifeBoatAPI.Matrix.multiplyMatrix(self.savedata.transform, parent.transform)
                self.nextUpdateTick = parent.nextUpdateTick
            end
        end

        return self.transform
    end;

    onDispose = function(self)
        
        LB.collision:stopTracking(self)
        LB.objects:stopTracking(self)
    end;
}

LifeBoatAPI.Object = {
    
    fromSavedata = function(cls, savedata)
        local self = {
            savedata = savedata,
            id = savedata.id,
            transform = savedata.transform or LifeBoatAPI.Matrix:newMatrix(),
            childFires = {},
            childZones = {},
            nextUpdateTick = 0,

            onLoaded = LifeBoatAPI.Event:new(),
            onDespawn = LifeBoatAPI.Event:new(),
            onCollision = LifeBoatAPI.Event:new(),

            awaitLoaded = cls.awaitLoaded,
            getTransform = cls.getTransform,
            attach = LifeBoatAPI.lb_attachDisposable,
            despawn = LifeBoatAPI.GameObject.despawn,
            onDispose = cls.onDispose,
            isLoaded = cls.isLoaded,
            init = cls.init,
            setCollisionLayer = LifeBoatAPI.GameObject.setCollisionLayer
        }

        return self
    end;

    init = function(self)
        
        self:getTransform()

        local script = LB.objects.onInitScripts[self.savedata.onInitScript]
        if script then
            script(self)
        end
        
        if server.getObjectSimulating(self.id) then
            LB.collision:trackEntity(self)
        end
    end;

    fromAddonSpawn = function(cls, component, spawnData)
        local obj = cls:fromSavedata({
            id = spawnData.id,
            type = component.rawdata.type == "character" and "npc" or "object",
            isAddonSpawn = true,
            tags = component.tags,
            dynamicType = component.rawdata.dynamic_object_type,
            name = component.rawdata.display_name,
            transform = spawnData.transform,
            isStatic = component.tags["isStatic"],
            collisionLayer = not component.tags["isStatic"] and component.tags["collisionLayer"] or nil,
            onInitScript = component.tags["onInitScript"]
        })

        LB.objects:trackEntity(obj)

        return obj
    end;

    fromUntrackedSpawn = function(cls, objectID, isNPC, isStatic, collisionLayer, onInitScript)
        local obj = cls:fromSavedata({
            id = objectID,
            type = isNPC and "npc" or "object",
            isAddonSpawn = false,
            isStatic = isStatic,
            collisionLayer = collisionLayer,
            onInitScript = onInitScript
        })

        obj:init()

        LB.objects:trackEntity(obj)
        
        return obj
    end;

    getTransform = function(self)
        local matrix, success = server.getObjectPos(self.id)
        if success then
            self.lastTransform = self.transform

            self.transform = matrix
            self.nextUpdateTick = LB.ticks.ticks + 30
        else

        end
        return self.transform
    end;

    awaitLoaded = function(self)
        local isLoaded = self:isLoaded()
        if isLoaded then
            return LifeBoatAPI.Coroutine:start()
        else
            return self.onLoaded:await()
        end
    end;

    isLoaded = function(self)
        
        local isLoaded, isSpawned = server.getObjectSimulating(self.id)
        if not isSpawned then
            self:despawn()
            return false
        end
        return isLoaded
    end;

    onDispose = function(self)
        if self.onDespawn.hasListeners then
            self.onDespawn:trigger(self)
        end
        self.isCollisionStopped = true
        LB.objects:stopTracking(self)
        server.despawnObject(self.id, true)
    end;
}

LifeBoatAPI.ObjectCollection = {
    _generateID = function()
        g_savedata.lb_nextObjCollectionID = g_savedata.lb_nextObjCollectionID and (g_savedata.lb_nextObjCollectionID + 1) or 0
        return g_savedata.lb_nextObjCollectionID
    end;

    fromSavedata = function(cls, savedata)
        local self = {
            id = savedata.id,
            savedata = savedata,
            objects = {},
            disposables = {},

            despawn = LifeBoatAPI.lb_dispose,
            attach = LifeBoatAPI.lb_attachDisposable,
            addObject = cls.addObject,
        }

        for i=1, #savedata.objects do
            local obj = savedata.objects[i]
            local instance = LB.objects:getByType(obj.type, obj.id)
            self.objects[#self.objects+1] = instance
            self.disposables[#self.disposables+1] = instance
        end

        return self
    end;

    new = function(cls, isTemporary)
        local self = cls:fromSavedata({
            id = cls:_generateID(),
            type = "object_collection",
            objects = {}
        })

        if not isTemporary then
            LB.objects:trackEntity(self)
        end

        return self
    end;

    addObject = function(self, entity)
        self.objects[#self.objects+1] = entity
        self.disposables[#self.disposables+1] = entity
        self.savedata.objects[#self.savedata.objects+1] = {type=entity.savedata.type, id=entity.id}
    end;

    despawn = function(self) end
}

LifeBoatAPI.UIMapLabel = {

    fromSavedata = function(cls, savedata)
        local self = {
            savedata = savedata,
            id = savedata.id,

            despawn = LifeBoatAPI.lb_dispose,
            show = cls.show,
            onDispose = cls.onDispose
        }

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[savedata.steamID]
            if player then
                self:show(player.id)
            end
        end
        
        return self
    end;

    new = function(cls, player, labelType, name, x, z, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "maplabel",
            steamID = player and player.steamID or "all",
            labelType = labelType,
            name = name,
            x = x,
            z = z,
            isTemporary = isTemporary
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    show = function(self, peerID)
        local save = self.savedata
        server.addMapLabel(peerID, self.id, save.labelType, save.name, save.x, save.z)
    end;

    onDispose = function(self)
        server.removeMapLabel(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.UIMapObject = {
    
    fromSavedata = function(cls, savedata)

        local parentID = savedata.parentID
        local parentType = savedata.parentType
        local parent;
        if parentID and parentType then
            parent = LB.objects:getByType(parentType, parentID)
        end

        local self = {
            savedata = savedata,
            id = savedata.id,
            parent = parent,

            despawn = LifeBoatAPI.lb_dispose,
            show = cls.show,
            onDispose = cls.onDispose
        }

        if parentID and not parent then
            LifeBoatAPI.lb_dispose(self)
        elseif parent then
            parent:attach(self)
        end

        if self.isDisposed then
            return self
        end

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[savedata.steamID]
            if player then
                self:show(player.id)
            end
        end

        return self
    end;

    new = function(cls, player, positionType, markerType, x, z, radius, label, hoverLabel, parent, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "mapobject",
            steamID = player and player.steamID or "all",
            positionType = positionType,
            markerType = markerType,
            x = x,
            z = z, 
            parentType = parent and parent.savedata.type,
            parentID = parent and parent.id,
            label = label,
            radius = radius,
            hoverLabel = hoverLabel,
            isTemporary = isTemporary,
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    show = function(self, peerID)
        local save = self.savedata

        if save.parentID then
            server.addMapObject(peerID, save.id, save.positionType, save.markerType, nil, nil, save.x, save.z, save.parentType == "vehicle" and save.parentID or nil, save.parentType ~= "vehicle" and save.parentID or nil, save.label, save.radius, save.hoverLabel)
        else
            server.addMapObject(peerID, save.id, save.positionType, save.markerType, save.x, save.z, nil, nil, nil, nil, save.label, save.radius, save.hoverLabel)
        end
    end;

    onDispose = function(self)
        server.removeMapObject(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.UIPopup = {

    fromSavedata = function(cls, savedata)

        local parentID = savedata.parentID
        local parentType = savedata.parentType
        local parent;
        if parentID and parentType then
            parent = LB.objects:getByType(parentType, parentID)
        end

        local self = {
            savedata = savedata,
            id = savedata.id,
            parent = parent,

            despawn = LifeBoatAPI.lb_dispose,
            onDispose = cls.onDispose,
            show = cls.show,
            edit = cls.edit
        }

        if parentID and not parent then
            LifeBoatAPI.lb_dispose(self)
        elseif parent then
            parent:attach(self)
        end

        if self.isDisposed then
            return self
        end

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[savedata.steamID]
            if player then
                self:show(player.id)
            end
        end

        return self
    end;

    new = function(cls, player, text, x, y, z, renderDistance, parent, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "popup",
            steamID = player and player.steamID or "all",
            x = x,
            y = y,
            z = z,
            text = text,
            renderDistance = renderDistance,
            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            isTemporary = isTemporary,
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    edit = function(self, text, x,y,z, renderDistance)
        local save = self.savedata
        save.text = text or save.text
        save.x = x or save.x
        save.y = y or save.y
        save.z = z or save.z
        save.renderDistance = renderDistance or save.renderDistance

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[save.steamID]
            if player then
                self:show(player.id)
            end
        end
    end;

    show = function(self, peerID)
        if self.isDisposed then
            
            return 
        end

        local save = self.savedata

        if save.parentID then
            server.setPopup(peerID, save.id, nil, save.text ~= "", save.text, save.x, save.y, save.z, save.renderDistance, save.parentType == "vehicle" and save.parentID or nil, save.parentType ~= "vehicle" and save.parentID or nil)
        else
            server.setPopup(peerID, save.id, nil, save.text ~= "", save.text, save.x, save.y, save.z, save.renderDistance, nil, nil)
        end
    end;

    onDispose = function(self)
        server.removePopup(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.UIScreenPopup = {

    fromSavedata = function(cls, savedata, isTemporary)
        local self = {
            savedata = savedata,
            id = savedata.id,

            despawn = LifeBoatAPI.lb_dispose,
            show = cls.show,
            onDispose = cls.onDispose,
            edit = cls.edit
        }

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[savedata.steamID]
            if player then
                self:show(player.id)
            end
        end
        
        return self
    end;

    new = function(cls, player, text, screenX, screenY, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "screenpopup",
            steamID = player and player.steamID or "all",
            screenX = screenX,
            screenY = screenY,
            text = text,
            isTemporary = isTemporary,
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    show = function(self, peerID)
        local save = self.savedata
        server.setPopupScreen(peerID, save.id, nil, true, save.text, save.screenX, save.screenY)
    end;

    edit = function(self, text, screenX, screenY)
        local save = self.savedata
        save.text = text or save.text
        save.screenX = screenX or save.screenX
        save.screenY = screenY or save.screenY

        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[save.steamID]
            if player then
                self:show(player.id)
            end
        end
    end;

    onDispose = function(self)
        server.removePopup(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.UIMapCollection = {

    fromSavedata = function(cls, savedata)
        local self = {
            savedata = savedata,
            id = savedata.id,

            despawn = LifeBoatAPI.lb_dispose,
            show = cls.show,
            onDispose = cls.onDispose,
            beginDisplaying = cls.beginDisplaying
        }
        
        return self
    end;

    new = function(cls, player, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "mapcollection",
            steamID = player and player.steamID or "all",
            isTemporary = isTemporary,
            objects = {}
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    addObject = function(self, positionType, markerType, x, z, radius, label, hoverLabel)
        local objects = self.savedata.objects
        objects[#objects+1] = {type="object", positionType=positionType, markerType=markerType, x=x, z=z, radius=radius, label=label, hoverLabel=hoverLabel}
        return self
    end;

    addLabel = function(self, labelType, name, x, z)
        local objects = self.savedata.objects
        objects[#objects+1] = {type="label", labelType=labelType, name=name, x=x, z=z}
        return self
    end;

    addLine = function(self, startMatrix, endMatrix, width)
        local objects = self.savedata.objects
        objects[#objects+1] = {type="line", startMatrix=startMatrix, endMatrix=endMatrix, width=width}
        return self
    end;

    beginDisplaying = function(self)
        if self.savedata.steamID == "all" then
            self:show(-1)
        else
            local player = LB.players.playersBySteamID[self.savedata.steamID]
            if player then
                self:show(player.id)
            end
        end
    end;

    show = function(self, peerID)
        local objects = self.savedata.objects
        for i=1, #objects do
            local object = objects[i]
            local type = object.type
            if type == "object" then
                server.addMapObject(peerID, self.id, object.positionType, object.markerType, object.x, object.z, nil, nil, nil, nil, object.label, object.radius, object.hoverLabel)
            elseif type == "label" then
                server.addMapLabel(peerID, self.id, object.labelType, object.name, object.x, object.z)
            elseif type == "line" then
                server.addMapLine(peerID, self.id, object.startMatrix, object.endMatrix, object.width)
            end
        end
    end;

    onDispose = function(self)
        server.removeMapID(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.UIPopupRelativePos = {

    fromSavedata = function(cls, savedata)

        local parentID = savedata.parentID
        local parentType = savedata.parentType
        local parent;
        if parentID and parentType then
            parent = LB.objects:getByType(parentType, parentID)
        end

        local self = {
            savedata = savedata,
            id = savedata.id,
            parent = parent,
            nextUpdateTick = 0,

            redraw = cls.redraw,
            despawn = LifeBoatAPI.lb_dispose,
            onDispose = cls.onDispose,
            show = cls.show,
            edit = cls.edit
        }

        if not parent then 
            LifeBoatAPI.lb_dispose(self)
        else
            parent:attach(self)
        end

        if self.isDisposed then
            return self
        end

        local player = LB.players.playersBySteamID[savedata.steamID]
        if self.savedata.steamID == "all" or player then
            self:show()
        end

        return self
    end;

    new = function(cls, player, text, offset, centerOffset,  renderDistance, parent, isTemporary)
        local obj = cls:fromSavedata({
            id = server.getMapID(),
            type = "popuprelative",
            steamID = player and player.steamID or "all",
            offset = offset,
            centerOffset = centerOffset, 
            text = text,
            renderDistance = renderDistance,
            parentID = parent and parent.id,
            parentType = parent and parent.savedata.type,
            isTemporary = isTemporary,
        })

        LB.ui:trackEntity(obj)

        return obj
    end;

    show = function(self)

        if not self.tickable then
            
            self.tickable = LB.ticks:register(self.redraw, self, 30, 0)
        end
    end;

    redraw = function(listener, ctx, deltaGameTicks)
        local self = ctx
        local save = self.savedata

        local peerID;
        if save.steamID == "all" then
            peerID = -1
        else
            local player = LB.players.playersBySteamID[save.steamID]
            if player then
               peerID = player.id
            else
                
                listener.isDisposed = true
                self.tickable = nil
                server.removePopup(-1, self.id)
                return
            end
        end

        if self.nextUpdateTick ~= self.parent.nextUpdateTick then
            if self.parent.nextUpdateTick <= LB.ticks.ticks then
                self.parent:getTransform()
            end

            local transform = save.centerOffset and LifeBoatAPI.Matrix.multiplyMatrix(save.centerOffset, self.parent.transform) or self.parent.transform
            local offset = save.offset and LifeBoatAPI.Matrix.multiplyMatrix(transform, save.offset) or transform
            local x,y,z = offset[13], offset[14], offset[15]
            server.setPopup(peerID, save.id, nil, save.text ~= "", save.text, x, y, z, save.renderDistance, nil, nil)

            self.nextUpdateTick = self.parent.nextUpdateTick
        end
    end;

    edit = function(self, text, offset, centerOffset, renderDistance)
        local save = self.savedata
        save.text = text or save.text
        save.offset = offset or save.offset;
        save.centerOffset = centerOffset or save.centerOffset;
        save.renderDistance = renderDistance or save.renderDistance;
        self.nextUpdateTick = 0

        self.redraw(self.tickable, self, 0)
    end;

    onDispose = function(self)
        self.tickable.isDisposed = true
        server.removePopup(-1, self.id)
        LB.ui:stopTracking(self)
    end;
}

LifeBoatAPI.AddonManager = {

    new = function(cls)
        local self = {
            this = nil;
            addons = {};
            addonsByName = {};
            scripts = {};

            init = cls.init,
            loadOtherAddons = cls.loadOtherAddons
        }

        return self
    end;

    init = function(self)
        
        local numberOfAddons = server.getAddonCount()
        for i=0, numberOfAddons-1 do
            local addonData = server.getAddonData(i)
            local addon = LifeBoatAPI.Addon:new(i, addonData)
            self.addons[#self.addons+1] = addon
            self.addonsByName[addon.name] = addon
        end

        local thisIndex = server.getAddonIndex() + 1
        self.this = self.addons[thisIndex]
        self.this:load()
    end;

    loadOtherAddons = function(self)
        local thisAddon = self.this
        for i=1, #self.addons do
            local addon = self.addons[i]
            if addon ~= thisAddon then
                addon:load()
            end
        end
    end;
}

LifeBoatAPI.Addon = {

    new = function(cls, index, addonData)
        return {
            rawdata = addonData,
            name = addonData.name,
            index = index;
            locations = {};
            locationsByName = {};
            componentsByID = {};
            isLoaded = false;

            load = cls.load
        }
    end;

    load = function(self)
        if not self.isLoaded then
            self.isLoaded = true

            for i=0, self.rawdata.location_count-1 do
                local locationData = server.getLocationData(self.index, i)
                local location = LifeBoatAPI.AddonLocation:new(self, i, locationData)
                self.locations[#self.locations+1] = location
                self.locationsByName[locationData.name] = location

                for iComponent=1, #location.components do
                    local component = location.components[iComponent]
                    self.componentsByID[component.index] = component
                end
            end
        end
    end;
}

LifeBoatAPI.AddonLocation = {

    new = function(cls, parent, index, locationData)
        
        local self = {
            addon = parent,
            index = index,
            rawdata = locationData,
            components = {};
            componentsByID = {};
            componentsByName = {};

            firesByName = {};
            zonesByName = {};
            vehiclesByName = {};
            objectsByName = {};

            spawnMultiple = cls.spawnMultiple;
            spawnMultipleRelativeToPosition = cls.spawnMultipleRelativeToPosition;
            getPosition = cls.getPosition;
        }

        local withParent = {}

        for i=0, locationData.component_count-1 do
            local componentData = server.getLocationComponentData(self.addon.index, self.index, i)
            local component = LifeBoatAPI.AddonComponent:new(self, i, componentData)

            self.componentsByID[componentData.id] = component

            if (component.rawdata.type == "zone" or component.rawdata.type == "fire")
                and (component.tags["parentID"]) then

                withParent[#withParent+1] = component
            else
                self.components[#self.components+1] = component

                if componentData.display_name ~= "" then
                    self.componentsByName[componentData.display_name] = component
                end
            end
        end

        for i=1, #withParent do
            local component = withParent[i]
            local parentID = tonumber(component.tags["parentID"])

            local parent = self.componentsByID[parentID]
            if parent then
                local parentTransformInverse = LifeBoatAPI.Matrix.invert(parent.rawdata.transform)
                parent.children[#parent.children+1] = component
                
                component.rawdata.transform = LifeBoatAPI.Matrix.multiplyMatrix(component.rawdata.transform, parentTransformInverse)
            end
        end

        return self
    end;

    getPosition = function(self, closestToMatrix)
        closestToMatrix = closestToMatrix or LifeBoatAPI.Matrix:newMatrix()
        local tileMatrix, success = server.getTileTransform(closestToMatrix, self.rawdata.tile, 50000)

        if not success then
            return nil
        end
        return tileMatrix
    end;

    spawnMultiple = function(self, closestToMatrix, predicate, collectionIsTemporary)
        closestToMatrix = closestToMatrix or LifeBoatAPI.Matrix:newMatrix()
        local tileMatrix, success = server.getTileTransform(closestToMatrix, self.rawdata.tile, 50000)

        local collection = LifeBoatAPI.ObjectCollection:new(collectionIsTemporary)
        if not success then
            return collection
        end

        for i=1, #self.components do
            local component = self.components[i]
            if not predicate or predicate(component) then
                local spawned = component:spawnRelativeToPosition(tileMatrix)
                if spawned then
                    collection:addObject(spawned)
                end
            end
        end
        return collection
    end;

    spawnMultipleRelativeToPosition = function(self, position, predicate, collectionIsTemporary)
        local collection = LifeBoatAPI.ObjectCollection:new(collectionIsTemporary)

        for i=1, #self.components do
            local component = self.components[i]
            if not predicate or predicate(component) then
                local spawned = component:spawnRelativeToPosition(position)
                if spawned then
                    collection:addObject(spawned)
                end
            end
        end
        return collection
    end;
}

LifeBoatAPI.AddonComponent = {

    new = function(cls, location, index, componentData)
        local self = {
            index = index;
            location = location;
            rawdata = componentData;
            tags = {};
            children = {};

            parseSequentialTag = cls.parseSequentialTag;
            spawnRelativeToPosition = cls.spawnRelativeToPosition;
            spawnAtPosition = cls.spawnAtPosition;
            spawn = cls.spawn
        }

        local rawtags = self.rawdata.tags_full
        local tags = self.tags
        for tagbase in string.gmatch(rawtags, "%s*([^;,]*%w+)%s*[;,]?") do

            local wasKeyVal = false
            
            for key,value in string.gmatch(tagbase, "([^;,]*%w+)%s*=%s*([^;,]*%w+)") do
                tags[key] = value
                wasKeyVal = true
            end

            if not wasKeyVal then
                tags[tagbase] = true; 
            end
        end

        return self
    end;

    parseSequentialTag = function(self, tagBase)
        local sequence = {}

        local baseTag = self.tags[tagBase]
        if baseTag then
            sequence[#sequence+1] = baseTag
        end

        local i=1
        while true do
            local tag = self.tags[tagBase .. i]
            if tag then
                sequence[#sequence+1] = tag
            else
                break
            end
        end

        if #sequence > 0 then
            return sequence
        else
            return nil
        end
    end;

    spawnRelativeToPosition = function(self, position)
        return self:spawn(LifeBoatAPI.Matrix.multiplyMatrix(self.rawdata.transform, position))
    end;

    spawnAtPosition = function(self, position)
        return self:spawn(position)
    end;

    spawn = function(self, matrix, parent)

        local spawnedData, success;
        if self.rawdata.type ~= "zone" then
            spawnedData, success =  server.spawnAddonComponent(matrix, self.location.addon.index, self.location.index, self.index)
        else
            success = true
        end

        if success then

            local entity;
            if self.rawdata.type == "zone" then
                entity = LifeBoatAPI.Zone:fromAddonSpawn(self, matrix, parent)

            elseif self.rawdata.type == "fire" then
                entity = LifeBoatAPI.Fire:fromAddonSpawn(self, spawnedData, parent)
                
            elseif self.rawdata.type == "character" then
                entity = LifeBoatAPI.Object:fromAddonSpawn(self, spawnedData)

            elseif self.rawdata.type == "vehicle" then
                entity = LifeBoatAPI.Vehicle:fromAddonSpawn(self, spawnedData)

            elseif self.rawdata.type == "object"    
            or self.rawdata.type == "loot"        
            or self.rawdata.type == "flare"        
            or self.rawdata.type == "animal"        
            or self.rawdata.type == "ice" then   
                entity = LifeBoatAPI.Object:fromAddonSpawn(self, spawnedData)
            end

            for i=1, #self.children do
                local child = self.children[i]

                child:spawn(LifeBoatAPI.Matrix.multiplyMatrix(child.rawdata.transform, matrix), entity)
            end

            if entity.init then
                entity:init()
            end

            return entity
        end
        return nil
    end;
}

LifeBoatAPI.Collision = {

    new = function(cls, zone, object)
        return {
            zone = zone,
            object = object,

            onCollisionEnd = LifeBoatAPI.Event:new(),

            onDispose = LifeBoatAPI.Collision.onDispose,
            attach = LifeBoatAPI.lb_attachDisposable
        }
    end;

    onDispose = function(self)
        if self.onCollisionEnd.hasListeners then
            self.onCollisionEnd:trigger(self)
        end
    end;
}

LifeBoatAPI.CollisionLayer = {
    
    new = function(cls, name)
        return {
            name = name,
            zones = {},
            objects = {},
            entityLookup = {}
        }
    end;
}

LifeBoatAPI.CollisionManager = {

    new = function(cls)
        
        local self = {
            layersByName = {};
            collisions = {};
            tickFrequency = 30; 

            init = cls.init;
            trackEntity = cls.trackEntity;
            stopTracking = cls.stopTracking;
        }
        return self
    end;

    init = function(self)
    end;

    trackEntity = function(self, entity)
        local layerName = entity.savedata.collisionLayer

        if not layerName then
            return
        end

        if not self.layersByName[layerName] then
            self.layersByName[layerName] = LifeBoatAPI.CollisionLayer:new(layerName)
        end
        local layer = self.layersByName[layerName]

        if layer.entityLookup[entity] then
            return
        end
        layer.entityLookup[entity] = true
        entity.collisionPairs = {}

        if entity.savedata.type == "zone" then
            
            local zone = entity
            layer.zones[#layer.zones+1] = zone

            for i=1, #layer.objects do
                local object = layer.objects[i]

                local collisionPair = LifeBoatAPI.CollisionPair:new(object, zone, nil, nil)
                object.collisionPairs[zone] = collisionPair
                zone.collisionPairs[object] = collisionPair
            end
        else
            local object = entity
            layer.objects[#layer.objects+1] = object

            for i=1, #layer.zones do
                local zone = layer.zones[i]

                local collisionPair = LifeBoatAPI.CollisionPair:new(object, zone, nil, nil)
                object.collisionPairs[zone] = collisionPair
                zone.collisionPairs[object] = collisionPair
            end
        end
    end;

    stopTracking = function(self, entity)
        local layerName = entity.savedata.collisionLayer 
        local layer = self.layersByName[layerName]
        if not layer then
            return
        end

        if entity.collisionPairs then
            if entity.savedata.type == "zone" then
                
                local zone = entity
                for i=1, #layer.objects do
                    local object = layer.objects[i]
                    local collisionPair = zone.collisionPairs[object]
                    if collisionPair and not collisionPair.isDisposed then
                        if collisionPair.collision then
                            LifeBoatAPI.lb_dispose(collisionPair.collision)
                        end

                        object.collisionPairs[zone] = nil 
                    end
                    collisionPair.isDisposed = true 
                end

                for i=1, #layer.zones do
                    if layer.zones[i] == zone then
                        table.remove(layer.zones, i)
                        break;
                    end
                end
            else
                local object = entity
                for i=1, #layer.zones do
                    local zone = layer.zones[i]
                    local collisionPair = object.collisionPairs[zone]
                    if collisionPair and not collisionPair.isDisposed then
                        if collisionPair.collision then
                            LifeBoatAPI.lb_dispose(collisionPair.collision)
                        end

                        zone.collisionPairs[object] = nil 
                    end
                    collisionPair.isDisposed = true 
                end

                for i=1, #layer.objects do
                    if layer.objects[i] == object then
                        table.remove(layer.objects, i)
                        break;
                    end
                end
            end
        end

        layer.entityLookup[entity] = nil
        entity.collisionPairs = {}
    end;
}

LifeBoatAPI.CollisionPair = {
    new = function(cls, object, zone, tickFrequency, firstTickDelay)
        local self = {
            collision = nil,
            object = object,
            zone = zone,
            tickFrequency = tickFrequency,
            firstTickDelay = firstTickDelay
        }
        
        LB.ticks:register(cls.onTick, self, tickFrequency, firstTickDelay, true)
        
        return self
    end;

    onTick = function(self, ctx)
        
        local object = self.object
        local zone = self.zone

        if not object.onCollision.hasListeners and not zone.onCollision.hasListeners then
            self.tickFrequency = 120
            return
        end

        local currentTick = LB.ticks.ticks
        if object.nextUpdateTick <= currentTick then
            object:getTransform()
        end

        if zone.nextUpdateTick <= currentTick then
            zone:getTransform()
        end

        local objTransform = object.transform
        local zoneTransform = zone.transform
        local zoneSave = zone.savedata

        local dx,dy,dz = objTransform[13]-zoneTransform[13], objTransform[14]-zoneTransform[14], objTransform[15]-zoneTransform[15]
        local distance = (dx*dx + dy*dy + dz*dz)^0.5
        
        local isCollision = false;
        if distance <= zone.boundingRadius then
            if zoneSave.collisionType == "sphere" then
                isCollision = LifeBoatAPI.Colliders.isPointInSphere(objTransform, zoneTransform, zoneSave.radius)
            else
                isCollision = LifeBoatAPI.Colliders.isPointInZone(objTransform, zoneTransform, zoneSave.sizeX, zoneSave.sizeY, zoneSave.sizeZ)
            end
            
            self.tickFrequency = 30
        else
            local distanceOut = distance-zone.boundingRadius 

            self.tickFrequency = 30 + (distanceOut * 0.001 * 300) // 1 

            if self.tickFrequency > 3000 then 
                self.tickFrequency = 3000
            end
        end

        local collision = self.collision
        
        if isCollision and not collision then
            
            self.collision = LifeBoatAPI.Collision:new(zone, object)
            collision = self.collision

            if object.onCollision.hasListeners then
                object.onCollision:trigger(object, collision, zone)
            end

            if zone.onCollision.hasListeners then
                zone.onCollision:trigger(zone, collision, object)
            end

        elseif not isCollision and collision then
            
            LifeBoatAPI.lb_dispose(collision);
            self.collision = nil
        end
    end;
}

LifeBoatAPI.Coroutine = {

	start = function (cls, tickFrequency, beginUntriggered, firstTickDelay)
		local self = {
			
			dispose = -9999; 
			loop = -9998; 
			await = -9997; 

			firstTickDelay = firstTickDelay,
			tickFrequency = tickFrequency or LifeBoatAPI.TickFrequency.HIGH;
			lastTick = LB.ticks.gameTicks;
			current = 1;
			stages = {};
			listeners = {};
			status = beginUntriggered and 0 or 1; 

			attach = LifeBoatAPI.lb_attachDisposable;
			trigger = cls.trigger;
			andThen = cls.andThen;
			andImmediately = cls.andImmediately;
		}
		return self
	end;

	andThen = function(self, func)
		if not self.isDisposed then
			self.stages[#self.stages+1] = {onExecute = func, }

			if self.status == 2 then
				self.status = 1
				self.current = #self.stages
			end

			if not self.isTickRegistered then
				self.isTickRegistered = true
				LB.ticks:register(self.trigger, self, self.tickFrequency, self.firstTickDelay, true)
				self.isPaused = self.status ~= 1
			end

		end
		return self
	end;

	andImmediately = function(self, func)
		if not self.isDisposed then
			self.stages[#self.stages+1] = {onExecute = func, isImmediate = true}

			if self.status == 2 then
				self.status = 1
				self.current = #self.stages 
			end

			if self.status ~= 0 and self.current == #self.stages then
				
				self:trigger()
			end
		end
		return self
	end;

	trigger = function(self)

		if self.isDisposed then
			return
		end

		local lastTick = self.lastTick
		local currentTick = LB.ticks.gameTicks
		local deltaTicks = currentTick - lastTick
		self.lastTick = currentTick

		self.isTriggered = true
		self.isPaused = false

		local shouldDispose = false;
		repeat
			local stage = self.stages[self.current]
			if not stage then
				break 
			end

			local yieldType, result = stage.onExecute(self, deltaTicks, self.lastResult)

			if yieldType == self.dispose then
				shouldDispose = true;
				self.lastResult = result

			elseif yieldType == self.loop then
				
				self.lastResult = result
				stage.isImmediate = false 

			elseif yieldType == self.await then
				local coroutine = result
                
				if not coroutine.isDisposed or not coroutine.isTriggered then
					
					coroutine.listeners[#coroutine.listeners + 1] = self
					self.isPaused = true
					self.current = self.current + 1
					return; 
				else
					
					self.lastResult = coroutine.lastResult
					self.current = self.current + 1
				end

			else
				self.current = self.current + (yieldType or 1)
				self.lastResult = result
			end

		until(shouldDispose
		      or not self.stages[self.current]
			  or not self.stages[self.current].isImmediate)

		if shouldDispose or not self.stages[self.current] then
			
			for i=1, #self.listeners do
				local listener = self.listeners[i]
				if not listener.isDisposed then
					listener.lastResult = self.lastResult
					listener:trigger()
				end
			end

			if #self.listeners > 0 then
				self.listeners = {}
			end

			self.status = 2 

			if shouldDispose then
				if self.disposables or self.onDispose then
					LifeBoatAPI.lb_dispose(self)
				else
					self.isDisposed = true
				end
			end

			return
		end
	end;
}

LifeBoatAPI.Event = {

    new = function (cls)
        return {
            
            listeners = {};
			hasListeners = false;

			await = cls.await;
			awaitIf = cls.awaitIf;
            register = cls.register;
            trigger = cls.trigger;
        }
    end;

    register = function (self, func, context, timesToExecute)
        local listener = {
            onExecute = func,
            executeCount = timesToExecute or -1,
			context = context
        }
        self.listeners[#self.listeners + 1] = listener
		self.hasListeners = true
        return listener
    end;

	await = function(self)
		local cr = LifeBoatAPI.Coroutine:start(nil, true)

		self:register(function(l, ctx, ...)
			l.isDisposed = true
			cr.lastResult = {...}
			cr:trigger()
		end, nil, 1)

		return cr
	end;

	awaitIf = function(self, predicate)
		local cr = LifeBoatAPI.Coroutine:start(nil, true)

		self:register(function(l, ctx, ...)
			if predicate(l, ctx, ...) then
				l.isDisposed = true
				cr.lastResult = {...}
				cr:trigger()
			end
		end)

		return cr
	end;

    trigger = function (self, ...)
        local newListeners = {}
        for i = 1, #self.listeners do
            local listener = self.listeners[i]

            if not listener.isDisposed and listener.executeCount ~= 0 then
                listener.executeCount = listener.executeCount - 1
                listener:onExecute(listener.context, ...)
            end

            if not listener.isDisposed and listener.executeCount ~= 0 then
                newListeners[#newListeners+1] = listener
            end
        end
        self.listeners = newListeners
		self.hasListeners = #self.listeners > 0
    end;
}

LifeBoatAPI.ENVCallbackEvent = {

	new = function(cls, callbackName, transformFunc)
		local self = {
			
			callbackName = callbackName;
			listeners = {};
			hasListeners = false;
			transformFunc = transformFunc;

			init = cls.init;
			await = LifeBoatAPI.Event.await;
			awaitIf = LifeBoatAPI.Event.awaitIf;
			register = cls.register;
			trigger = LifeBoatAPI.Event.trigger;
		}

		self.onExecute = cls._onExecuteClosure(self)

		return self
	end;

	init = function(self)
		if self.hasListeners and self.onExecute ~= _ENV[self.callbackName] then
			self.originalExecute = _ENV[self.callbackName]
			_ENV[self.callbackName] = self.onExecute
		end
	end;

	_onExecuteClosure = function (self)
		return function(...)
			local newListeners = {}
			for i = 1, #self.listeners do
				local listener = self.listeners[i]

				if not listener.isDisposed and listener.executeCount ~= 0 then
					listener.executeCount = listener.executeCount - 1

					if self.transformFunc then
						listener:onExecute(listener.context, self.transformFunc(...))
					else
						listener:onExecute(listener.context, ...)
					end
					
					if self.originalExecute then
						self.originalExecute(...)
					end
				end

				if not listener.isDisposed and listener.executeCount ~= 0 then
					newListeners[#newListeners+1] = listener
				end
			end
			
        	self.listeners = newListeners
			self.hasListeners = #self.listeners > 0

			if not self.hasListeners then
				_ENV[self.callbackName] = self.originalExecute;
				self.originalExecute = nil
			end			
		end
	end;

	register = function(self, func, context, timesToExecute)
		
		if not self.hasListeners and self.onExecute ~= _ENV[self.callbackName] then
			self.originalExecute = _ENV[self.callbackName]
			_ENV[self.callbackName] = self.onExecute
		end

		local listener = {
            onExecute = func,
            executeCount = timesToExecute or -1,
			context = context
        }
        self.listeners[#self.listeners + 1] = listener
		self.hasListeners = true
        return listener
	end;
}

LifeBoatAPI.EventManager = {
	callbacksList = {
	    "onDestroy",
		"onCustomCommand", "onChatMessage",
		"onPlayerJoin", "onPlayerSit", "onPlayerUnsit", "onPlayerRespawn", "onPlayerLeave", "onPlayerDie",
		"onCharacterSit", "onCharacterUnsit", 
		"onToggleMap",
		"onVehicleSpawn", "onVehicleDespawn", "onVehicleLoad", "onVehicleUnload", "onVehicleTeleport", "onVehicleDamaged",
		"onObjectLoad", "onObjectUnload", "onButtonPress",
		"onSpawnAddonComponent",
		"httpReply",
		"onFireExtinguished", "onForestFireSpawned", "onForestFireExtinguised",
		"onTornado", "onMeteor", "onTsunami", "onWhirlpool", "onVolcano",
	};

	new = function(cls)
        local self = {
            callbacksList = cls.callbacksList,
            onCreate = LifeBoatAPI.Event:new(),

            init = cls.init,
            _setupAdditionalEvents = cls._setupAdditionalEvents,
        }
        for i=1, #self.callbacksList do
            local callbackName = self.callbacksList[i]
            self[callbackName] = LifeBoatAPI.ENVCallbackEvent:new(callbackName)
        end

        return self
	end;

	init = function(self)
		for i=1, #self.callbacksList do
			local callbackName = self.callbacksList[i]
			self[callbackName]:init()
		end

		self:_setupAdditionalEvents()
	end;

	_setupAdditionalEvents = function(self)
        local players = LB.players;
        local objects = LB.objects;

		if self.trackVehicleTeleport then
            LB.events.onVehicleTeleport:register(function (l, context, vehicle_id, peer_id, x, y, z)
                local vehicle = objects.vehiclesByID[vehicle_id]
                local player = players.playersByPeerID[peer_id]
                if vehicle and vehicle.onTeleport.hasListeners then
                    vehicle.onTeleport:trigger(vehicle, player, x, y, z)
                end

                if player and player.onTeleport.hasListeners then
                    player.onTeleport:trigger(player, vehicle, x,y,z)
                end
            end)
		end

		if self.trackButtonPress then
            LB.events.onButtonPress:register(function (l, context, vehicle_id, peer_id, button_name)
                local vehicle = objects.vehiclesByID[vehicle_id]
                local player = players.playersByPeerID[peer_id]
                if vehicle and vehicle.onButtonPress.hasListeners then
                    vehicle.onButtonPress:trigger(vehicle, player, button_name)
                end

                if player and player.onButtonPress.hasListeners then
                    player.onButtonPress:trigger(player, vehicle, button_name)
                end
            end)
		end

		if self.trackSitUnsit then
            
            LB.events.onPlayerSit:register(function (l, context, peer_id, vehicle_id, seat_name)
                local vehicle = objects.vehiclesByID[vehicle_id]
                local player = players.playersByPeerID[peer_id]
                if vehicle and vehicle.onSeatedChange.hasListeners then
                    vehicle.onSeatedChange:trigger(vehicle, player, nil, seat_name, true)
                end

                if player and player.onSeatedChange.hasListeners then
                    player.onSeatedChange:trigger(player, vehicle, seat_name, true)
                end
            end)

            LB.events.onPlayerUnsit:register(function (l, context, peer_id, vehicle_id, seat_name)
                local vehicle = objects.vehiclesByID[vehicle_id]
                local player = players.playersByPeerID[peer_id]
                if vehicle and vehicle.onSeatedChange.hasListeners then
                    vehicle.onSeatedChange:trigger(vehicle, player, nil,  seat_name, false)
                end

                if player and player.onSeatedChange.hasListeners then
                    player.onSeatedChange:trigger(player, vehicle, seat_name, false)
                end
            end)

            LB.events.onCharacterSit:register(function (l, context, object_id, vehicle_id, seat_name)
                local vehicle = objects.vehiclesByID[vehicle_id]
                if vehicle and vehicle.onSeatedChange.hasListeners then
                    vehicle.onSeatedChange:trigger(vehicle, nil, object_id, seat_name, true)
                end
            end)

            LB.events.onCharacterUnsit:register(function (l, context, object_id, vehicle_id, seat_name)
                local vehicle = objects.vehiclesByID[vehicle_id]
                if vehicle and vehicle.onSeatedChange.hasListeners then
                    vehicle.onSeatedChange:trigger(vehicle, object_id, seat_name, false)
                end
            end)
		end

        if self.trackVehicleDamage then
            LB.events.onVehicleDamaged:register(function (l, context, vehicle_id, damage_amount, voxel_x, voxel_y, voxel_z, body_index)
                local vehicle = objects.vehiclesByID[vehicle_id]
                if vehicle and vehicle.onDamaged.hasListeners then
                    vehicle.onDamaged:trigger(vehicle, damage_amount, voxel_x, voxel_y, voxel_z, body_index)
                end
            end)
        end

        if self.trackPlayerSpawnVehicle then
            LB.events.onVehicleSpawn:register(function (l, context, vehicle_id, peer_id, x, y, z, cost)
                local player = players.playersByPeerID[peer_id]
                if player and player.onSpawnVehicle.hasListeners then
                    player.onSpawnVehicle:trigger(player, vehicle_id, x,y,z, cost)
                end
            end)
        end

        if self.trackPlayerLife then
            LB.events.onPlayerDie:register(function (l, context, steam_id, name, peer_id, is_admin, is_auth)
                local player = players.playersByPeerID[peer_id]
                if player and player.onAliveChanged.hasListeners then
                    player.onAliveChanged:trigger(player, false)
                end
            end)
            
            LB.events.onPlayerRespawn:register(function (l, context, peer_id)
                local player = players.playersByPeerID[peer_id]
                if player and player.onAliveChanged.hasListeners then
                    player.onAliveChanged:trigger(player, true)
                end
            end)
        end

        if self.trackPlayerCommand then
            LB.events.onCustomCommand:register(function (l, context, full_message, peer_id, is_admin, is_auth, command, ...)
                local player = players.playersByPeerID[peer_id]
                if player and player.onCommand.hasListeners then
                    player.onCommand:trigger(player, full_message, command, ...)
                end
            end)
        end

        if self.trackPlayerChat then
            LB.events.onChatMessage:register(function (l, context, peer_id, sender_name, message)
                local player = players.playersByPeerID[peer_id]
                if player and player.onChat.hasListeners then
                    player.onChat:trigger(player, message)
                end
            end)
        end

        if self.trackPlayerMap then
            LB.events.onToggleMap:register(function (l, context, peer_id, is_open)
                local player = players.playersByPeerID[peer_id]
                if player and player.onToggleMap.hasListeners then
                    player.onToggleMap:trigger(player, is_open)
                end
            end)
        end
	end;
}

LifeBoatAPI.ObjectManager = {
    
    new = function(cls)
        local self = {
            savedata = {
                
                vehiclesByID = {};
                objectsByID = {};
                npcsByID = {};
                zonesByID = {};
                firesByID = {};
                objectCollectionsByID = {};
                nextZoneID = 0;
            };

            vehiclesByID = {};
            objectsByID = {};
            npcsByID = {};
            firesByID = {};
            zonesByID = {};
            objectCollectionsByID = {};
            onInitScripts = {};

            init = cls.init;
            registerScript = cls.registerScript;
            trackEntity = cls.trackEntity;
            stopTracking = cls.stopTracking;
            getByType = cls.getByType;
            getVehicle = cls.getVehicle;
            getZone = cls.getZone;
            getNPC = cls.getNPC;
            getObject = cls.getObject;
            getFire = cls.getFire;
            getObjectCollection = cls.getObjectCollection;
        }

        return self
    end;

    init = function(self)
        
        self.savedata = g_savedata.objectManager or self.savedata
        g_savedata.objectManager = self.savedata

        LB.events.onVehicleDespawn:register(function (l, context, vehicleID, peerID)
            local vehicle = self.vehiclesByID[vehicleID]  
            if vehicle then
                vehicle:despawn() 
            end
        end)

        LB.events.onVehicleLoad:register(function (l, context, vehicleID)
            local vehicle = self.vehiclesByID[vehicleID]
            if vehicle then
                if vehicle.onLoaded.hasListeners then
                    vehicle.onLoaded:trigger(vehicle)
                end
                for i=1, #vehicle.childZones do
                    LB.collision:trackEntity(vehicle.childZones[i])
                end
                LB.collision:trackEntity(vehicle)
            end
        end)

        LB.events.onVehicleUnload:register(function(l, context, vehicleID, peerID)
            local vehicle = self.vehiclesByID[vehicleID]  
            if vehicle then
                LB.collision:stopTracking(vehicle)

                for i=1, #vehicle.childZones do
                    LB.collision:stopTracking(vehicle.childZones[i])
                end
            end 
        end)

        LB.events.onObjectLoad:register(function (l, context, objectID)
            local object = self.objectsByID[objectID] or self.npcsByID[objectID] or self.firesByID[objectID]
            if object then
                if object.onLoaded.hasListeners then
                    object.onLoaded:trigger(object)
                end

                for i=1, #object.childZones do
                    LB.collision:trackEntity(object.childZones[i])
                end
                LB.collision:trackEntity(object)
            end
        end)

        LB.events.onObjectUnload:register(function (l, context, objectID)
            
            local object = self.objectsByID[objectID] or self.npcsByID[objectID] or self.firesByID[objectID]
            if object then
                LB.collision:stopTracking(object)

                for i=1, #object.childZones do
                    LB.collision:stopTracking(object.childZones[i])
                end
            end 
        end)
        
        local initializables = {}
        
        for vehicleID, vehicleSaveData in pairs(self.savedata.vehiclesByID) do
            if not self.vehiclesByID[vehicleID] then
                local vehicle = LifeBoatAPI.Vehicle:fromSavedata(vehicleSaveData)
                self.vehiclesByID[vehicleID] = vehicle
                initializables[#initializables+1] = vehicle
            end
        end

        for objectID, objectSaveData in pairs(self.savedata.objectsByID) do
            if not self.objectsByID[objectID] then
                local object = LifeBoatAPI.Object:fromSavedata(objectSaveData)
                self.objectsByID[objectID] = object
                initializables[#initializables+1] = object
            end
        end

        for objectID, objectSaveData in pairs(self.savedata.npcsByID) do
            if not self.npcsByID[objectID] then
                local object = LifeBoatAPI.Object:fromSavedata(objectSaveData)
                self.npcsByID[objectID] = object
                initializables[#initializables+1] = object
            end
        end

        for objectID, objectSaveData in pairs(self.savedata.zonesByID) do
            if not self.zonesByID[objectID] then
                self.zonesByID[objectID] = LifeBoatAPI.Zone:fromSavedata(objectSaveData)
            end
        end

        for objectID, objectSaveData in pairs(self.savedata.firesByID) do
            if not self.firesByID[objectID] then
                self.firesByID[objectID] = LifeBoatAPI.Fire:fromSavedata(objectSaveData)
            end
        end

        for objectID, objectSaveData in pairs(self.savedata.objectCollectionsByID) do
            if not self.objectCollectionsByID[objectID] then
                self.objectCollectionsByID[objectID] = LifeBoatAPI.ObjectCollection:fromSavedata(objectSaveData)
            end
        end

        for i=1, #initializables do
            initializables[i]:init()
        end
    end;

    registerScript = function (self, scriptName, script)
        self.onInitScripts[scriptName] = script
    end;

    stopTracking = function(self, entity)
        local type = entity.savedata.type

        if type == "zone" then
            self.zonesByID[entity.id] = nil
            self.savedata.zonesByID[entity.id] = nil

        elseif type == "vehicle" then
            self.vehiclesByID[entity.id] = nil
            self.savedata.vehiclesByID[entity.id] = nil

        elseif type == "npc" then
            self.npcsByID[entity.id] = nil
            self.savedata.npcsByID[entity.id] = nil

        elseif type == "fire" then
            self.firesByID[entity.id] = nil
            self.savedata.firesByID[entity.id] = nil

        elseif type == "object" then
            self.objectsByID[entity.id] = nil
            self.savedata.objectsByID[entity.id] = nil
        elseif type == "object_collection" then
            self.objectCollectionsByID[entity.id] = nil
            self.savedata.objectCollectionsByID[entity.id] = nil 
        end
    end;

    trackEntity = function(self, entity)
        
        if entity.isDisposed then
            return
        end

        local type = entity.savedata.type

        if type == "zone" then
            
            self.zonesByID[entity.id] = entity
            self.savedata.zonesByID[entity.id] = entity.savedata

        elseif type == "vehicle" then
            
            self.vehiclesByID[entity.id] = entity
            self.savedata.vehiclesByID[entity.id] = entity.savedata

        elseif type == "npc" then
            
            self.npcsByID[entity.id] = entity
            self.savedata.npcsByID[entity.id] = entity.savedata

        elseif type == "fire" then
            
            self.firesByID[entity.id] = entity
            self.savedata.firesByID[entity.id] = entity.savedata

        elseif type == "object" then
            
            self.objectsByID[entity.id] = entity
            self.savedata.objectsByID[entity.id] = entity.savedata
        elseif type == "object_collection" then
            
            self.objectCollectionsByID[entity.id] = entity
            self.savedata.objectCollectionsByID[entity.id] = entity.savedata
        end
    end;

    getByType = function(self, type, id)
        if type == "zone" then
            return self.zonesByID[id]
        elseif type == "vehicle" then
            return self.vehiclesByID[id]
        elseif type == "npc" then
            return self.npcsByID[id]
        elseif type == "fire" then
            return self.firesByID[id]
        elseif type == "object" then
            return self.objectsByID[id]
        elseif type == "object_collection" then
            return self.objectCollectionsByID[id]
        end
        return nil
    end;

    getVehicle = function(self, vehicleID)
        return self.vehiclesByID[vehicleID]
    end;

    getZone = function(self, zoneID)
        return self.zonesByID[zoneID]
    end;

    getNPC = function(self, objectID)
        return self.npcsByID[objectID]
    end;

    getObject = function(self, objectID)
        
        local object = self.objectsByID[objectID]
        if object then
            
            object:isLoaded()
            if object.isDisposed then
                
                return nil
            end
        end

        return object
    end;

    getFire = function(self, objectID)
        return self.firesByID[objectID]
    end;

    getObjectCollection = function(self, objectID)
        return self.objectCollectionsByID[objectID]
    end;
}

LifeBoatAPI.PlayerManager = {

    new = function(cls)
        local self = {
            savedata = {
                playersBySteamID = {};
            };
            players = {};
            playersByPeerID = {};
            playersBySteamID = {};
            savedata_playerDataBySteamID = {};
            onPlayerFirstTimeConnected = LifeBoatAPI.Event:new();
            onPlayerConnected = LifeBoatAPI.Event:new();

            init = cls.init;
            _onPlayerJoin = cls._onPlayerJoin;
            _onPlayerLeave = cls._onPlayerLeave;
            getSaveDataBySteamID = cls.getSaveDataBySteamID;
            getPlayerBySteamID = cls.getPlayerBySteamID,
            getPlayerByPeerID = cls.getPlayerByPeerID
        }

        return self
    end;

    init = function(self)
        g_savedata.playerManager = g_savedata.playerManager or self.savedata
        self.savedata = g_savedata.playerManager

        LB.events.onPlayerJoin:register(self._onPlayerJoin, self)
        LB.events.onPlayerLeave:register(self._onPlayerLeave, self)

        local swPlayers = server.getPlayers()
        for i=1, #swPlayers do
            local swPlayer = swPlayers[i]

            self._onPlayerJoin(nil, self, swPlayer.steam_id, swPlayer.name, swPlayer.id, swPlayer.admin, swPlayer.auth)
        end
    end;

    getPlayerBySteamID = function(self, steamID)
        return self.playersBySteamID[steamID]
    end;

    getPlayerByPeerID = function (self, peerID)
        return self.playersByPeerID[peerID]
    end;

    getSaveDataBySteamID = function(self, steamID)
        steamID = tostring(steamID)
        return self.savedata.playersBySteamID[steamID]
    end;

    _onPlayerJoin = function (l, self, steamID, name, peerId, isAdmin, isAuth)
        steamID = tostring(steamID)

        local isFirstTimeJoining = false;

        if self.enablePlayerSaveTracking and not self.savedata.playersBySteamID[steamID] then
            self.savedata.playersBySteamID[steamID] = {}
            isFirstTimeJoining = true
        end
        local savedata = self.savedata.playersBySteamID[steamID] or {}

        local player = LifeBoatAPI.Player:new(peerId, steamID, isAdmin, isAuth, name, savedata)

        self.playersByPeerID[player.id] = player
        self.playersBySteamID[player.steamID] = player
        self.players[#self.players+1] = player

        if isFirstTimeJoining and self.onPlayerFirstTimeConnected.hasListeners then
            self.onPlayerFirstTimeConnected:trigger(player)
        end
        
        if self.onPlayerConnected.hasListeners then
            self.onPlayerConnected:trigger(player)
        end
    end;

    _onPlayerLeave = function (l, self, steamID, name, peerId, isAdmin, isAuth)
        steamID = tostring(steamID)

        local player = self.playersByPeerID[peerId]
        self.playersByPeerID[peerId] = nil
        self.playersBySteamID[steamID] = nil

        if player.onDespawn.hasListeners then
            player.onDespawn:trigger(player)
        end

        for i=1, #self.players do
            local connectedPlayer = self.players[i]
            if connectedPlayer.steamID == player.steamID then
                table.remove(self.players, i)
                break
            end
        end

        LifeBoatAPI.lb_dispose(player)
    end;
}

LifeBoatAPI.TickFrequency = {
    REALTIME    = 1,        
    HIGH        = 20,       
    LOW         = 60,       
    BACKGROUND  = 5*60,    
}

LifeBoatAPI.TickManager = {

    new = function (cls)
        local self = {
            tickables = {};
            ticks = 0;
            gameTicks = 0;

            init = cls.init,
            register = cls.register;
            _onTickClosure = cls._onTickClosure
        }

        return self
    end;

    init = function(self)
        onTick = self:_onTickClosure()
    end;

    register = function (self, func, context, tickFrequency, firstTickDelay, contextIsTickable, disableTickSpread)
        tickFrequency = tickFrequency or -1

        if not firstTickDelay and tickFrequency > 0 then
            firstTickDelay = math.floor(math.random() * math.min(60, tickFrequency)) + 1
        elseif not firstTickDelay then
            firstTickDelay = 1
        end

        local tickable;
        
        if contextIsTickable then
            tickable = context
            tickable.onExecute = func
            tickable.lastTick = self.ticks
        else
            tickable = {
                onExecute = func,
                tickFrequency = tickFrequency,
                lastTick = self.ticks,
                context = context,
                disableTickSpread = disableTickSpread
            }
        end

        local nextTick = self.ticks + firstTickDelay;

        if firstTickDelay == 0 then
            tickable:onExecute(tickable.context, 0)

            if tickable.tickFrequency > 0 then
                nextTick = self.ticks + tickable.tickFrequency
            else
                if tickable.disposables or tickable.onDispose then
                    LifeBoatAPI.lb_dispose(tickable)
                else
                    tickable.isDisposed = true
                end
                return tickable
            end
        end

        local nextTickTickables = self.tickables[nextTick]
        if not nextTickTickables then
            self.tickables[nextTick] = {tickable}
        else
            nextTickTickables[#nextTickTickables+1] = tickable
        end

        return tickable
    end;

    _onTickClosure = function(self)
        local _onTick = onTick

        return function (gameTicks)
            
            if _onTick then
                _onTick(gameTicks)
            end

            self.ticks = self.ticks + 1
            self.gameTicks = self.gameTicks + gameTicks 
            
            local tickables = self.tickables[self.ticks]
            if not tickables then
                return
            end

            self.tickables[self.ticks] = nil 
            for i=1, #tickables do
                local tickable = tickables[i]

                if not tickable.isDisposed then

                    if not tickable.isPaused then
                        tickable:onExecute(tickable.context, self.ticks - tickable.lastTick)
                        tickable.lastTick = self.ticks
                    end

                    if tickable.tickFrequency > 0 then
                        local nextTick = self.ticks + tickable.tickFrequency
                        local nextTickTickables = self.tickables[nextTick]

                        if not nextTickTickables then
                            
                            self.tickables[nextTick] = {tickable}
                        elseif tickable.disableTickSpread then
                            
                            nextTickTickables[#nextTickTickables+1] = tickable
                        else
                            
                            local nextTickCount = #nextTickTickables

                            local nextTickSpread1 = nextTick + 1
                            local nextTickTickablesSpread1 = self.tickables[nextTickSpread1]
                            if not nextTickTickablesSpread1 then
                                self.tickables[nextTickSpread1] = {tickable}
                            else
                                local nextTickCountSpread1 = #nextTickTickablesSpread1

                                local nextTickSpread10 = nextTick + 10
                                local nextTickTickablesSpread10 = self.tickables[nextTickSpread10]
                                if not nextTickTickablesSpread10 then
                                    self.tickables[nextTickSpread10] = {tickable}
                                else
                                    local nextTickCountSpread10 = #nextTickTickablesSpread10

                                    if nextTickCountSpread10 < nextTickCountSpread1 then
                                        if nextTickCountSpread10 < nextTickCount then
                                            nextTickTickablesSpread10[nextTickCountSpread10 + 1] = tickable
                                        else
                                            nextTickTickables[nextTickCount + 1] = tickable
                                        end
                                    elseif nextTickCountSpread1 < nextTickCount then
                                        nextTickTickablesSpread1[nextTickCountSpread1 + 1] = tickable
                                    else
                                        nextTickTickables[nextTickCount + 1] = tickable
                                    end
                                    
                                end
                            end
                        end
                    else
                        
                        if tickable.disposables or tickable.onDispose then
                            LifeBoatAPI.lb_dispose(tickable)
                        else
                            tickable.isDisposed = true
                        end
                    end
                end
            end
        end
    end;
}

LifeBoatAPI.UIManager = {
    
    new = function(cls)
        local self = {
            savedata = {
                uiByID = {}, 
                temporaryUIIDs = {} 
            };
            uiByID = {}; 
            uiBySteamID = { 
                all = {}
            };

            init = cls.init,
            trackEntity = cls.trackEntity,
            stopTracking = cls.stopTracking,
            getUIByID = cls.getUIByID,
            getUIBySteamID = cls.getUIBySteamID,
            _onPlayerJoin = cls._onPlayerJoin
        }

        return self
    end;

    init = function(self)
        g_savedata.uiManager = g_savedata.uiManager or self.savedata
        self.savedata = g_savedata.uiManager

        for i=1, #self.savedata.temporaryUIIDs do
            local uiID = self.savedata.temporaryUIIDs[i]
            server.removePopup(-1, uiID)
            server.removeMapID(-1, uiID)
        end
        self.savedata.temporaryUIIDs = {}

        for id, elementSave in pairs(self.savedata.uiByID) do
            local element;
            if elementSave.type == "maplabel" then
                element = LifeBoatAPI.UIMapLabel:fromSavedata(elementSave)
            elseif elementSave.type == "mapline" then
                element = LifeBoatAPI.UIMapLine:fromSavedata(elementSave)
            elseif elementSave.type == "mapobject" then
                element = LifeBoatAPI.UIMapObject:fromSavedata(elementSave)
            elseif elementSave.type == "popup" then
                element = LifeBoatAPI.UIPopup:fromSavedata(elementSave)
            elseif elementSave.type == "screenpopup" then
                element = LifeBoatAPI.UIScreenPopup:fromSavedata(elementSave)
            elseif elementSave.type == "mapcollection" then
                element = LifeBoatAPI.UIMapCollection:fromSavedata(elementSave)
                element:beginDisplaying()
            elseif elementSave.type == "popuprelative" then
                element = LifeBoatAPI.UIPopupRelativePos:fromSavedata(elementSave)
            end

            if element and not element.isDisposed then
                self.uiByID[element.id] = element

                local steamID = element.savedata.steamID
                self.uiBySteamID[steamID] = self.uiBySteamID[steamID] or {}
                self.uiBySteamID[steamID][#self.uiBySteamID[steamID]+1] = element
            end
        end

        LB.players.onPlayerConnected:register(self._onPlayerJoin, self)
    end;

    _onPlayerJoin = function(l, self, player)

        local uiForAll = self.uiBySteamID["all"]
        for i=1, #uiForAll do
            local ui = uiForAll[i]
            ui:show(player.id)
        end

        local uiBySteamID = self.uiBySteamID[player.steamID] or {}
        for i=1, #uiBySteamID do
            local ui = uiBySteamID[i]
            ui:show(player.id)
        end
    end;

    trackEntity = function(self, uiElement)
        if uiElement.isDisposed then
            return 
        end

        if uiElement.savedata.isTemporary then
            self.savedata.temporaryUIIDs[#self.savedata.temporaryUIIDs+1] = uiElement.id
        else
            self.savedata.uiByID[uiElement.id] = uiElement.savedata
        end

        self.uiByID[uiElement.id] = uiElement
        self.uiBySteamID[uiElement.savedata.steamID] = uiElement
    end;

    stopTracking = function(self, uiElement)
        self.savedata.uiByID[uiElement.id] = nil
        self.uiByID[uiElement.id] = nil
        self.uiBySteamID[uiElement.savedata.steamID] = nil
    end;

    getUIByID = function(self, uiID)
        return self.uiByID[uiID]
    end;

    getUIBySteamID = function(self, steamID)
        return self.uiBySteamID[steamID] or {}
    end;
}

LifeBoatAPI.MissionManager = {

    new = function(cls)
        local self = {
            savedata = {
                missionsByID = {}
            },
            missionsByType = {},
            missionsByID = {},
            missionTypes = {},

            init = cls.init,
            registerMissionType = cls.registerMissionType,
            getMission = cls.getMission,
            trackInstance = cls.trackInstance,
            stopTracking = cls.stopTracking,
        }

        return self
    end;

    init = function(self)
        g_savedata.missionManager = g_savedata.missionManager or self.savedata
        self.savedata = g_savedata.missionManager

        for missionID, missionSave in pairs(self.savedata.missionsByID) do
            if self.missionTypes[missionSave.type] then
                local missionType = self.missionTypes[missionSave.type]
                local instance = LifeBoatAPI.MissionInstance:fromSavedata(missionType, missionSave)

                self.missionsByID[instance.id] = instance
                local missionsByTypeList = self.missionsByType[missionSave.type]
                if not missionsByTypeList then
                    self.missionsByType[missionSave.type] = {instance}
                else
                    missionsByTypeList[#missionsByTypeList+1] = instance
                end
            else
                self.savedata.missionsByID[missionID] = nil 
            end
        end
    end;

    getMission = function(self, id)
        return self.missionsByID[id]
    end;

    registerMissionType = function(self, mission)
        self.missionTypes[mission.type] = mission
    end;

    trackInstance = function(self, missionInstance, isTemporary)
        if missionInstance.isDisposed or self.missionsByID[missionInstance.id] then
            return
        end

        self.missionsByID[missionInstance.id] = missionInstance
        local missionsByType = self.missionsByType[missionInstance.savedata.type]
        if not missionsByType then
            self.missionsByType[missionInstance.savedata.type] = {missionInstance}
        else
            missionsByType[#missionsByType+1] = missionInstance
        end

        if not isTemporary then
            self.savedata.missionsByID[missionInstance.id] = missionInstance.savedata
        end
    end;

    stopTracking = function(self, missionInstance)
        
        self.missionsByID[missionInstance.id] = nil
        self.savedata.missionsByID[missionInstance.id] = nil
        local missionsOfType = self.missionsByType[missionInstance.savedata.type]
        if missionsOfType then
            for i=1, #missionsOfType do
                local mission = missionsOfType[i]
                if mission.id == missionInstance.id then
                    table.remove(missionsOfType, i)
                    break
                end
            end
        end
    end;
}

LifeBoatAPI.MissionInstance = {
    _generateID = function()
        g_savedata.lb_nextMissionID = g_savedata.lb_nextMissionID and (g_savedata.lb_nextMissionID + 1) or 0
        return g_savedata.lb_nextMissionID
    end;

    fromSavedata = function(cls, mission, savedata, parent)
        local self = {
            id = savedata.id,
            savedata = savedata,
            mission = mission;
            disposables = {};
            currentStage = nil;
            parent = parent;

            onComplete = LifeBoatAPI.Event:new();

            attach = LifeBoatAPI.lb_attachDisposable;
            onDispose = cls.onDispose;
            next = cls.next;
            terminate = LifeBoatAPI.lb_dispose;
        }

        self.mission.onExecute(self, self.savedata, self.savedata.lastResult)

        if self.isDisposed then
            return self
        end

        local childMission = mission.stages[self.savedata.current]
        if childMission then
            self.savedata.currentChildSavedata = self.savedata.currentChildSavedata or {current = 1}
            self.currentStage = LifeBoatAPI.MissionInstance:fromSavedata(childMission, self.savedata.currentChildSavedata, self)
            if self.currentStage.isDisposed then
                self:next()
            else
                self.disposables[#self.disposables+1] = self.currentStage.onComplete:register(function (l, context, mission)
                    if self.currentStage ~= nil then 
                        self:next() 
                    end
                end)
            end
        end

        return self
    end;

    new = function(cls, mission, params, isTemporary, parent)
        local self = cls:fromSavedata(mission, {
            id = LifeBoatAPI.MissionInstance._generateID(),
            type = mission.type,
            current = 1, 
            lastResult = params
        }, parent)
        
        if not parent then
            LB.missions:trackInstance(self, isTemporary)
        end

        return self
    end;

    next = function(self, name, params)
        
        if self.currentStage then
            local stage = self.currentStage
            self.currentStage = nil 
            stage:terminate()
        end

        self.savedata.lastResult = params
        self.savedata.currentChildSavedata = {
            current = 1, 
            lastResult = params
        }

        self.savedata.current = (name and self.mission.stageIndexesByName[name]) or (self.savedata.current + 1)
        
        local stageData = self.mission.stages[self.savedata.current]
        if not stageData then
            if self.parent then
                
                self.parent:next(nil, params)
            else
                self:terminate()
            end
        else
            self.currentStage = LifeBoatAPI.MissionInstance:fromSavedata(stageData, self.savedata.currentChildSavedata, self)
            if self.currentStage.isDisposed then
                self:next()
            else
                self.disposables[#self.disposables+1] = self.currentStage.onComplete:register(function (l, context, mission)
                    if self.currentStage ~= nil then 
                        self:next() 
                    end
                end)
            end
        end
    end;

    onDispose = function (self)
        if self.onComplete.hasListeners then
            self.onComplete:trigger(self)
        end

        if self.currentStage then
            local stage = self.currentStage
            self.currentStage = nil 
            stage:terminate()
        end

        if not self.parent then
            LB.missions:stopTracking(self)
        end
    end;
}

LifeBoatAPI.Mission = {

    new = function(cls, uniqueMissionTypeName, fun, parent)
        local self = {
            type = uniqueMissionTypeName,
            parent = parent,
            stages = {},
            stageIndexesByName = {},

            onExecute = fun;

            addStage = cls.addStage,
            addNamedStage = cls.addNamedStage,
            start = cls.start,
            startUnique = cls.startUnique,

        }

        LB.missions:registerMissionType(self)

        return self
    end;

    addStage = function(self, fun)
        local child = LifeBoatAPI.Mission:new("", fun, self)
        self.stages[#self.stages+1] = child
        return child
    end;

    addNamedStage = function(self, name, fun)
        local child = LifeBoatAPI.Mission:new(name, fun, self)

        self.stages[#self.stages+1] = child
        self.stageIndexesByName[name] = #self.stages
        
        return child
    end;

    startUnique = function(self, params)
        
        local missionsOfType = LB.missions.missionsByType[self.type]
        
        if missionsOfType and #missionsOfType > 0 then
            return missionsOfType[1]
        else
            local instance = self:start(params)
            return instance
        end
    end;

    start = function(self, params, isTemporary)
        return LifeBoatAPI.MissionInstance:new(self, params, isTemporary)
    end;
}

LifeBoatAPI.Dialog = {

    new = function(cls, lines, defaultTimeout, tickFrequency)
        local self = {
            defaultTimeout = defaultTimeout or 120,
            tickFrequency = tickFrequency,
            lines = {},
            lineIndexesByID = {},
            isProcessed = false,
            hasChoices = true,

            start = cls.start,
            addLine = cls.addLine,
        }

        if lines then
            for i=1, #lines do
                self:addLine(lines[i])
            end
        end

        return self
    end;

    addLine = function(self, line)
        self.lines[#self.lines+1] = line

        if line.choices then
            self.hasChoices = true

            local textParts = {line.text, "\n\n"}
            for i=1, #line.choices do 
                textParts[#textParts+1] = "["
                textParts[#textParts+1] = line.choices[i].phrase
                textParts[#textParts+1] = "] "
            end

            line.textWithChoices = table.concat(textParts)
        else
            line.textWithChoices = line.text
        end

        if line.id then
            self.lineIndexesByID[line.id] = #self.lines
        end 
    end;

    start = function(self, popupOrDrawFunc, player, resultsDefault)
        return LifeBoatAPI.DialogInstance:new(self, popupOrDrawFunc, player, resultsDefault)
    end;
}

LifeBoatAPI.DialogInstance = {

    new = function(cls, dialog, popupOrDrawFunc, player, resultsDefault)

        local self = {
            disposables = {};
            results = resultsDefault or {};
            dialog = dialog;
            player = player;
            lineIndex = 0;
            line = {text="", textWithChoices=""};
            onComplete = LifeBoatAPI.Event:new();

            attach = LifeBoatAPI.lb_attachDisposable;
            gotoNextLine = cls.gotoNextLine;
            onDispose = cls.onDispose;
        }

        self.drawText = popupOrDrawFunc
        if type(popupOrDrawFunc) == "table" then
            
            self.drawText = function(player, line)
                popupOrDrawFunc:edit(line.textWithChoices)
            end
        end

        player:attach(self)

        if self.isDisposed then
            return self
        end

        self.lineTimeout = (not self.line.choices and (self.line.timeout or self.dialog.defaultTimeout)) or nil
        if self.lineTimeout then
            self.lineTimeout = LB.ticks.ticks + self.lineTimeout
        end
        self:gotoNextLine()

        self.disposables[#self.disposables+1] = LB.ticks:register(function (listener, context, deltaTicks)
            if self.lineTimeout then
                if self.lineTimeout < LB.ticks.ticks then
                    self:gotoNextLine()
                end
            end
        end, nil, self.tickFrequency or 30)

        if dialog.hasChoices then
            self.disposables[#self.disposables+1] = player.onChat:register(function (l, context, player, message)
                local line = self.line
                if line.choices then
                    for i=1, #line.choices do
                        local choice = line.choices[i]
                        if choice.customHandler then
                            if choice:customHandler(player, message) then
                                self:gotoNextLine(choice.next, choice.result)
                                return;
                            end
                        elseif message:find(choice.phrase, 0, true) then
                            self:gotoNextLine(choice.next, choice.result)
                            return
                        end
                    end
                end
            end)
        end

        return self
    end;

    gotoNextLine = function(self, nextLineName, choiceResults)
        
        if self.line.result then
            for k,v in pairs(self.line.result) do
                self.results[k] = v
            end
        end

        if choiceResults then
            for k,v in pairs(choiceResults) do
                self.results[k] = v
            end
        end

        local skipNext = false;
        while true do
            
            nextLineName = nextLineName or self.line.next
            self.lineIndex = (skipNext and self.lineIndex + 1) or (nextLineName and self.dialog.lineIndexesByID[nextLineName]) or (self.lineIndex + 1)
            local nextLine = self.dialog.lines[self.lineIndex]
            skipNext = false

            if self.line.terminate ~= nil or not nextLine then
                
                self.drawText(self.player, {text="", textWithChoices=""}) 
                LifeBoatAPI.lb_dispose(self)
                break
            else
                
                self.line = nextLine
                self.lineTimeout = (not self.line.choices and (self.line.timeout or self.dialog.defaultTimeout)) or nil
                if self.lineTimeout then
                    self.lineTimeout = LB.ticks.ticks + self.lineTimeout
                end

                local isValid = true
                if self.line.conditionals then
                    for k,v in pairs(self.line.conditionals) do
                        if self.results[k] ~= v then
                            isValid = false
                            skipNext = true
                            break
                        end
                    end
                end

                if isValid then
                    self.drawText(self.player, self.line)
                    break
                end
                
            end
        end
    end;

    onDispose = function(self)
        if self.onComplete.hasListeners then
            self.onComplete:trigger(self, self.results, self.player)
        end
    end;
}

LifeBoatAPI.DialogUtils = {

    newSimpleZoneDialog = function(zone, dialogModel, npc, heightOffset, goodbyeLine, onDialogStarted, onDialogComplete, defaultResults, popupRange, displayLocally, useRelativePosPoup)
        popupRange = popupRange or 100
        heightOffset = heightOffset or 1

        local disposable = LifeBoatAPI.SimpleDisposable:new()

        local popup;
        local collision = zone.onCollision:register(function (l, context, zone, collision, collidingWith)

            local player = collidingWith
            if not player.onChat then
                return
            end

            if popup then
                
                return;
            end
            
            if useRelativePosPoup then
            popup = LifeBoatAPI.UIPopupRelativePos:new(displayLocally and player or nil, "", LifeBoatAPI.Matrix:newMatrix(0, heightOffset, 0), nil, popupRange, npc, true)
            else
                popup = LifeBoatAPI.UIPopup:new(displayLocally and player or nil, "", 0, heightOffset, 0, popupRange, npc, true)
            end

            local dialog = dialogModel:start(popup, player, defaultResults)
            collision:attach(dialog)

            if onDialogStarted then
                onDialogStarted(dialog)
            end

            dialog.onComplete:register(onDialogComplete)

            collision.onCollisionEnd:register(function (l, context, collision)
                
                if dialog and not dialog.isDisposed then
                    popup:edit(goodbyeLine)
                    LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
                else
                    LifeBoatAPI.lb_dispose(popup)
                end
                popup = nil
            end)
        end)

        disposable:attach(collision)
        
        return disposable
    end;
}

LifeBoatAPI.LB = {

    new = function(cls)
        
        local self = {
            init = cls.init
        }

        self.collision = LifeBoatAPI.CollisionManager:new(); 
        self.players = LifeBoatAPI.PlayerManager:new();
        self.events = LifeBoatAPI.EventManager:new(); 
        self.ticks = LifeBoatAPI.TickManager:new();
        self.addons = LifeBoatAPI.AddonManager:new();
        self.objects = LifeBoatAPI.ObjectManager:new();
        self.ui = LifeBoatAPI.UIManager:new();
        self.missions = LifeBoatAPI.MissionManager:new()
        return self
    end;

    init = function(self)
        self.savedata = g_savedata
        self.events:init()
        self.ticks:init()
        self.collision:init()
        self.addons:init()
        self.players:init()
        self.objects:init()
        self.ui:init()
        self.missions:init()

        if self.events.onCreate.hasListeners then
            self.events.onCreate:trigger()
        end
    end;
}

LB = LifeBoatAPI.LB:new()

Mission_JacksQuest = LifeBoatAPI.Mission:new("Jack and The Lifter", function (self, savedata, params)
    
    if g_savedata.jacksQuestComplete then
        self:terminate()
        return 
    end

    server.announce("Mission Active", "Jack and The Lifter")

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

    local cheat = LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
        if command == "?lb_dev_end_cheat" then
            self:next()
        end
    end)
    self:attach(cheat)
end)

    Mission_JacksQuest:addStage(function (self, savedata, params)
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

        local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "Oh, well goodbye I guess!",
            function (dialog)
                
                dialog:gotoNextLine(savedata.hasAccepted and "accept" or savedata.hasSpokenOnce and "altstart" or "start")
            end,
            function (l, context, dialog, results, player)
                
                LifeBoatAPI.lb_copy(results, savedata)
                if results.missionAccepted then
                    server.notify(-1, "Accepted: Jack and The Lifter", "Take Jack's lifter to the workbench and fix it.", LifeBoatAPI.Constants.NotifiationTypes.new_mission)
                    self:terminate()
                end
            end)

        self:attach(dialogHandler)
    end)

    Mission_JacksQuest:addStage(function (self, savedata, params)
        local mainsave = self.parent.savedata

        local lifter = LB.objects:getVehicle(mainsave.lifterID)
        local workbenchZone = LB.objects:getZone(mainsave.workbenchZoneID)
        local workbenchCenter = LB.objects:getZone(mainsave.workbenchCenterID)

        local lifterPopupText = "Jack's Lifter."
        local lifterPopup = LifeBoatAPI.UIPopup:new(nil, lifterPopupText, 0, 1.5, 0, 500, lifter, true)
        self:attach(lifterPopup)

        self:attach(
            LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
                if command == "?lb_dev_skip_cheat" then
                    server.setVehiclePos(lifter.id, workbenchZone.transform)
                end
            end)
        )

        local collisionListener = workbenchZone.onCollision:register(function (l, context, zone, collision, collidingWith)
            
            lifterPopup:edit("")

            collision:attach(LifeBoatAPI.UIPopupRelativePos:new(nil, "Use workbench to edit Jack's Lifter", LifeBoatAPI.Matrix:newMatrix(0, 0, 0), nil, 50, workbenchCenter, true))

            collision.onCollisionEnd:register(function (l, context, collision)
                
                lifterPopup:edit(lifterPopupText)
            end)
        end)
        self:attach(collisionListener)

        local lifterDespawnListener = lifter.onDespawn:await()
        :andImmediately(function (cr, deltaTicks, lastResult)
            
            local jack = LB.objects:getNPC(mainsave.jackID)
            local jackMoveTo = LB.objects:getZone(mainsave.jackMoveTo2)
            server.setObjectPos(jack.id, jackMoveTo.transform)

            self:next() 
        end)
        self:attach(lifterDespawnListener)
        
    end)

    local fixQuest = Mission_JacksQuest:addNamedStage("FixLifter", function (self, savedata, params)
    end)

        local isRespawn = true; 
        fixQuest:addNamedStage("WaitForSpawn", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            if isRespawn then
                isRespawn = false;
                local jack = LB.objects:getNPC(mainsave.jackID)
                local popup = LifeBoatAPI.UIPopup:new(nil, "Once you've fixed it in the workbench\n\nJust spawn it back again.", 0, 1, 0, 50, jack, true)
                self:attach(popup)
            end

            local listener = LB.events.onVehicleSpawn:register(function (l, context, vehicleID, peerID, x, y, z, cost)
                if peerID >= 0 then
                    local vehicle = LifeBoatAPI.Vehicle:fromUntrackedSpawn(vehicleID, peerID, cost)
                    
                    vehicle:awaitLoaded()
                    :andThen(function (cr, deltaTicks, lastResult)
                        local dial, success = server.getVehicleDial(vehicleID, "LBJACKLIFTER")
                        if success then
                            vehicle:setCollisionLayer("lifter")
                            mainsave.lifterID = vehicle.id
                            self.parent.parent:attach(vehicle)
                            self:terminate()
                        end
                    end)
                end
            end)
    
            self:attach(listener)
        end)

        fixQuest:addNamedStage("TestLifter", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            local vehicle = LB.objects:getVehicle(mainsave.lifterID)
            
            if not vehicle then
                self.parent:next("WaitForSpawn")
            else
                local vehicleListener = vehicle.onDespawn:await():andImmediately(function (cr, deltaTicks, lastResult)
                    self.parent:next("WaitForSpawn")
                end)
                self:attach(vehicleListener)

                local jack = LB.objects:getNPC(mainsave.jackID)
                local popup = LifeBoatAPI.UIPopup:new(nil, "Nice, now give it a test run!", 0, 1, 0, 100, jack, true)
                LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
                self:attach(popup)

                local onButton = vehicle.onButtonPress:register(function (l, context, vehicle, player, buttonName)
                    if buttonName == "MISSION_TURNON" and server.getVehicleButton(vehicle.id, buttonName).on then

                        local popup = LifeBoatAPI.UIPopup:new(nil, "Ohh, it's moving...\n\nIt's...\n\nIt's...", 0, 1, 0, 100, jack, true)
                        LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 180)
                        self:attach(popup)

                        LifeBoatAPI.CoroutineUtils.delay(200)
                        :andImmediately(function (cr, deltaTicks, lastResult)
                            local dial, success = server.getVehicleDial(vehicle.id, "LBJACKLIFTER")
                            if success and dial.value > 1 then

                                local popup = LifeBoatAPI.UIPopup:new(nil, "It's...Working!\n\nCome over and let's talk!", 0, 1, 0, 100, jack, true)
                                LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
                                    :andThen(function (cr, deltaTicks, lastResult)
                                        self.parent:next()
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

        local testSuccess = fixQuest:addNamedStage("TestSuccess", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            local jack = LB.objects:getNPC(mainsave.jackID)
            local zone = jack.childZones[1]

            local jackDialogModel = LifeBoatAPI.Dialog:new({
                { id="start",       text = "Thanks for fixing it!\n\nYou've done a great job.", },
                {                   text = "I know I'm asking a lot.\n\nBut could you give it a lick of paint too?",
                                        result={hasSpokenOnce=true},
                                        choices={ {phrase="ok", next="accept", result={paintJob=true}},
                                                  {phrase="reward", next="reward"},
                                                  {phrase="no", next="basic"}}, showChoices=true},
                            
                { id="reward",      text = "Well, I owe you $5000 for the main job"},
                {                   text = "I can throw in an extra $2500.\n\nIf you re-paint it for me",
                                        choices= { {phrase="ok",   next="accept", result={paintJob=true}},
                                                   {phrase="nope", next="basic"}}, showChoices=true },
            
                { id="accept",      text = "Great!\n\nJust paint it up, then bring it back to me."},
                {                   text = "I'll be back over by my truck", terminate=true, result={gotoTruck=true}},

                { id="basic",       text = "No worries."},
                { id="repeat",      text = "If you can bring it back over to my truck\n\nThen I'll pay you there."},
                {                   text = "Thanks again!", terminate=true, result={gotoTruck=true}},
            }, 120)

            local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "",
                function (dialog)

                    dialog:gotoNextLine(savedata.hasSpokenOnce and "repeat" or "start")
                end,
                function (l, context, dialog, results, player)
                    
                    LifeBoatAPI.lb_copy(results, savedata)
                    if results.paintJob then
                        mainsave.wasPaintJobOffered = true
                        server.notify(-1, "Accepted: Side-Task", "Scrape off the rust and re-paint Jack's lifter.", LifeBoatAPI.Constants.NotifiationTypes.new_mission)
                    end

                    if results.gotoTruck then
                        local teleport = LifeBoatAPI.CoroutineUtils.delay(120):andThen(function (cr, deltaTicks, lastResult)
                            
                            local jackOriginalPos = LB.objects:getZone(mainsave.jackMoveTo1)
                            server.setObjectPos(jack.id, jackOriginalPos.transform)
                        end)
                        self:attach(teleport)
                    end
                end)
            self:attach(dialogHandler)

            local listener = LB.events.onVehicleSpawn:register(function (l, context, vehicleID, peerID, x, y, z, cost)
                if peerID >= 0 then
                    local vehicle = LifeBoatAPI.Vehicle:fromUntrackedSpawn(vehicleID, peerID, cost)
                    vehicle:awaitLoaded()
                    :andThen(function (cr, deltaTicks, lastResult)
                        local dial, success = server.getVehicleDial(vehicleID, "LBJACKLIFTER")
                        if success then
                            vehicle:setCollisionLayer("lifter")
                            mainsave.lifterID = vehicle.id
                            self.parent.parent:attach(vehicle)
                            mainsave.wasPaintJobComplete = savedata.paintJob 
                            l.isDisposed = true
                        end
                    end)
                end
            end)
            self:attach(listener)

            local lifterReturnZone = LB.objects:getZone(mainsave.lifterReturnZoneID)
            local collisionListener = lifterReturnZone.onCollision:register(function (l, context, zone, collision, collidingWith)
                if collidingWith.id == mainsave.lifterID then
                    self.parent:next()
                end
            end)
            self:attach(collisionListener)
        end)

        fixQuest:addNamedStage("Reward", function (self, savedata, params)
            local mainsave = self.parent.parent.savedata

            local jack = LB.objects:getNPC(mainsave.jackID)
            local zone = jack.childZones[1]

            local jackOriginalPos = LB.objects:getZone(mainsave.jackMoveTo1)
            server.setObjectPos(jack.id, jackOriginalPos.transform)

            local popup = LifeBoatAPI.UIPopup:new(nil, "Over here!", 0, 1, 0, 100, jack, true)
            LifeBoatAPI.CoroutineUtils.disposeAfterDelay(popup, 120)
            self:attach(popup)

            local jackDialogModel = LifeBoatAPI.Dialog:new({
                { id="paintJob",        text = "Amazing, you've really outdone yourself.", next="paintJob2", conditionals={wasPaintJobOffered=true, wasPaintJobComplete=true}},
                { id="paintJob_off",    text = "I thought you said you'd paint it?\n\nNevermind, this is still good.", next="paintJob_off2", conditionals={wasPaintJobOffered=true}},

                { id="noPaintJob",  text = "Thanks for fixing it!\n\nYou've done a great job."},
                {                   text = "Here's your reward, $5000 as promised."},
                {                   text = "I'm going to finish up these potatoes, and then I guess I'll be going.", terminate=true, result={complete=true}},

                { id="paintJob2",   text = "I've got $5000 for fixing it.\n\nAnd another $2500 for the paint job!"},
                {                   text = "I best finish up the potatoes now.\n\nI'll be off shortly."},
                {                   text = "If you ever want.\n\nYou'd always be welcome on the farm with me."},
                {                   text = "Anyway, cheerio!", terminate=true, result={complete=true}},

                { id="paintJob_off2",   text = "I've got $5000 for fixing it."},
                {                   text = "But I can't pay you for not painting it.\n\n"},
                {                   text = "I'll be honest.\n\nI'd rather you'd just declined if you couldn't do it."},
                {                   text = "Well, I'm off.\n\n Thanks again!", terminate=true, result={complete=true}}

            }, 120)

            local dialogHandler = LifeBoatAPI.DialogUtils.newSimpleZoneDialog(zone, jackDialogModel, jack, 1.0, "",
                nil,
                function (l, context, dialog, results, player)
                    
                    LifeBoatAPI.lb_copy(results, savedata)

                    if results.complete then
                        if not mainsave.rewardPaid then
                            server.notify(-1, "Reward", "You've been paid $5000 for completing 'Jack and The Lifter'.", LifeBoatAPI.Constants.NotifiationTypes.complete_mission)
                            if mainsave.wasPaintJobComplete then
                                server.notify(-1, "Bonus Reward", "Jack has paid you an additional $2500 for painting the lifter.", LifeBoatAPI.Constants.NotifiationTypes.complete_mission)
                            end

                            mainsave.rewardPaid = true
                            local reward = 5000 + (mainsave.wasPaintJobComplete and 2500 or 0)
                            server.setCurrency(server.getCurrency() + reward, server.getResearchPoints())
                        end

                        self:terminate()
                    end

                end, {wasPaintJobOffered=mainsave.wasPaintJobOffered,
                      wasPaintJobComplete=mainsave.wasPaintJobComplete})
    
            self:attach(dialogHandler)
        end)

    Mission_JacksQuest:addStage(function (self, savedata, params)        
        g_savedata.jacksQuestComplete = true

        local timeout = LifeBoatAPI.CoroutineUtils.delay(300)
            :andThen(function (cr, deltaTicks, lastResult)
                self:terminate()
            end)
        self:attach(timeout)
    end)

LB.events.onCreate:register(function (l, context)
    
    Mission_JacksQuest:startUnique()
end)

onCreate = function(isWorldCreate)
	
	LB.events.trackPlayerChat = true
    LB.events.trackButtonPress = true
	LB:init()
end

LB.events.onCustomCommand:register(function (l, context, fullMessage, peerID, isAdmin, isAuth, command, ...)
    local args = {...}

    if command == "?lb_reset" then

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

        g_savedata.jacksQuestComplete = false
        Mission_JacksQuest:startUnique()
    end
end)

