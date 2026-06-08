-- gods/Pan.lua

local gods = TC8GodMod.GodsAPI

print("[TC8GodMod] Registering Pan")

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
    iconSpinPath = "Items\\Loot\\Boon\\DemeterIconSpin\\DemeterIconSpin",
    previewPath = "Items\\Loot\\Boon\\DemeterIconSpin\\DemeterPreview",
    boonSelectSymbolPath = "GUI\\Screens\\BoonIcons\\Demeter"
})

local function CreatePanBoon(internalName, slot, displayName, description, icon)
    gods.CreateBoon({
        characterName = "Pan",
        internalBoonName = internalName,

        Slot = slot,

        displayName = displayName,
        description = description,

        reuseBaseIcons = true,
        boonIconPath = icon,

        ExtraFields = {
            OnEnemyDamagedAction = {
                FunctionName = "TC8GodMod.TryApplyPanic",
                Args = {}
            }
        }
    })
end

CreatePanBoon(
    "PanWeaponBoon",
    "Melee",
    "Wild Strike",
    "Your Attack inflicts Panic.",
    "Boon_Demeter_01"
)

CreatePanBoon(
    "PanSpecialBoon",
    "Secondary",
    "Flourish",
    "Your Special inflicts Panic.",
    "Boon_Demeter_02"
)

CreatePanBoon(
    "PanCastBoon",
    "Ranged",
    "Ancient Melody",
    "Your Cast inflicts Panic.",
    "Boon_Demeter_03"
)

CreatePanBoon(
    "PanSprintBoon",
    "Rush",
    "Wild Dance",
    "Your Sprint inflicts Panic.",
    "Boon_Demeter_04"
)

print("[TC8GodMod] Pan registered")
