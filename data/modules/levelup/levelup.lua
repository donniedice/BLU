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
    self.frame:SetScript("OnEvent", function(_, event)
        self:HandlePlayerLevelUp()
    end)

    BLU:PrintDebugMessage(BLU_L["LEVELUP_MODULE_LOADED"])
end

-- =====================================================================================
-- Handle Player Level-Up Event
-- =====================================================================================
function levelup:HandlePlayerLevelUp()
    BLU:HandleEvent("PLAYER_LEVEL_UP", "LevelSoundSelect", "LevelVolume", BLU.Modules.Sounds.defaultSounds[4], BLU_L["PLAYER_LEVEL_UP_TRIGGERED"])
end

-- =====================================================================================
-- Test Player Level-Up Sound Trigger
-- =====================================================================================
function BLU:TestLevelSound()
    self:TestSound("LevelSoundSelect", "LevelVolume", BLU.Modules.Sounds.defaultSounds[4], BLU_L["TEST_LEVEL_SOUND"])
end

-- Return the module
BLU.Modules.LevelUp = levelup
