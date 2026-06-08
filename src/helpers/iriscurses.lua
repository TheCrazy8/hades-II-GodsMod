TC8GodMod = TC8GodMod or {}

TC8GodMod.IrisCursePool = {
    "WeakPrimary",
    "BlindPrimary",
    "BurnPrimary",
    "ChillPrimary",
}

function TC8GodMod.TryApplyRandomIrisCurse(triggerArgs)
    print("[TC8GodMod] Iris curse hook fired")

    if triggerArgs == nil then
        print("[TC8GodMod] triggerArgs is nil")
        return
    end

    for key, value in pairs(triggerArgs) do
        print("[TC8GodMod] triggerArgs key: " .. tostring(key) .. " = " .. tostring(value))
    end
end
