-- helpers/IrisCurses.lua

TC8GodMod = TC8GodMod or {}

TC8GodMod.IrisCursePool = {
    "PLACEHOLDER_FREEZE",
    "PLACEHOLDER_SCORCH",
    "PLACEHOLDER_DAZE",
    "PLACEHOLDER_WEAK"
}

function TC8GodMod.TryApplyRandomIrisCurse(triggerArgs)
    if triggerArgs == nil then
        return
    end

    local victim = triggerArgs.TriggeredByTable

    if victim == nil or victim.ObjectId == nil then
        return
    end

    local curse =
        TC8GodMod.IrisCursePool[
            RandomInt(1, #TC8GodMod.IrisCursePool)
        ]

    print(
        "[TC8GodMod] Applying Iris curse " ..
        tostring(curse) ..
        " to " ..
        tostring(victim.ObjectId)
    )

    -- TODO:
    -- Replace placeholder names with actual Hades II effect names.

    ApplyEffect({
        DestinationId = victim.ObjectId,
        Id = victim.ObjectId,
        EffectName = curse,
        DataProperties = {}
    })
end