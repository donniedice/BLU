-- =====================================================================================
-- BLU | Better Level-Up! - BLULocale - localization.lua
-- =====================================================================================

local MAJOR = "BLULocale"
local BLULocale = BLULocale or { apps = {}, appnames = {} }

if not BLULocale then return end

local assert, tostring, error = assert, tostring, error
local getmetatable, setmetatable, rawset, rawget = getmetatable, setmetatable, rawset, rawget

local gameLocale = GetLocale()
if gameLocale == "enGB" then
    gameLocale = "enUS"
end

BLULocale.apps = BLULocale.apps or {}          -- array of ["AppName"]=localetableref
BLULocale.appnames = BLULocale.appnames or {}  -- array of [localetableref]="AppName"

local readmeta = {
    __index = function(self, key)
        rawset(self, key, key)
        geterrorhandler()(MAJOR .. ": " .. tostring(BLULocale.appnames[self]) .. ": Missing entry for '" .. tostring(key) .. "'")
        return key
    end
}

local readmetasilent = {
    __index = function(self, key)
        rawset(self, key, key)
        return key
    end
}

local registering

local assertfalse = function() assert(false) end

local writeproxy = setmetatable({}, {
    __newindex = function(self, key, value)
        rawset(registering, key, value == true and key or value)
    end,
    __index = assertfalse
})

local writedefaultproxy = setmetatable({}, {
    __newindex = function(self, key, value)
        if not rawget(registering, key) then
            rawset(registering, key, value == true and key or value)
        end
    end,
    __index = assertfalse
})

function BLULocale:NewLocale(application, locale, isDefault, silent)
    local activeGameLocale = GAME_LOCALE or gameLocale
    local app = BLULocale.apps[application]

    if silent and app and getmetatable(app) ~= readmetasilent then
        geterrorhandler()("Usage: NewLocale(application, locale[, isDefault[, silent]]): 'silent' must be specified for the first locale registered")
    end

    if not app then
        if silent == "raw" then
            app = {}
        else
            app = setmetatable({}, silent and readmetasilent or readmeta)
        end
        BLULocale.apps[application] = app
        BLULocale.appnames[app] = application
    end

    if locale ~= activeGameLocale and not isDefault then
        return
    end

    registering = app

    if isDefault then
        return writedefaultproxy
    end

    return writeproxy
end

function BLULocale:GetLocale(application, silent)
    if not silent and not BLULocale.apps[application] then
        error("Usage: GetLocale(application[, silent]): 'application' - No locales registered for '" .. tostring(application) .. "'", 2)
    end
    return BLULocale.apps[application]
end
