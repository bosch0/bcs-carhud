local client = {
    loaded = false,
    ped = PlayerPedId(),
}

local function formatSpeed(speed)
    if (not speed) then return 0 end
    return CarHUD.type == 'km/h' and math.floor(speed * 3.6) or math.floor(speed * 2.236936)
end

local function getVehicleFuel(vehicle)
    return GetResourceState('LegacyFuel'):match('start') and exports.LegacyFuel:GetFuel(vehicle) or
        GetVehicleFuelLevel(vehicle)
end

local function loadSpeedometer()
    if (client.loaded) then return end
    client.loaded = true
    CreateThread(function()
        while (client.loaded) do
            SendNUIMessage({
                type = 'update',
                speed = IsPedInAnyVehicle(client.ped, false) and
                    formatSpeed(GetEntitySpeed(GetVehiclePedIsIn(client.ped), false)) or 0,
                fuel = IsPedInAnyVehicle(client.ped, false) and getVehicleFuel(GetVehiclePedIsIn(client.ped), false) or 0,
                vehicle = IsPedInAnyVehicle(client.ped, false) and not IsPauseMenuActive(),
                currentType = CarHUD.type,
            })
            Wait(IsPedInAnyVehicle(client.ped, false) and 150 or 1000)
        end
    end)
end

RegisterNetEvent('onClientResourceStart', loadSpeedometer)
