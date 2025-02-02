Config = {}

-- Kies je framework: "ESX", "QBCore" of "Standalone"
Config.Framework = "QBCore" -- Opties: "ESX", "QBCore", "Standalone"

-- Instellingen voor voertuigmotor
Config.EngineProtection = true -- Voorkomt dat de motor volledig crasht
Config.MinEngineHealth = 400.0 -- Minimum motorgezondheid voordat het wordt gereset
Config.RepairCommand = "repair" -- Command die voertuigen repareert

-- Whitelist voor de repair command (gebruik Steam, Rockstar of Discord identifiers)
Config.WhitelistedPlayers = {
    "steam:110000123456789",  -- Vervang met echte Steam Hex ID's
    "license:123456789012345678", -- Rockstar License ID
    "discord:123456789012345678" -- Discord ID
}
