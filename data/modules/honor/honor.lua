-- =====================================================================================
-- BLU | Better Level-Up! - honor.lua
-- =====================================================================================
local honor = {}

-- =====================================================================================
-- Initialization for Honor Module
-- =====================================================================================
function honor:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to Honor
    self.frame:RegisterEvent("HONOR_LEVEL_UPDATE")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:HandleHonorLevelUpdate()
    end)

    BLU:PrintDebugMessage(BLU_L["HONOR_MODULE_LOADED"])
end

-- =====================================================================================
-- Test Honor Sound Trigger
-- =====================================================================================
function BLU:TestHonorSound()
    self:TestSound("HonorSoundSelect", "HonorVolume", BLU.Modules.Sounds.defaultSounds[5], BLU_L["TEST_HONOR_SOUND"])
end

-- =====================================================================================
-- Handle Honor Level Update Event
-- =====================================================================================
function honor:HandleHonorLevelUpdate()
    BLU:HandleEvent("HONOR_LEVEL_UPDATE", "HonorSoundSelect", "HonorVolume", BLU.Modules.Sounds.defaultSounds[5], BLU_L["HONOR_LEVEL_UPDATE_TRIGGERED"])
end

-- Return the module
BLU.Modules.Honor = honor
