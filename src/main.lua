---@diagnostic disable: undefined-global
---@meta _

local mods = rom.mods

if mods["LuaENVY-ENVY"] ~= nil then
    mods["LuaENVY-ENVY"].auto()
end

rom = rom
_PLUGIN = _PLUGIN
game = rom.game

local modutil = mods["SGG_Modding-ModUtil"]
local reload = mods["SGG_Modding-ReLoad"]

gods = mods["zannc-GodsAPI"].auto()

IrisPanGods = IrisPanGods or {}

local function Log(message)
    print("[IrisPanGods] " .. tostring(message))
end

local function SafeImport(path)
    Log("Importing " .. path)

    local ok, err = pcall(function()
        import(path)
    end)

    if not ok then
        Log("ERROR importing " .. path .. ": " .. tostring(err))
    end

    return ok
end

local function on_ready()
    Log("Loading mod")

    if modutil ~= nil and modutil.mod ~= nil and modutil.mod.Mod ~= nil then
        mod = modutil.mod.Mod.Register(_PLUGIN.guid)
    end

    IrisPanGods.GodsAPI = gods

    import_as_fallback(rom.game)

    -- Helpers first
    SafeImport("helpers/Text.lua")
    SafeImport("helpers/Panic.lua")

    -- Gods after helpers
    SafeImport("gods/Pan.lua")
    SafeImport("gods/Iris.lua")

    Log("Finished loading mod")
end

local function on_reload()
end

if reload ~= nil and reload.auto_single ~= nil and modutil ~= nil and modutil.once_loaded ~= nil then
    local loader = reload.auto_single()

    modutil.once_loaded.game(function()
        loader.load(on_ready, on_reload)
    end)
else
    Log("WARNING: ReLoad/ModUtil unavailable; loading directly")
    on_ready()
end