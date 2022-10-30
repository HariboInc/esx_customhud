ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountPlayers()
	local xPlayers = ESX.GetPlayers()
	PlayersOnline = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        PlayersOnline = PlayersOnline + 1
        print("found one")
	end
    TriggerClientEvent('esx_hud:setPlayers', -1, PlayersOnline)
    SetTimeout(5000, CountPlayers)
end

CountPlayers()