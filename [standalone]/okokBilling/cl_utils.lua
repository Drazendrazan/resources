QBCore = exports["qb-core"]:GetCoreObject()

Citizen.CreateThread(function() 
	while true do 
		Citizen.Wait(1)
		if IsControlJustReleased(1, Config.OpenMenuKey) then
			TriggerEvent(Config.EventPrefix..":OpenSelectionMenu")
		end
	end
end)

RegisterCommand(Config.OpenMenuCommand, function(source, args, rawCommand)
	TriggerEvent(Config.EventPrefix..":OpenSelectionMenu")
end)

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, time, type)
	if Config.UseOKOKNotify then
		exports['okokNotify']:Alert(title, text, time, type)
	else
		TriggerEvent('QBCore:Notify', text, type, time)
	end
end)

function onMenuClose()
	-- Code to execute when the menu is closed
end

function playerjob()
	return QBCore.Functions.GetPlayerData().job
end

function playerjoblabel()
	return QBCore.Functions.GetPlayerData().job.label
end

function playerCitizenid()
	return QBCore.Functions.GetPlayerData().citizenid
end