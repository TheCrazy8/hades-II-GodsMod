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
        print("[TC8GodMod] Iris curse failed: triggerArgs nil")
        return
    end

    local victim = triggerArgs.TriggeredByTable or triggerArgs.Victim or triggerArgs.Target

    if victim == nil or victim.ObjectId == nil then
        print("[TC8GodMod] Iris curse failed: no victim")
        return
    end

    local curse = TC8GodMod.IrisCursePool[RandomInt(1, #TC8GodMod.IrisCursePool)]

    print("[TC8GodMod] Applying Iris curse " .. tostring(curse) .. " to " .. tostring(victim.ObjectId))

    local ok, err = pcall(function()
        ApplyEffect({
            DestinationId = victim.ObjectId,
            Id = victim.ObjectId,
            EffectName = curse,
            DataProperties = {}
        })
    end)

    if not ok then
        print("[TC8GodMod] Iris curse ApplyEffect error: " .. tostring(err))
    end
end
