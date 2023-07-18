-- @main

CreateThread(function ()
    while true do
        local player = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(player) 
	local fuel = 100
	local fuelSystem = string.upper(Config.FuelSystem)
	if (fuelSystem == "LEGACYFUEL") then
		local fuelLevel = exports['LegacyFuel']:GetFuel(vehicle)
		fuel = math.floor(fuelLevel)
	elseif (fuelSystem == "NDFUEL") then
		local fuelLevel = exports['ND_Fuel']:GetFuel(vehicle) -- MUST ADD EXPORT IN NDFUEL SCRIPT
		fuel = math.floor(fuelLevel)
	elseif (fuelSystem == "DEFAULT") then
		local fuelLevel = GetVehicleFuelLevel(vehicle)
		fuel = math.floor(fuelLevel)
	elseif (fuelSystem == "CUSTOM") then
		-- Add Here the custom code
		-- fuel = math.floor(CUSTOM CODE FOR GET FUEL)
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
