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


        OnEnemyDamagedAction = {
            FunctionName = "TC8GodMod.TryApplyRandomIrisCurse",
            Args = {}
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

local function EnsureTraitAlias(name)
    if TraitData[name] ~= nil then
        return
    end

    for traitName, traitData in pairs(TraitData) do
        if type(traitName) == "string" and traitName:sub(-#name) == name then
            TraitData[name] = traitData
            print("[TC8GodMod] Aliased " .. name .. " to " .. traitName)
            return
        end
    end

    print("[TC8GodMod] WARNING: could not alias " .. name)
end

EnsureTraitAlias("IrisWeaponBoon")
EnsureTraitAlias("IrisSpecialBoon")
EnsureTraitAlias("IrisCastBoon")
EnsureTraitAlias("IrisSprintBoon")

print("[TC8GodMod] Iris registered")
