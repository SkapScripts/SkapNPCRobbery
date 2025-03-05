local discordWebhook = "https://discord.com/api/webhooks/1346665137045639260/DqNjTw_fN2W2MW_fOMoMVPH4amRzmoth92n2ai4xi0jbLeUZxwce0uZf9aJcuonI4XF5"
local robberyCooldown = {}

local function Notify(msg, type, time)
    if Config.UseOxLibsNotification then
        lib.notify({
            title = 'Notification',
            description = msg,
            type = type,
            duration = time
        })
    else
        QBCore.Functions.Notify(msg, type, time)
    end
end

local function sendDiscordLog(playerName, rewardItem, money)
    local embed = {
        {
            ["color"] = Config.Color,
            ["title"] = Config.title,
            ["description"] = "**" .. playerName .. "** Robbed a Local.",
            ["fields"] = {
                {
                    ["name"] = Config.Reward,
                    ["value"] = rewardItem and ("items: " .. rewardItem) or "Inga föremål",
                    ["inline"] = true
                },
                {
                    ["name"] = Config.Money,
                    ["value"] = money and ("$" .. money) or "Inga pengar",
                    ["inline"] = true
                },
            },
            ["footer"] = {
                ["text"] = "skapnpcrobbery",
            },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ") 
        }
    }

    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({
        username = Config.Botname, 
        embeds = embed 
    }), { ['Content-Type'] = 'application/json' })
end

QBCore.Functions.CreateCallback('skapnpcrobbery:getPoliceCount', function(source, cb)
    local policeCount = 0
    for _, player in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(player)
        if Player and Player.PlayerData.job and Player.PlayerData.job.name == "police" then
            policeCount = policeCount + 1
        end
    end
    cb(policeCount)
end)

RegisterNetEvent('skapnpcrobbery:giveReward')
AddEventHandler('skapnpcrobbery:giveReward', function(item, money)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerName = GetPlayerName(src)
    local rewardItem = nil

    if item then
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
        Notify(src, Config.Reciveditem .. item, "success", 5000)
        rewardItem = item 
    end

    if money then
        Player.Functions.AddMoney(Config.MoneyType, money)
        Notify(src, Config.Recived .. Config.Money .. money, "success", 5000)
    end
    sendDiscordLog(playerName, rewardItem, money)
end)

QBCore.Commands.Add("checkcooldown", "Check robbery cooldown", {}, false, function(source, args)
    local src = source
    local cooldown = robberyCooldown[src]

    if cooldown and cooldown > GetGameTimer() then
        local remainingCooldown = math.ceil((cooldown - GetGameTimer()) / 1000)
        Notify(src, Config.Wait .. remainingCooldown .. " " .. Config.Sec, 'error', 5000)
    else
        Notify(src, Config.NoActiveCooldown, 'success', 5000)
    end
end)

RegisterNetEvent('skapnpcrobbery:setCooldown')
AddEventHandler('skapnpcrobbery:setCooldown', function(cooldownTime)
    local src = source
    robberyCooldown[src] = GetGameTimer() + (cooldownTime * 1000)
end)
