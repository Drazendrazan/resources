local QBCore = exports['qb-core']:GetCoreObject()

-- remove token
RegisterServerEvent("rsg_moneywash:server:removetoken")
AddEventHandler("rsg_moneywash:server:removetoken", function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

-- money washing
RegisterServerEvent("rsg_moneywash:server:dowashing")
AddEventHandler("rsg_moneywash:server:dowashing", function(amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local amount = tonumber(amount)
	local checkdirty = Player.Functions.GetItemByName(Config.MoneyType)
	if checkdirty ~= nil then
		local amountdirty = Player.Functions.GetItemByName(Config.MoneyType).amount
		if amountdirty >= amount then
			local cut = math.percent(Config.CutPercentage,amount)
			local moneycut = math.floor(cut)
			Player.Functions.RemoveItem(Config.MoneyType, amount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyType], "remove")
			Player.Functions.AddMoney('cash', moneycut)
			TriggerClientEvent('QBCore:Notify', src, 'You washed '..amount..' dirty money and recieved $'..moneycut..' cash', 'success')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough dirty money to do that!', 'error')
		end
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have any dirty money!', 'error')
	end
end)

function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end