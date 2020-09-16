--[[

    github.com/szymixooo

]]

function text(font, proportional, scale1, scale2, entry, compstring, x, y)
    SetTextFont(font)
    SetTextProportional(proportional)
    SetTextScale(scale1, scale2)
    SetTextEntry(entry)
    AddTextComponentString(compstring)
    DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            local speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*4.6
            local rpm = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1), false))*10000
            local gear = GetVehicleCurrentGear(GetVehiclePedIsIn(GetPlayerPed(-1), false))
            if gear == 0 then gear = "N" end
            local status = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false))/10
            text(1, 0, 1.5, 1.5, "STRING", math.floor(speed).." KM/H", 0.16, 0.9)
            text(4, 0, 0.5, 0.5, "STRING", "RPM: "..math.floor(rpm), 0.16, 0.88)
            text(4, 0, 0.5, 0.5, "STRING", "BIEG: "..gear, 0.22, 0.88)
            text(4, 0, 0.5, 0.5, "STRING", "STAN: "..math.floor(status).."%", 0.16, 0.85)
        end
    end
end)