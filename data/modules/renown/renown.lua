-- =====================================================================================
-- BLU | Better Level-Up! - renown.lua
-- =====================================================================================
local renown = {}

-- =====================================================================================
-- Initialization for Renown Module
-- =====================================================================================
function renown:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to Renown
    self.frame:RegisterEvent("MAJOR_FACTION_RENOWN_LEVEL_CHANGED")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event, ...)
        if event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED" then
            self:HandleRenownLevelChanged(...)
        end
    end)

    BLU:PrintDebugMessage(BLU.L["RENOWN_MODULE_LOADED"] or "Renown module loaded and initialized.")
end

-- =====================================================================================
-- Handle Renown Level Changed Event
-- =====================================================================================
function renown:HandleRenownLevelChanged(...)
    BLU:HandleEvent("MAJOR_FACTION_RENOWN_LEVEL_CHANGED", "RenownSoundSelect", "RenownVolume", BLU.Modules.Sounds.defaultSounds[6], BLU.L["MAJOR_FACTION_RENOWN_LEVEL_CHANGED_TRIGGERED"] or "Renown Level Changed Triggered.")
end

-- =====================================================================================
-- Test Renown Sound Trigger
-- =====================================================================================
function BLU:TestRenownSound()
    self:TestSound("RenownSoundSelect", "RenownVolume", BLU.Modules.Sounds.defaultSounds[6], BLU.L["TEST_RENOWN_SOUND"] or "Test Renown Sound Triggered.")
end

-- Return the module
BLU.Modules.Renown = renown
