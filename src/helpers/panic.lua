TC8GodMod = TC8GodMod or {}
TC8GodMod.PanickedEnemies = {}

function TC8GodMod.TryApplyPanic(triggerArgs)
    if triggerArgs == nil then
        return
    end

    local victim = triggerArgs.TriggeredByTable

    if victim == nil then
        return
    end

    TC8GodMod.PanickedEnemies[victim.ObjectId] = true

    print("[TC8GodMod] Panic applied")
end
