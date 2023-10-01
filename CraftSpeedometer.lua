function text(content)
    local x, y = 0.9, 0.7
    local outlineThickness = 0.1 -- Adjust this value to control the outline thickness

    -- Draw the outline for speed
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.9, 1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content .. " kph") -- Speed text (changed to lowercase)
    SetTextOutline()
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(5, 0, 0, 0, 255) -- Adjust the last parameter for outline color (R, G, B, Alpha)
    DrawText(x - outlineThickness, y - outlineThickness)

    -- Reset the text scale for the main text
    SetTextScale(1.9, 1.9)

    -- Draw the main text
    SetTextEdge(0, 0, 0, 0, 0) -- Reset text edge to prevent outline on the main text
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            local speed = math.floor(GetEntitySpeed(vehicle) * 3.6) -- kph handlings
            text(speed)
        end
    end
end)
