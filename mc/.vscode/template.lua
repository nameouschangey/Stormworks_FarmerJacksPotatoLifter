--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey

--[====[ EDITABLE SIMULATOR CONFIG - *automatically removed from the F7 build output ]====]
---@section __LB_SIMULATOR_ONLY__
do
    ---@type Simulator -- Set properties and screen sizes here - will run once when the script is loaded
    simulator = simulator
    simulator:setScreen(1, "3x3")
    simulator:setProperty("ExampleNumberProperty", 123)

    -- Runs every tick just before onTick; allows you to simulate the inputs changing
    ---@param simulator Simulator Use simulator:<function>() to set inputs etc.
    ---@param ticks     number Number of ticks since simulator started
    function onLBSimulatorTick(simulator, ticks)
        screenConnection = simulator:getTouchScreen(1)
        simulator:setInputBool(1, screenConnection.isTouched)
        simulator:setInputNumber(1, screenConnection.width)
        simulator:setInputNumber(2, screenConnection.height)
        simulator:setInputNumber(3, screenConnection.touchX)
        simulator:setInputNumber(4, screenConnection.touchY)
    end;
end
---@endsection


newBar = function(title, position)
    return {
        title = title,
        isActive = false,
        isSuccess = false,
        
        update = function()

        end;

        draw = function()
            
        end;
    }
end

newRand = function(seed)
    return function()
        seed = ((seed * 1103515245) + 12345) % 65564
        return seed/65564
    end
end;

selectionStage = 1
ticks = 0
rand = newRand(100)
total = 0
function onTick()
    ticks = ticks + 1
    total = total + rand()

    average = total / ticks
    output.setNumber(1, average)
end

function onDraw()
    a = screen.getWidth()
    screen.drawRect(5,5, screen.getWidth()-10,10)
    screen.drawText(7,7, "HOPS")

    screen.drawRect(5,25, screen.getWidth()-10,10)
    screen.drawText(7,27, "BARLEY")

    screen.drawRect(5,45, screen.getWidth()-10,10)
    screen.drawText(7,47, "WATER")

    screen.drawRect(5,65, 7,7)
    screen.drawText(7,65, "X")

    screen.drawRect(15,65, 7,7)
    screen.drawText(17,65, "X")

    screen.drawRect(25,65, 7,7)
    screen.drawText(27,65, "O")
end