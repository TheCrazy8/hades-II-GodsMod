TC8GodMod = TC8GodMod or {}

TC8GodMod.IrisCursePool = {
    "WeakPrimary",
    "BlindPrimary",
    "BurnPrimary",
    "ChillPrimary",
}

function TC8GodMod.TryApplyRandomIrisCurse(victim, triggerArgs)
    print("[TC8GodMod] Iris curse hook fired")

    if victim == nil and triggerArgs ~= nil then
        victim = triggerArgs.TriggeredByTable or triggerArgs.Victim or triggerArgs.Target
    end

    if victim == nil or victim.ObjectId == nil then
        print("[TC8GodMod] Iris curse failed: no victim")
        return
    end

    local curse = TC8GodMod.IrisCursePool[RandomInt(1, #TC8GodMod.IrisCursePool)]

    print("[TC8GodMod] Applying Iris curse " .. tostring(curse) .. " to " .. tostring(victim.ObjectId))

    ApplyEffect({
        DestinationId = victim.ObjectId,
        Id = victim.ObjectId,
        EffectName = curse,
        DataProperties = {}
    })
end
