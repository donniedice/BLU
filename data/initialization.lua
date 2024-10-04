-- initialization.lua
BLU = BLU or {}
BLU.VersionNumber = "v6.0.0"
BLU.debugMode = false
BLU.showWelcomeMessage = true
BLU.Modules = BLU.Modules or {}

-- Load localization
local L = require("localization.localization") -- Adjust based on actual path
local BLU_PREFIX = "|Tinterface/addons/blu/images/icon:16:16|t - |cff05dffaBLU|r "

-- Initialize saved variables
function BLU:InitSavedVariables()
    if not BLUDB then
        BLUDB = BLU.defaults -- Load default profile
    end
    BLU.db = BLUDB
end

-- Load options and modules
function BLU:LoadOptionsAndModules()
    self:InitializeOptions()
    self:LoadModules()
end

-- Event handler for ADDON_LOADED
local function OnEvent(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "BLU" then
        BLU:InitSavedVariables()
        BLU:LoadOptionsAndModules()
    end
end

-- Register events
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnEvent)
