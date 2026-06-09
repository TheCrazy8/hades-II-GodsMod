-- gods/Iris.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Iris")

local function AssetPath(path)
    -- deppth output says to use rom.path.combine(_PLUGIN.guid, "iris\\...")
    if rom ~= nil and rom.path ~= nil and rom.path.combine ~= nil then
        return rom.path.combine(_PLUGIN.guid, path)
    end

    return path
end

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

    previewPath = AssetPath("iris\\preview"),
    iconSpinPath = AssetPath("iris\\iconSpin"),
    boonSelectSymbolPath = AssetPath("iris\\iconSpin"),

    colorA = { Red = 1.00, Green = 0.35, Blue = 0.90 },
    colorB = { Red = 0.25, Green = 0.35, Blue = 1.00 },
    colorC = { Red = 1.00, Green = 0.95, Blue = 0.50 },
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

local function PatchIrisHook(internalName)
    local trait = EnsureTraitAlias(internalName)

    if trait == nil then
        print("[TC8GodMod] WARNING: could not patch Iris hook for " .. internalName)
        return
    end

    trait.OnEnemyDamagedAction = {
        FunctionName = "TC8GodMod.TryApplyRandomIrisCurse",
        Args = {}
    }

    print("[TC8GodMod] Patched Iris curse hook onto " .. internalName)
end

local function CreateIrisBoon(internalName, slot, displayName, description, iconPath)
    gods.CreateBoon({
        characterName = "Iris",
        internalBoonName = internalName,

        Slot = slot,

        displayName = displayName,
        description = description,

        reuseBaseIcons = false,
        boonIconPath = AssetPath(iconPath),
    })

    PatchIrisHook(internalName)
end

CreateIrisBoon(
    "IrisWeaponBoon",
    "Melee",
    "Prism Break",
    "Your Attack inflicts a random curse.",
    "iris\\boon_attack"
)

CreateIrisBoon(
    "IrisSpecialBoon",
    "Secondary",
    "Chroma Crash",
    "Your Special inflicts a random curse.",
    "iris\\boon_special"
)

CreateIrisBoon(
    "IrisCastBoon",
    "Ranged",
    "Shimmering Magic",
    "Your Cast inflicts a random curse.",
    "iris\\boon_cast"
)

CreateIrisBoon(
    "IrisSprintBoon",
    "Rush",
    "Rainbow Rush",
    "Your Sprint inflicts a random curse.",
    "iris\\boon_sprint"
)

print("[TC8GodMod] Iris registered")
