RegisterNetEvent('antimotorbreak:repairVehicle')
AddEventHandler('antimotorbreak:repairVehicle', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) then
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineHealth(vehicle, 1000.0)
        SetVehicleBodyHealth(vehicle, 1000.0)
        SetVehiclePetrolTankHealth(vehicle, 1000.0)
        SetVehicleDirtLevel(vehicle, 0.0)

        -- Notificatie voor de speler
        if Config.Framework == "ESX" then
            TriggerEvent('esx:showNotification', "Je voertuig is gerepareerd!")
        elseif Config.Framework == "QBCore" then
            TriggerEvent('QBCore:Notify', "Je voertuig is gerepareerd!", "success")
        else
            TriggerEvent('chat:addMessage', { args = {"[Server]", "Je voertuig is gerepareerd!"}, color = {0, 255, 0} })
        end
    else
        if Config.Framework == "ESX" then
            TriggerEvent('esx:showNotification', "Je zit niet in een voertuig!")
        elseif Config.Framework == "QBCore" then
            TriggerEvent('QBCore:Notify', "Je zit niet in een voertuig!", "error")
        else
            TriggerEvent('chat:addMessage', { args = {"[Server]", "Je zit niet in een voertuig!"}, color = {255, 0, 0} })
        end
    end
end)
