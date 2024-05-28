-- Script by Branco ##Branco_Weapons
CreateThread(function()
    while true do
        Wait(0)
      
        local playerPed = GetPlayerPed(-1)
        local weaponsConfig = Config.Weapons[GetSelectedPedWeapon(playerPed)]
        
        if weaponsConfig then
            if weaponsConfig.disableCritical then
                SetPedSuffersCriticalHits(playerPed, true)
            end
            SetWeaponDamageModifier(weaponsConfig.model, weaponsConfig.modifier)
        else
            Wait(500)
        end
    end
end)
