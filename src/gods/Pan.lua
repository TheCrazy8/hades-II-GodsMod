-- gods/Pan.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Pan")

local function AssetPath(path)
    if rom ~= nil and rom.path ~= nil and rom.path.combine ~= nil then
        return rom.path.combine(_PLUGIN.guid, path)
    end

    return path
end

gods.InitializeGod({
    godName = "Pan",
    godType = "GOD",
    Gender = "Male",

    WeaponUpgrades = {
        "PanWeaponBoon",
        "PanSpecialBoon",
        "PanCastBoon",
        "PanSprintBoon",
    },

    Traits = {}
})

gods.CreateOlympianSJSONData({
    godName = "Pan",
    godType = "god",
    displayName = "Pan",
    subtitle = "God of the Wilds",

    iconPathOverrides = {
        previewPath = true,
        iconSpinPath = true,
        boonSelectSymbolPath = true,
    },

    previewPath = AssetPath("pan\\preview"),
    iconSpinPath = AssetPath("pan\\iconSpin"),
    boonSelectSymbolPath = AssetPath("pan\\iconSpin"),

    colorA = { Red = 0.25, Green = 0.75, Blue = 0.25 },
    colorB = { Red = 0.15, Green = 0.45, Blue = 0.12 },
    colorC = { Red = 0.35, Green = 0.95, Blue = 0.45 },
})

local function EnsureTraitAlias(name)
    if TraitData[name] ~= nil then
        return TraitData[name]
    end

    for traitName, traitData in pairs(TraitData) do
        if type(traitName) == "string" and traitName:sub(-#name) == name then
            TraitData[name] = traitData
            print("[TC8GodMod] Aliased " .. name .. " to " .. traitName)
            return traitData
        end
    end

    print("[TC8GodMod] WARNING: could not alias " .. name)
    return nil
end

local function PatchPanHook(internalName)
    local trait = EnsureTraitAlias(internalName)

    if trait == nil then
        print("[TC8GodMod] WARNING: could not patch Pan hook for " .. internalName)
        return
    end

    trait.OnEnemyDamagedAction = {
        FunctionName = "TC8GodMod.TryApplyPanic",
        Args = {}
    }

    print("[TC8GodMod] Patched Pan panic hook onto " .. internalName)
end

local function CreatePanBoon(internalName, slot, displayName, description, iconPath)
    gods.CreateBoon({
        characterName = "Pan",
        internalBoonName = internalName,

        Slot = slot,

        displayName = displayName,
        description = description,

        reuseBaseIcons = false,
        boonIconPath = AssetPath(iconPath),
    })

    PatchPanHook(internalName)
end

CreatePanBoon(
    "PanWeaponBoon",
    "Melee",
    "Wild Strike",
    "Your Attack inflicts Panic.",
    "pan\\boon_attack"
)

CreatePanBoon(
    "PanSpecialBoon",
    "Secondary",
    "Flourish",
    "Your Special inflicts Panic.",
    "pan\\boon_special"
)

CreatePanBoon(
    "PanCastBoon",
    "Ranged",
    "Ancient Melody",
    "Your Cast inflicts Panic.",
    "pan\\boon_cast"
)

CreatePanBoon(
    "PanSprintBoon",
    "Rush",
    "Wild Dance",
    "Your Sprint inflicts Panic.",
    "pan\\boon_sprint"
)

print("[TC8GodMod] Pan registered")
