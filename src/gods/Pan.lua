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
    subtitle = "God of the Wilds"
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
    "Pan's Strike",
    "Your Attack inflicts Panic.",
    "Boon_Demeter_01"
)

CreatePanBoon(
    "PanSpecialBoon",
    "Secondary",
    "Pan's Flourish",
    "Your Special inflicts Panic.",
    "Boon_Demeter_02"
)

CreatePanBoon(
    "PanCastBoon",
    "Ranged",
    "Pan's Melody",
    "Your Cast inflicts Panic.",
    "Boon_Demeter_03"
)

CreatePanBoon(
    "PanSprintBoon",
    "Rush",
    "Pan's Dance",
    "Your Sprint inflicts Panic.",
    "Boon_Demeter_04"
)

print("[TC8GodMod] Pan registered")
