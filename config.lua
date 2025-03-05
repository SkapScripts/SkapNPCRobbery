QBCore = exports['qb-core']:GetCoreObject()
Config = {}

Config.Lang = "SWE" -- ENG or SWE

Config.MoneyType = "cash" -- cash or bank.

Config.UseOxLibsNotification = false  -- True for ox_lib, False for qb notify
Config.Progressbar = "qb"    -- "qb" for QBCore and "ox" for ox
Config.UseOxTarget = false -- True for ox_target, False for qb-target             
Config.Inventory = "qb-inventory" -- qb-inventory, ox_inventory

Config.AllowPoliceRobbery = false -- False if you don't want the police officers to be able to rob  NPCs.
Config.RequiredPolice = 0 -- Minimum number of police officers required to allow a robbery

Config.AggressiveChance = 50 -- 50% chance of the ped getting aggressive.
Config.Weapon = "weapon_pistol" -- The weapon the NPC will have if they are aggressive.
Config.RobberyMethod = "qb-target" -- If you want to be able to rob the locals with just pressing E, Turn this to E, If just qb-target. Turn it to just "qb-target"

Config.DispatchSystem = "ps-dispatch" -- qb-dispatch, ps-dispatch, "none" for no dispatch
Config.PoliceAlertChance = 50 -- How big of a chache it is for the police to get alerted, Now it's 50/50 (under 50, The police get alerted, OVer 50, They do not get alerted)

Config.RobberyCooldown = 300

Config.Minigame = "Circle" -- Circle, Maze, VAR, Thermite, Scrambler.

Config.RobKey = 38 -- This is the key for robbing the NPC when having them as Hostage. [38 = E]
Config.Releasekey = 47 -- This is the key for releasing the NPC when holding them as hostage. [47 = G]

Config.MoneyReward = { min = 100, max = 500 } -- The min and max amount of money you can get from robbing the locals.


Config.RewardItems = {
    { item = "advancedlockpick", chance = 50 },  
    { item = "water", chance = 30 },  
    { item = "lockpick", chance = 20 }  
}

-- Discord Webhook
-- DISCORD WEEBHOOK IS ADDED IN SERVER.LUA!!!
Config.Botname = "SkapScripts NPC Robbery"
Config.Title = "NPC Robbery"
Config.Color = "16711680"
Config.Reward = "Reward: " -- Always leave a empty blank in the end
Config.Money = "Money: " -- Always leave a empty blank in the end

Config.RequiredItems = { -- The player need some of those weapons to rob the NPCs
"weapon_knife",
"weapon_bat",
"weapon_hatchet",
"weapon_stone_hatchet",
"weapon_pistol",
"weapon_pistol_mk2",
"weapon_carbineassaultrifle",
"weapon_assaultsmg",
"weapon_advancedrifle",
"weapon_mg",
"weapon_combatmg",
"weapon_pistol50",
"weapon_snspistol",
"weapon_snspistol_mk2",
"weapon_revolver",
"weapon_revolver_mk2",
    --Add more here
}

if Config.Lang == "ENG" then
    Config.Cantrob = "you can't rob this soon! You'll need to wait for " -- Always leave a blank space at the end.
    Config.Robbing = "Robbing Local"
    Config.Wait = "Wait " -- Always leave a blank space at the end.
    Config.Sec = " Seconds " -- Always leave a blank space at the beginning.
    Config.Rob = "Rob Local"
    Config.Yougot = "You got "
    Config.Failed = "Failed to add item"
    Config.Specialitem = "You'll need a weapon in hand to rob"
    Config.RobberyFailed = "The Robbery failed, he flew"
    Config.YouArePolice = "You can't rob as a police officer"
    Config.DispatchMessage = "Local robbery in progress!"
    Config.Sold = " Sold a " -- Always leave a blank space at the end.
    Config.For = " For: " -- Always leave a blank space at the end & beginning.
    Config.InvalidMoney = "Invalid money type in config"
    Config.Recived = "You got " -- Always leave a blank space at the end.
    Config.Money = "$" 
    Config.Reciveditem = "You recived an item "
    Config.Donthave = "You don't have these items"
    Config.Cannotsold = "This item cannot be sold"
    Config.CantrobNPC = "You cannot rob this Local"
    Config.NoRobberyAsPolice = "You cant rob locals as a police officer"
    Config.CantRobDead = "You can't rob a dead person!"
    Config.NoActiveCooldown = "No active cooldown"
    Config.NotEnoughPolice = "Not enough police officers online!"
    Config.YouReleasedHostage = "You released the hostage"
    Config.HaveAlreadyHostage = "You already got a hostage"
    Config.ReleaseRob = "[G] Release Hostage | [E] Rob Hostage"
    Config.TakeHostage = "Take Hostage"
    Config.NeedToBeBehind = "You need to be behind the local to rob!"
    Config.NeedAim = "You need to aim at the local"
 
elseif Config.Lang == "SWE" then
    Config.Cantrob = "Du kan inte råna såhär snart, Du måste vänta i " -- Lämna alltid ett tomt mellanrum i slutet.
    Config.Robbing = "Rånar invånare.."
    Config.Wait = "Vänta " -- Lämna alltid ett tomt mellanrum i slutet.
    Config.Sec = " Sekunder " -- Lämna alltid ett tomt mellanrum i början.
    Config.Rob = "Råna"
    Config.Failed = "Misslyckades att lägga till föremål!"
    Config.Specialitem = "Du behöver ha ett vapen i handen för att råna"
    Config.RobberyFailed = "Rånet misslyckades, Han smet"
    Config.YouArePolice = "Du kan inte råna som polis!"
    Config.DispatchMessage = "Pågående personrån!"
    Config.Sold = "Sålde en " -- Lämna alltid ett tomt mellanrum i slutet.
    Config.For = " För " -- Lämna alltid ett tomt mellanrum i slutet & början.
    Config.InvalidMoney = "Invalid pengar typ i config"
    Config.Recived = "Du fick " -- Lämna alltid ett tomt mellanrum i slutet.
    Config.Money = "SEK"
    Config.Reciveditem = "Du fick ett föremål"
    Config.Stolen = "Sälj stulet gods"
    Config.Nostolenitems = "Du har inga föremål att sälja"
    Config.Donthave = "Du har inte detta föremål"
    Config.Cannotsold = "Detta föremål kan inte säljas"
    Config.CantrobNPC = "Du kan inte råna denna invånaren"
    Config.NoRobberyAsPolice = "Du kan inte råna invånare som polis"
    Config.CantRobDead = " Du kan ju förfan inte råna en dö människa!"
    Config.NoActiveCooldown = "Ingen aktiv cooldown"
    Config.NotEnoughPolice = "Inte tillräckligt med poliser online!"
    Config.YouReleasedHostage = "Du släppte gisslan"
    Config.HaveAlreadyHostage = "Du har redan en gisslan"
    Config.ReleaseRob = "[G] Släpp | [E] Råna"
    Config.TakeHostage = "Ta gisslan"
    Config.NeedToBeBehind = "Du måste vara bakom NPC:n för att ta den som gisslan!"
    Config.NeedAim = "Du måste sikta på NPC:n"
end 

Config.BlacklistedPeds = {
    "mp_m_shopkeep_01",  -- Sell Ped, Keep this here, If you change the model to a new, Then change this to the new ped name.
    "s_m_m_security_01"  -- Security guard
}
