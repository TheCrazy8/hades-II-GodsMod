-- helpers/IrisCurses.lua

TC8GodMod = TC8GodMod or {}

TC8GodMod.IrisCursePool = {
    "Freeze",
    "Scorch",
    "Daze",
    "Weak"
}

function TC8GodMod.TryApplyRandomIrisCurse(triggerArgs)
    if triggerArgs == nil then
        return
    end

    local victim = triggerArgs.TriggeredByTable

    if victim == nil or victim.ObjectId == nil then
        return
    end

    local curse = TC8GodMod.IrisCursePool[RandomInt(1, #TC8GodMod.IrisCursePool)]

    print("[TC8GodMod] Iris curse rolled: " .. tostring(curse) .. " on " .. tostring(victim.ObjectId))

    -- TODO: actually apply curse here once we confirm the hook works.
end