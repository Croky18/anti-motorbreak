local framework = Config.Framework

-- Functie om te checken of de speler op de whitelist staat
local function isWhitelisted(source)
    local identifiers = GetPlayerIdentifiers(source)
    for _, id in pairs(identifiers) do
        for _, whitelistedID in pairs(Config.WhitelistedPlayers) do
            if id == whitelistedID then
                return true
            end
        end
    end
    return false
end

-- Functie om te checken of een speler admin is in ESX/QBCore
local function isAdmin(source)
    if framework == "ESX" then
        local xPlayer = exports['es_extended']:getSharedObject().GetPlayerFromId(source)
        return xPlayer and (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin')
    elseif framework == "QBCore" then
        local Player = exports['qb-core']:GetCoreObject().Functions.GetPlayer(source)
        return Player and Player.PlayerData.job.name == "admin"
    else
        return IsPlayerAceAllowed(source, "command.repair")
    end
end

-- Whitelist repair command
RegisterCommand(Config.RepairCommand, function(source)
    if isWhitelisted(source) or isAdmin(source) then
        TriggerClientEvent('antimotorbreak:repairVehicle', source)
    else
        TriggerClientEvent('chat:addMessage', source, { args = {"[Server]", "Je hebt geen permissie om deze command te gebruiken!"}, color = {255, 0, 0} })
    end
end, false)
