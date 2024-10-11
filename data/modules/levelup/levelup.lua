-- =====================================================================================
-- BLU | Better Level-Up! - levelup.lua
-- =====================================================================================
local levelup = {}

-- =====================================================================================
-- Initialization for LevelUp Module
-- =====================================================================================
function levelup:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to Player Level-Up
    self.frame:RegisterEvent("PLAYER_LEVEL_UP")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:HandlePlayerLevelUp(...)
    end)

    BLU:PrintDebugMessage(BLU.L["LEVELUP_MODULE_LOADED"] or "Level-Up module loaded and initialized.")
end

-- =====================================================================================
-- Handle Player Level-Up Event
-- =====================================================================================
function levelup:HandlePlayerLevelUp()
    BLU:HandleEvent("PLAYER_LEVEL_UP", "LevelSoundSelect", "LevelVolume", BLU.Modules.Sounds.defaultSounds[4], BLU.L["PLAYER_LEVEL_UP_TRIGGERED"] or "Player Level-Up Triggered.")
end

-- =====================================================================================
-- Test Player Level-Up Sound Trigger
-- =====================================================================================
function levelup:TestLevelSound()
    BLU:TestSound("LevelSoundSelect", "LevelVolume", BLU.Modules.Sounds.defaultSounds[4], BLU.L["TEST_LEVEL_SOUND"] or "Test Player Level-Up Sound Triggered.")
end

-- Register the module
BLU.Modules.LevelUp = levelup
