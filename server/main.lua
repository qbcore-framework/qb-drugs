QBCore = nil
CurrentCops = 0

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

-- Code

-- Citizen.CreateThread(function()
--     local Hour = (60 * 1000) * 60
--     SetTimeout(math.random((Hour * 1), (Hour * 3)), function()
--         table.insert(Config.Dealers[2]["products"], {
--             name = "weapon_snspistol",
--             price = 5000,
--             amount = 1,
--             info = {
--                 serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
--             },
--             type = "item",
--             slot = 5,
--             minrep = 200,
--         })
--         table.insert(Config.Dealers[3]["products"], {
--             name = "weapon_snspistol",
--             price = 5000,
--             amount = 1,
--             info = {
--                 serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
--             },
--             type = "item",
--             slot = 5,
--             minrep = 200,
--         })
--         TriggerClientEvent('qb-drugs:AddWeapons', -1)
--     end)
-- end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
