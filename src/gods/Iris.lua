-- gods/Iris.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Iris")

gods.InitializeGod({
    godName = "Iris",
    godType = "GOD",
    Gender = "Female",

    WeaponUpgrades = {
        "IrisWeaponBoon"
    },

    Traits = {}
})

gods.CreateOlympianSJSONData({
    godName = "Iris",
    godType = "god",
    displayName = "Iris",
    subtitle = "Goddess of the Rainbow"
})

gods.CreateBoon({
    characterName = "Iris",
    internalBoonName = "IrisWeaponBoon",

    Slot = "Melee",

    displayName = "Prism Break",
    description = "Your Attack inflicts a random curse.",

    reuseBaseIcons = true,
    boonIconPath = "Boon_Hera_01",

    ExtraFields = {
        OnEnemyDamagedAction = {
            FunctionName = "TC8GodMod.TryApplyRandomIrisCurse",
            Args = {}
        }
    }
})

print("[TC8GodMod] Iris registered")
