local IsPaused = false

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(300)
        SendNUIMessage({
            armor = GetPedArmour(GetPlayerPed(-1)),
            life = (GetEntityHealth(GetPlayerPed(-1))-100),
        })
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300)
        if IsPauseMenuActive() and not IsPaused then
            IsPaused = true
            SendNUIMessage({action = "toggle", show = false})
        elseif not IsPauseMenuActive() and IsPaused then
            IsPaused = false
            SendNUIMessage({action = "toggle", show = true})
        end
    end
end)

RegisterNetEvent("esx_betterhud:updateBasics")
AddEventHandler("esx_betterhud:updateBasics", function(status)
    SendNUIMessage({
        action = "updateStatus",
        status = status,
    })
end)

