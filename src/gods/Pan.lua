-- gods/Pan.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Pan")

-- Register the god
gods.InitializeGod({
    godName = "Pan",
    godType = "GOD",
    Gender = "Male",

    WeaponUpgrades = {
        "PanWeaponBoon"
    },

    Traits = {}
})

-- Create the god's UI data
gods.CreateOlympianSJSONData({
    godName = "Pan",
    displayName = "Pan",
    subtitle = "God of the Wilds"
})

-- Create a boon
gods.CreateBoon({
    characterName = "Pan",
    internalBoonName = "PanWeaponBoon",

    Slot = "Melee",

    displayName = "Wild Strike",
    description = "Your Attack inflicts Panic.",

    reuseBaseIcons = true,
    boonIconPath = "Boon_Demeter_01"

    ExtraFields = {
        OnEnemyDamagedAction = {
            FunctionName = "TC8GodMod.TryApplyPanic",
            Args = {}
        }
    }
})

print("[TC8GodMod] Pan registered")