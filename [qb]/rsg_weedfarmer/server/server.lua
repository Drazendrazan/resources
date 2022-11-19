local QBCore = exports['qb-core']:GetCoreObject()

local PlantsLoaded = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if PlantsLoaded then
            TriggerClientEvent('rsg_weedfarmer:client:updateWeedData', -1, Config.Plants)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('rsg_weedfarmer:server:getWeedPlants')
    PlantsLoaded = true
end)

-- weed_white-widow_seed
QBCore.Functions.CreateUseableItem("weed_white-widow_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_white-widow')
    Player.Functions.RemoveItem('weed_white-widow_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_white-widow_seed'], "remove")
end)

-- weed_skunk_seed
QBCore.Functions.CreateUseableItem("weed_skunk_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_skunk')
    Player.Functions.RemoveItem('weed_skunk_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_skunk_seed'], "remove")
end)

-- weed_purple-haze_seed
QBCore.Functions.CreateUseableItem("weed_purple-haze_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_purple-haze')
    Player.Functions.RemoveItem('weed_purple-haze_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_purple-haze_seed'], "remove")
end)

-- weed_og-kush_seed
QBCore.Functions.CreateUseableItem("weed_og-kush_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_og-kush')
    Player.Functions.RemoveItem('weed_og-kush_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_og-kush_seed'], "remove")
end)

-- weed_amnesia_seed
QBCore.Functions.CreateUseableItem("weed_amnesia_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_amnesia')
    Player.Functions.RemoveItem('weed_amnesia_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_amnesia_seed'], "remove")
end)

-- weed_ak47_seed
QBCore.Functions.CreateUseableItem("weed_ak47_seed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg_weedfarmer:client:plantNewSeed', src, 'weed_ak47')
    Player.Functions.RemoveItem('weed_ak47_seed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_ak47_seed'], "remove")
end)

RegisterServerEvent('rsg_weedfarmer:server:saveWeedPlant')
AddEventHandler('rsg_weedfarmer:server:saveWeedPlant', function(data, plantId)
    local data = json.encode(data)

    MySQL.insert('INSERT INTO weed_plants (properties, plantid) VALUES (@properties, @plantid)', {
        ['@properties'] = data,
        ['@plantid'] = plantId
    })
end)

local SeedTable = {
    'weed_white-widow_seed',
    'weed_skunk_seed',
    'weed_purple-haze_seed',
	'weed_og-kush_seed',
	'weed_amnesia_seed',
	'weed_ak47_seed'
}

RegisterServerEvent('rsg_weedfarmer:server:giveSeed')
AddEventHandler('rsg_weedfarmer:server:giveSeed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local RandomSeed = SeedTable[math.random(1, #SeedTable)]
    Player.Functions.AddItem(RandomSeed, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[RandomSeed], "add")
end)

RegisterServerEvent('rsg_weedfarmer:server:plantNewSeed')
AddEventHandler('rsg_weedfarmer:server:plantNewSeed', function(type, location)
    local src = source
    local plantId = math.random(111111, 999999)
    local Player = QBCore.Functions.GetPlayer(src)
    local SeedData = {
        id = plantId, 
        type = type, 
        x = location.x, 
        y = location.y, 
        z = location.z, 
        hunger = Config.StartingHunger, 
        thirst = Config.StartingThirst, 
        growth = 0.0, 
        quality = 100.0, 
        stage = 1, 
        grace = true, 
        beingHarvested = false, 
        planter = Player.PlayerData.citizenid
    }

    local PlantCount = 0

    for k, v in pairs(Config.Plants) do
        if v.planter == Player.PlayerData.citizenid then
            PlantCount = PlantCount + 1
        end
    end

    if PlantCount >= Config.MaxPlantCount then
		TriggerClientEvent('QBCore:Notify', src, 'You already have ' .. Config.MaxPlantCount .. ' plants down', "error")
    else
        table.insert(Config.Plants, SeedData)
        TriggerClientEvent('rsg_weedfarmer:client:plantSeedConfirm', src)
        TriggerEvent('rsg_weedfarmer:server:saveWeedPlant', SeedData, plantId)
        TriggerEvent('rsg_weedfarmer:server:updatePlants')
    end
end)

RegisterServerEvent('rsg_weedfarmer:plantHasBeenHarvested')
AddEventHandler('rsg_weedfarmer:plantHasBeenHarvested', function(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            v.beingHarvested = true
        end
    end

    TriggerEvent('rsg_weedfarmer:server:updatePlants')
end)

RegisterServerEvent('rsg_weedfarmer:destroyPlant')
AddEventHandler('rsg_weedfarmer:destroyPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            table.remove(Config.Plants, k)
        end
    end

    TriggerClientEvent('rsg_weedfarmer:client:removeWeedObject', -1, plantId)
    TriggerEvent('rsg_weedfarmer:server:weedPlantRemoved', plantId)
    TriggerEvent('rsg_weedfarmer:server:updatePlants')
	TriggerClientEvent('QBCore:Notify', src, 'You destroy the weed plant', "error")
end)

RegisterServerEvent('rsg_weedfarmer:harvestWeed')
AddEventHandler('rsg_weedfarmer:harvestWeed', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount
    local label
    local item
    local goodQuality = false
    local hasFound = false

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            for y = 1, #Config.YieldRewards do
                if v.type == Config.YieldRewards[y].type then
                    label = Config.YieldRewards[y].label
                    item = Config.YieldRewards[y].item
                    amount = math.random(Config.YieldRewards[y].rewardMin, Config.YieldRewards[y].rewardMax)
                    local quality = math.ceil(v.quality)
                    hasFound = true
                    table.remove(Config.Plants, k)
                    if quality > 94 then
                        goodQuality = true
                    end
                    amount = math.ceil(amount * (quality / 35))
                end
            end
        end
    end

    if hasFound then
        TriggerClientEvent('rsg_weedfarmer:client:removeWeedObject', -1, plantId)
        TriggerEvent('rsg_weedfarmer:server:weedPlantRemoved', plantId)
        TriggerEvent('rsg_weedfarmer:server:updatePlants')
        if label ~= nil then
			TriggerClientEvent('QBCore:Notify', src, 'You harvest x' .. amount .. ' ' .. label, "success")
        end
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        if goodQuality then
            if math.random(1, 10) > 3 then
                local seed = math.random(1, #Config.SeedRewards)
                Player.Functions.AddItem(Config.SeedRewards[seed], math.random(2, 4))
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SeedRewards[seed]], "add")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Due to poor quality no seeds were harvested!', "error")
        end
    end
end)

RegisterServerEvent('rsg_weedfarmer:server:updatePlants')
AddEventHandler('rsg_weedfarmer:server:updatePlants', function()
    TriggerClientEvent('rsg_weedfarmer:client:updateWeedData', -1, Config.Plants)
end)

RegisterServerEvent('rsg_weedfarmer:server:waterPlant')
AddEventHandler('rsg_weedfarmer:server:waterPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].thirst = Config.Plants[k].thirst + Config.ThirstIncrease
            if Config.Plants[k].thirst > 100.0 then
                Config.Plants[k].thirst = 100.0
            end
        end
    end

    Player.Functions.RemoveItem('water_bottle', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water_bottle'], "remove")
    TriggerEvent('rsg_weedfarmer:server:updatePlants')
end)

RegisterServerEvent('rsg_weedfarmer:server:feedPlant')
AddEventHandler('rsg_weedfarmer:server:feedPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].hunger = Config.Plants[k].hunger + Config.HungerIncrease
            if Config.Plants[k].hunger > 100.0 then
                Config.Plants[k].hunger = 100.0
            end
        end
    end

    Player.Functions.RemoveItem('weed_nutrition', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weed_nutrition'], "remove")
    TriggerEvent('rsg_weedfarmer:server:updatePlants')
end)

RegisterServerEvent('rsg_weedfarmer:server:updateWeedPlant')
AddEventHandler('rsg_weedfarmer:server:updateWeedPlant', function(id, data)
    local result = MySQL.query.await('SELECT * FROM weed_plants WHERE plantid = @plantid', {
        ['@plantid'] = id
    })

    if result[1] then
        local newData = json.encode(data)
        MySQL.update('UPDATE weed_plants SET properties = @properties WHERE plantid = @id', {
            ['@properties'] = newData,
            ['@id'] = id
        })
    end
end)

RegisterServerEvent('rsg_weedfarmer:server:weedPlantRemoved')
AddEventHandler('rsg_weedfarmer:server:weedPlantRemoved', function(plantId)
    local result = MySQL.query.await('SELECT * FROM weed_plants')

    if result then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            if plantData.id == plantId then

                MySQL.query('DELETE FROM weed_plants WHERE id = @id', {
                    ['@id'] = result[i].id
                })

                for k, v in pairs(Config.Plants) do
                    if v.id == plantId then
                        table.remove(Config.Plants, k)
                    end
                end
            end
        end
    end
end)

RegisterServerEvent('rsg_weedfarmer:server:getWeedPlants')
AddEventHandler('rsg_weedfarmer:server:getWeedPlants', function()
    local data = {}
    local result = MySQL.query.await('SELECT * FROM weed_plants')

    if result[1] then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            print(plantData.id)
            table.insert(Config.Plants, plantData)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(Config.GrowthTimer)
        for i = 1, #Config.Plants do
            if Config.Plants[i].growth < 100 then
                if Config.Plants[i].grace then
                    Config.Plants[i].grace = false
                else
                    Config.Plants[i].thirst = Config.Plants[i].thirst - math.random(Config.Degrade.min, Config.Degrade.max) / 10
                    Config.Plants[i].hunger = Config.Plants[i].hunger - math.random(Config.Degrade.min, Config.Degrade.max) / 10
                    Config.Plants[i].growth = Config.Plants[i].growth + math.random(Config.GrowthIncrease.min, Config.GrowthIncrease.max) / 10

                    if Config.Plants[i].growth > 100 then
                        Config.Plants[i].growth = 100
                    end

                    if Config.Plants[i].hunger < 0 then
                        Config.Plants[i].hunger = 0
                    end

                    if Config.Plants[i].thirst < 0 then
                        Config.Plants[i].thirst = 0
                    end

                    if Config.Plants[i].quality < 25 then
                        Config.Plants[i].quality = 25
                    end

                    if Config.Plants[i].thirst < 75 or Config.Plants[i].hunger < 75 then
                        Config.Plants[i].quality = Config.Plants[i].quality - math.random(Config.QualityDegrade.min, Config.QualityDegrade.max) / 10
                    end

                    if Config.Plants[i].stage == 1 and Config.Plants[i].growth >= 55 then
                        Config.Plants[i].stage = 2
                    elseif Config.Plants[i].stage == 2 and Config.Plants[i].growth >= 90 then
                        Config.Plants[i].stage = 3
                    end
                end
            end
            TriggerEvent('rsg_weedfarmer:server:updateWeedPlant', Config.Plants[i].id, Config.Plants[i])
        end
        TriggerEvent('rsg_weedfarmer:server:updatePlants')
    end
end)
