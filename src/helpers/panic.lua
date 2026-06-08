-- helpers/Panic.lua

TC8GodMod = TC8GodMod or {}

TC8GodMod.PanickedEnemies = {}

function TC8GodMod.TryApplyPanic(triggerArgs)
    if triggerArgs == nil then
        return
    end

    local victim = triggerArgs.TriggeredByTable

    if victim == nil or victim.ObjectId == nil then
        return
    end

    -- Don't reapply if already panicked
    if TC8GodMod.PanickedEnemies[victim.ObjectId] ~= nil then
        return
    end

    TC8GodMod.PanickedEnemies[victim.ObjectId] = {
        TargetEnemies = true,
        ExpireTime = _worldTime + 4
    }

    -- Allow this enemy to receive damage from other enemies
    AddIncomingDamageModifier(victim, {
        Name = "TC8GodMod_PanicFriendlyFire",
        NonPlayerMultiplier = 1,
        Multiplicative = true
    })

    print(
        "[TC8GodMod] Panic applied to " ..
        tostring(victim.ObjectId)
    )
end