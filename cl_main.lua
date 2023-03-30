-- @main

CreateThread(function ()
    while true do
        local player = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(player)
        local fuel = math.floor(exports['LegacyFuel']:GetFuel(vehicle))
        if not CarHUD.LegacyFuel then
            fuel = 100
        end
        if CarHUD.type == 'mp/h' then
            vel = math.floor(GetEntitySpeed(vehicle) * 2.236936)
        elseif CarHUD.type == 'km/h' then
            vel = math.floor(GetEntitySpeed(vehicle) * 3.6)
        else
            print('^3[BCS-carhud]^0 check CarHUD.type in Config.lua')
            vel = nil
        end
        if not IsPauseMenuActive() and IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
            sleep = 50
            SendNUIMessage({
                toggle = true,
                vel = vel,
                fuel = fuel,
                type = CarHUD.type,
                config = CarHUD.fuel
            })
        else
            sleep = 1000
            SendNUIMessage({
                toggle = false
            })
        end
        Wait(sleep)
    end
end)