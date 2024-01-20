# Branco_Weapons
qb-core Weapon modifier and recoil

Guide
-- -- Branco_Weapons\shared\config.lua 
Config.lua 
Config = {}

-- disableCritical if 'true' then headshot disable if false then headshot enable
-- modifier = 0.5  Modifie how mutch damge the weapon do (over 1.0 then they do more damage ) (under 1.0 it make less damage)
Config.Weapons = {
    [`WEAPON_UNARMED`] = {model = `WEAPON_UNARMED`, modifier = 0.5, disableCritical = true},
    [`WEAPON_NIGHTSTICK`] = {model = `WEAPON_NIGHTSTICK`, modifier = 0.4, disableCritical = true},
    [`WEAPON_CARBINERIFLE`] = {model = `weapon_carbinerifle`, modifier = 0.8, disableCritical = true},
    [`WEAPON_PISTOL50`] = {model = `weapon_pistol50`, modifier = 0.9, disableCritical = true},
    [`WEAPON_SMG`] = {model = `weapon_smg`, modifier = 1.5, disableCritical = true},
    [`WEAPON_MINISMG`] = {model = `weapon_minismg`, modifier = 1.5, disableCritical = true},
    [`WEAPON_PISTOL`] = {model = `weapon_pistol`, modifier = 1.5, disableCritical = true},
    [`WEAPON_COMBATPISTOL`] = {model = `weapon_combatpistol`, modifier = 1.5, disableCritical = true},
    [`WEAPON_SNSPISTOL`] = {model = `weapon_snspistol`, modifier = 1.5, disableCritical = true},
}
-- Got to [qb]\qb-smallresources\client/recoil.lua
-- replace all 

--[[local recoils = {
    -- Handguns
    [`weapon_pistol`] = 0.3,
    [`weapon_pistol_mk2`] = 0.5,
    [`weapon_combatpistol`] = 0.2,
    [`weapon_appistol`] = 0.3,
    [`weapon_stungun`] = 0.1,
    [`weapon_pistol50`] = 0.6,
    [`weapon_snspistol`] = 0.2,
    [`weapon_heavypistol`] = 0.5,
    [`weapon_vintagepistol`] = 0.4,
    [`weapon_flaregun`] = 0.9,
    [`weapon_marksmanpistol`] = 0.9,
    [`weapon_revolver`] = 0.6,
    [`weapon_revolver_mk2`] = 0.6,
    [`weapon_doubleaction`] = 0.3,
    [`weapon_snspistol_mk2`] = 0.3,
    [`weapon_raypistol`] = 0.3,
    [`weapon_ceramicpistol`] = 0.3,
    [`weapon_navyrevolver`] = 0.3,
    [`weapon_gadgetpistol`] = 0.3,
    [`weapon_pistolxm3`] = 0.4,

    -- Submachine Guns
    [`weapon_microsmg`] = 0.5,
    [`weapon_smg`] = 0.4,
    [`weapon_smg_mk2`] = 0.1,
    [`weapon_assaultsmg`] = 0.1,
    [`weapon_combatpdw`] = 0.2,
    [`weapon_machinepistol`] = 0.3,
    [`weapon_minismg`] = 0.1,
    [`weapon_raycarbine`] = 0.3,
    [`weapon_tecpistol`] = 0.3,

    -- Shotguns
    [`weapon_pumpshotgun`] = 0.4,
    [`weapon_sawnoffshotgun`] = 0.7,
    [`weapon_assaultshotgun`] = 0.4,
    [`weapon_bullpupshotgun`] = 0.2,
    [`weapon_musket`] = 0.7,
    [`weapon_heavyshotgun`] = 0.2,
    [`weapon_dbshotgun`] = 0.7,
    [`weapon_autoshotgun`] = 0.2,
    [`weapon_pumpshotgun_mk2`] = 0.4,
    [`weapon_combatshotgun`] = 0.0,

    -- Assault Rifles
    [`weapon_assaultrifle`] = 0.5,
    [`weapon_assaultrifle_mk2`] = 0.2,
    [`weapon_carbinerifle`] = 0.3,
    [`weapon_carbinerifle_mk2`] = 0.1,
    [`weapon_advancedrifle`] = 0.1,
    [`weapon_specialcarbine`] = 0.2,
    [`weapon_bullpuprifle`] = 0.2,
    [`weapon_compactrifle`] = 0.3,
    [`weapon_specialcarbine_mk2`] = 0.2,
    [`weapon_bullpuprifle_mk2`] = 0.2,
    [`weapon_militaryrifle`] = 0.0,
    [`weapon_heavyrifle`] = 0.3,
    [`weapon_tacticalrifle`] = 0.2,

    -- Light Machine Guns
    [`weapon_mg`] = 0.1,
    [`weapon_combatmg`] = 0.1,
    [`weapon_gusenberg`] = 0.1,
    [`weapon_combatmg_mk2`] = 0.1,

    -- Sniper Rifles
    [`weapon_sniperrifle`] = 0.5,
    [`weapon_heavysniper`] = 0.7,
    [`weapon_marksmanrifle`] = 0.3,
    [`weapon_remotesniper`] = 1.2,
    [`weapon_heavysniper_mk2`] = 0.6,
    [`weapon_marksmanrifle_mk2`] = 0.3,
    [`weapon_precisionrifle`] = 0.3,

    -- Heavy Weapons
    [`weapon_rpg`] = 0.0,
    [`weapon_grenadelauncher`] = 1.0,
    [`weapon_grenadelauncher_smoke`] = 1.0,
    [`weapon_minigun`] = 0.1,
    [`weapon_firework`] = 0.3,
    [`weapon_railgun`] = 2.4,
    [`weapon_hominglauncher`] = 0.0,
    [`weapon_compactlauncher`] = 0.5,
    [`weapon_rayminigun`] = 0.3,
}

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
            local _, weap = GetCurrentPedWeapon(ped)
            if recoils[weap] and recoils[weap] ~= 0 then
                local tv = 0
                if GetFollowPedCamViewMode() ~= 4 then
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        SetGameplayCamRelativePitch(p + 0.1, 0.2)
                        tv += 0.1
                    until tv >= recoils[weap]
                else
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        if recoils[weap] > 0.1 then
                            SetGameplayCamRelativePitch(p + 0.6, 1.2)
                            tv += 0.6
                        else
                            SetGameplayCamRelativePitch(p + 0.016, 0.333)
                            tv += 0.1
                        end
                    until tv >= recoils[weap]
                end
            end
        end
        Wait(0)
    end
end)
]]
-- Branco_Weapons\client\main.lua
-- here you will find the recoil and Gameplaycam shake edit to your liking 

if weapon == GetHashKey("WEAPON_STUNGUN") then
			if IsPedShooting(ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01) -- the number edit the shakes
			end
		end

-- 	DisplayAmmoThisFrame(false) these will remove the ammo show on the screen when a weapon is being hold by a player 

local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}
change if you have addon snipers for scope to show 
