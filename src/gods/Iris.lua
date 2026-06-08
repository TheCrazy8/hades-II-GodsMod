-- gods/Iris.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Iris")

gods.InitializeGod({
    godName = "Iris",
    godType = "GOD",
    Gender = "Female",

    WeaponUpgrades = {
        "IrisWeaponBoon",
        "IrisSpecialBoon",
        "IrisCastBoon",
        "IrisSprintBoon",
    },

    Traits = {}
})

gods.CreateOlympianSJSONData({
    godName = "Iris",
    godType = "god",
    displayName = "Iris",
    subtitle = "Goddess of the Rainbow"
    iconSpinPath = "Items\\Loot\\Boon\\HeraIconSpin\\HeraIconSpin",
    previewPath = "Items\\Loot\\Boon\\HeraIconSpin\\HeraPreview",
    boonSelectSymbolPath = "GUI\\Screens\\BoonIcons\\Hera"
})

local function CreateIrisBoon(internalName, slot, displayName, description, icon)
    gods.CreateBoon({
        characterName = "Iris",
        internalBoonName = internalName,

        Slot = slot,

        displayName = displayName,
        description = description,

        reuseBaseIcons = true,
        boonIconPath = icon,

        ExtraFields = {
            OnEnemyDamagedAction = {
                FunctionName = "TC8GodMod.TryApplyRandomIrisCurse",
                Args = {}
            }
        }
    })
end

CreateIrisBoon(
    "IrisWeaponBoon",
    "Melee",
    "Iris' Strike",
    "Your Attack inflicts a random curse.",
    "Boon_Hera_01"
)

CreateIrisBoon(
    "IrisSpecialBoon",
    "Secondary",
    "Iris' Flourish",
    "Your Special inflicts a random curse.",
    "Boon_Hera_02"
)

CreateIrisBoon(
    "IrisCastBoon",
    "Ranged",
    "Iris' Ring",
    "Your Cast inflicts a random curse.",
    "Boon_Hera_03"
)

CreateIrisBoon(
    "IrisSprintBoon",
    "Rush",
    "Iris' Sprint",
    "Your Sprint inflicts a random curse.",
    "Boon_Hera_04"
)

print("[TC8GodMod] Iris registered")
