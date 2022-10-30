ESX = nil
local  mywater, myfood, OnlinePlayers = 0, 0, 0

RegisterNetEvent("esx_hud:setPlayers")
AddEventHandler("esx_hud:setPlayers", function(players)
    OnlinePlayers = players
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        ESX.PlayerData = ESX.GetPlayerData()
        
        local blackMoney
        local bank
        local money
        for i=1, #ESX.PlayerData.accounts, 1 do
            if ESX.PlayerData.accounts[i].name == 'black_money' then
                blackMoney = ESX.PlayerData.accounts[i].money
            elseif ESX.PlayerData.accounts[i].name == 'bank' then
                bank = ESX.PlayerData.accounts[i].money
            elseif ESX.PlayerData.accounts[i].name == 'money' then
                money = ESX.PlayerData.accounts[i].money
            end
        end
        SendNUIMessage({
            type = "money",
            myMoney = money,
            blackMoney = blackMoney,
            id = GetPlayerServerId(PlayerId()),
            bankMoney = bank,
            playersonline = OnlinePlayers,
            mywater = ESX.Math.Round(mywater),
            myfood = ESX.Math.Round(myfood)
        })
    end
end)

AddEventHandler("dnz_hud:onTick", function(basics)
    myfood, mywater = basics[1].percent, basics[2].percent
end)