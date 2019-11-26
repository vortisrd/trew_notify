ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(status)
	TriggerClientEvent('trew_hud_ui:syncCarLights', -1, source, status)
end)

TriggerEvent('es:addCommand', 'not', function()
end, {help = ''})


RegisterServerEvent('trew_hud_ui:admNotifyCheck')
AddEventHandler('trew_hud_ui:admNotifyCheck', function(args)
	local xPlayer = ESX.GetPlayerFromId(source)
	if (xPlayer.getGroup() == 'admin') or (xPlayer.getGroup() == 'superadmin') then
		TriggerClientEvent('trew_hud_ui:admNotifyPrompt', source, args)
	end
end)

RegisterServerEvent('trew_hud_ui:adminNotifyAllPlayers')
AddEventHandler('trew_hud_ui:adminNotifyAllPlayers', function(args)

	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		TriggerClientEvent('trew_hud_ui:admNotifyShow', xPlayers[i], args)
	end
	
end)