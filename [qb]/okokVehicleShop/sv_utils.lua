local QBCore = exports[Config.qbPrefix.."-core"]:GetCoreObject()

local WebhookLink = '' -- PUT YOUR WEBHOOK LINK HERE

function Webhook()
	return WebhookLink
end

function QBCoref()
	return exports[Config.qbPrefix.."-core"]:GetCoreObject()
end

function MySQLexecute(query, values, func)
	return MySQL.query(query, values, func)
end

function MySQLinsert(query, values, func)
	return MySQL.Async.insert(query, values, func)
end

function addMoney(xPlayer, account, amount)
	xPlayer.Functions.AddMoney(account, tonumber(amount))
end

function removeMoney(xPlayer, account, amount)
	xPlayer.Functions.RemoveMoney(account, tonumber(amount))
end

function isAdminF(source)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local playerGroup = QBCore.Functions.GetPermission(_source)
	local isAdmin = false
		
	if Config.QBPermissionsUpdate then
		if Config.UseNewStaffCheckMethod then 
			for k,v in ipairs(Config.AdminGroups) do
				if QBCore.Functions.HasPermission(_source, v) then
					isAdmin = true
					break
				end
			end
		else
			for group, value in pairs(playerGroup) do
				if value then
					for k,v in ipairs(Config.AdminGroups) do
						if group == v then
							isAdmin = true
							break
						end
					end
				end
			end
		end
	else
		for k,v in ipairs(Config.AdminGroups) do
			if playerGroup == v then
				isAdmin = true
				break
			end
		end
	end

	return isAdmin
end

RegisterServerEvent(Config.EventPrefix..':VehicleBought')
AddEventHandler(Config.EventPrefix..':VehicleBought', function (source, vehicleModel, price)
	-- Execute code after vehicle has been bought
end)

RegisterServerEvent(Config.EventPrefix..':setVehicleOwned')
AddEventHandler(Config.EventPrefix..':setVehicleOwned', function (vehicleProps, vehicleModel, id)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local isBoat = false

	for k,v in ipairs(Config.VehicleShopBoat) do
		if v == id then
			isBoat = true
			break
		end
	end

	if not isBoat then
		MySQLexecute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
			['@license'] = xPlayer.PlayerData.license,
			['@citizenid'] = xPlayer.PlayerData.citizenid,
			['@vehicle'] = vehicleModel,
			['@hash'] = GetHashKey(vehicleModel),
			['@mods'] = json.encode(vehicleProps),
			['@plate'] = vehicleProps.plate,
			['@state'] = 0
		}, function (rowsChanged)
		end)
	else
		MySQLexecute('INSERT INTO player_boats (citizenid, model, plate) VALUES (@citizenid, @model, @plate)', {
			['@citizenid'] = xPlayer.PlayerData.citizenid,
			['@model'] = vehicleModel,
			['@plate'] = vehicleProps.plate,
		}, function (rowsChanged)
		end)
	end
end)

QBCore.Functions.CreateCallback(Config.EventPrefix..":HasLicense", function(source, cb, license)
	local hasLicense = false

	if license == "" then
		hasLicense = true
	elseif license == "boat" then
		-- Add the checks to see if the player has the license
		hasLicense = true
	end

	cb(hasLicense)
end)

QBCore.Functions.CreateCallback(Config.EventPrefix..":canOpenMenu", function(source, cb, shop_id)
	local canOpenShop = true

	-- Here you can make the verifications you want,
	-- For example check if a no VIP person is trying to open a VIP shop, if so change canOpenShop to false

	cb(canOpenShop)
end)