local cornerselling = false
local hasTarget = false
local startLocation = nil
local lastPed = {}
local stealingPed = nil
local stealData = {}
local availableDrugs = {}
local currentOfferDrug = nil

CurrentCops = 0

RegisterNetEvent('qb-drugs:client:cornerselling', function()
    QBCore.Functions.TriggerCallback('qb-drugs:server:cornerselling:getAvailableDrugs', function(result)
        if CurrentCops >= Config.MinimumDrugSalePolice then
            if result ~= nil then
                availableDrugs = result
                if not cornerselling then
                    cornerselling = true
                    LocalPlayer.state:set("inv_busy", true, true)
                    QBCore.Functions.Notify(Lang:t("info.started_selling_drugs"))
                    startLocation = GetEntityCoords(PlayerPedId())
                else
                    cornerselling = false
                    LocalPlayer.state:set("inv_busy", false, true)
                    QBCore.Functions.Notify(Lang:t("info.stopped_selling_drugs"))
                end
            else
                QBCore.Functions.Notify(Lang:t("error.has_no_drugs"), 'error')
                LocalPlayer.state:set("inv_busy", false, true)
            end
        else
            QBCore.Functions.Notify(Lang:t("error.not_enough_police", {polices = Config.MinimumDrugSalePolice}), "error")
        end
    end)
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('qb-drugs:client:refreshAvailableDrugs', function(items)
    availableDrugs = items
    if #availableDrugs <= 0 then
        QBCore.Functions.Notify(Lang:t("error.no_drugs_left"), 'error')
        cornerselling = false
        LocalPlayer.state:set("inv_busy", false, true)
    end
end)

local function DrawText3D(x, y, z, text)
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

local function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function toFarAway()
    QBCore.Functions.Notify(Lang:t("error.too_far_away"), 'error')
    LocalPlayer.state:set("inv_busy", false, true)
    cornerselling = false
    hasTarget = false
    startLocation = nil
    availableDrugs = {}
    Wait(5000)
end

local function callPolice()
    TriggerServerEvent('police:server:policeAlert', 'Drug sale in progress')
    hasTarget = false
    Wait(5000)
end

local function SellToPed(ped)
    hasTarget = true
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    local succesChance = math.random(1, 20)

    local scamChance = math.random(1, 5)

    local getRobbed = math.random(1, 20)

    if succesChance <= 7 then
        hasTarget = false
        return
    elseif succesChance >= 19 then
        callPolice()
        return
    end

    local drugType = math.random(1, #availableDrugs)
    local bagAmount = math.random(1, availableDrugs[drugType].amount)

    if bagAmount > 15 then
        bagAmount = math.random(9, 15)
    end
    currentOfferDrug = availableDrugs[drugType]

    local ddata = Config.DrugsPrice[currentOfferDrug.item]
    local randomPrice = math.random(ddata.min, ddata.max) * bagAmount
    if scamChance == 5 then
       randomPrice = math.random(3, 10) * bagAmount
    end

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)

    if getRobbed == 18 or getRobbed == 9 then
        TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
    else
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
    end

    while pedDist > 1.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        if getRobbed == 18 or getRobbed == 9 then
            TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
        else
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        end
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)

        Wait(100)
    end

    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)

    if hasTarget then
        while pedDist < 1.5 and not IsPedDeadOrDying(ped) do
            coords = GetEntityCoords(PlayerPedId(), true)
            pedCoords = GetEntityCoords(ped)
            pedDist = #(coords - pedCoords)
            if getRobbed == 18 or getRobbed == 9 then
                TriggerServerEvent('qb-drugs:server:robCornerDrugs', availableDrugs[drugType].item, bagAmount)
                QBCore.Functions.Notify(Lang:t("info.has_been_robbed", {bags = bagAmount, drugType = availableDrugs[drugType].label}))
                stealingPed = ped
                stealData = {
                    item = availableDrugs[drugType].item,
                    amount = bagAmount,
                }
                TriggerServerEvent('qb-drugs:Server:PedStoleDrugs', stealData)
                hasTarget = false
                local moveto = GetEntityCoords(PlayerPedId())
                local movetoCoords = {x = moveto.x + math.random(100, 500), y = moveto.y + math.random(100, 500), z = moveto.z, }
                ClearPedTasksImmediately(ped)
                TaskGoStraightToCoord(ped, movetoCoords.x, movetoCoords.y, movetoCoords.z, 15.0, -1, 0.0, 0.0)
                lastPed[#lastPed+1] = ped
                break
            else
                if pedDist < 1.5 and cornerselling then
                    DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, Lang:t("info.drug_offer", {bags = bagAmount, drugLabel = currentOfferDrug.label, randomPrice = randomPrice}))
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('qb-drugs:server:sellCornerDrugs', availableDrugs[drugType].item, bagAmount, randomPrice)
                        hasTarget = false

                        loadAnimDict("gestures@f@standing@casual")
                        TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                        Wait(650)
                        ClearPedTasks(PlayerPedId())

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        lastPed[#lastPed+1] = ped
                        break
                    end

                    if IsControlJustPressed(0, 47) then
                        QBCore.Functions.Notify(Lang:t("error.offer_declined"), 'error')
                        hasTarget = false
                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        lastPed[#lastPed+1] = ped
                        break
                    end
                else
                    hasTarget = false
                    pedDist = 5
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    lastPed[#lastPed+1] = ped
                    cornerselling = false
                end
            end
            Wait(3)
        end
        Wait(math.random(4000, 7000))
    end
end

CreateThread(function()
    while true do
        local sleep = 1000
        if stealingPed ~= nil and stealData ~= nil then
            sleep = 0
            if IsEntityDead(stealingPed) then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                local pedpos = GetEntityCoords(stealingPed)
                if #(pos - pedpos) < 1.5 then
                    DrawText3D(pedpos.x, pedpos.y, pedpos.z, Lang:t("info.pick_up_button"))
                    if IsControlJustReleased(0, 38) then
                        RequestAnimDict("pickup_object")
                        while not HasAnimDictLoaded("pickup_object") do
                            Wait(0)
                        end
                        TaskPlayAnim(ped, "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
                        Wait(2000)
                        ClearPedTasks(ped)
                        TriggerServerEvent("qb-drugs:Server:ReturnStolenDrugs", stealData.item, stealData.amount)
                        stealingPed = nil
                        stealData = {}
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if cornerselling then
            sleep = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            if not hasTarget then
                local PlayerPeds = {}
                if next(PlayerPeds) == nil then
                    for _, activePlayer in ipairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(activePlayer)
                        PlayerPeds[#PlayerPeds+1] = ped
                    end
                end
                local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
                if closestDistance < 15.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) and GetPedType(closestPed) ~= 28 then
                    SellToPed(closestPed)
                end
            end
            local startDist = #(startLocation - coords)
            if startDist > 10 then
                toFarAway()
            end
        end
        Wait(sleep)
    end
end)
