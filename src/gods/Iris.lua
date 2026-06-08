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
    subtitle = "Goddess of the Rainbow",

    iconPathOverrides = {
        previewPath = true,
        iconSpinPath = true,
        boonSelectSymbolPath = true,
    },

    previewPath = "Items\\Loot\\Boon\\HeraIconSpin\\HeraPreview",
    iconSpinPath = "Items\\Loot\\Boon\\HeraIconSpin\\HeraIconSpin",
    boonSelectSymbolPath = "GUI\\Screens\\BoonIcons\\Hera",

    colorA = { Red = 0.85, Green = 0.35, Blue = 1.00 },
    colorB = { Red = 0.35, Green = 0.20, Blue = 0.75 },
    colorC = { Red = 0.95, Green = 0.75, Blue = 1.00 },
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
    "Prism Break",
    "Your Attack inflicts a random curse.",
    "Boon_Hera_01"
)

CreateIrisBoon(
    "IrisSpecialBoon",
    "Secondary",
    "Chroma Crash",
    "Your Special inflicts a random curse.",
    "Boon_Hera_02"
)

CreateIrisBoon(
    "IrisCastBoon",
    "Ranged",
    "Shimmering Magic",
    "Your Cast inflicts a random curse.",
    "Boon_Hera_03"
)

CreateIrisBoon(
    "IrisSprintBoon",
    "Rush",
    "Rainbow Rush",
    "Your Sprint inflicts a random curse.",
    "Boon_Hera_04"
)

print("[TC8GodMod] Iris registered")
