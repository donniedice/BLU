-- =====================================================================================
-- BLU | Better Level-Up! - tradepost.lua
-- =====================================================================================
local tradepost = {}

-- =====================================================================================
-- Handle Perks Activity Completed
-- =====================================================================================
function tradepost:HandlePerksActivityCompleted()
    BLU:HandleEvent(
        "PERKS_ACTIVITY_COMPLETED",
        "PostSoundSelect",
        "PostVolume",
        BLU.Modules.Sounds.defaultSounds[9],
        "PERKS_ACTIVITY_COMPLETED_TRIGGERED"
    )
end

-- =====================================================================================
-- Test Post Sound
-- =====================================================================================
function tradepost:TestPostSound()
    BLU:TestSound("PostSoundSelect", "PostVolume", BLU.Modules.Sounds.defaultSounds[9], "TEST_POST_SOUND")
end

-- =====================================================================================
-- Register the event for PERKS_ACTIVITY_COMPLETED
-- =====================================================================================
function tradepost:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register the PERKS_ACTIVITY_COMPLETED event
    self.frame:RegisterEvent("PERKS_ACTIVITY_COMPLETED")

    -- Set script for handling the event
    self.frame:SetScript("OnEvent", function(_, event)
        if event == "PERKS_ACTIVITY_COMPLETED" then
            self:HandlePerksActivityCompleted()
        end
    end)

    BLU:PrintDebugMessage(BLU_L["PERKS_MODULE_LOADED"])
end

-- =====================================================================================
-- Initialize the Tradepost Module
-- =====================================================================================
function tradepost:Initialize()
    self:OnLoad()
end

-- Register the module
BLU.Modules.Tradepost = tradepost

-- Initialize the module when BLU is loaded
BLU:PrintDebugMessage("Tradepost module initialized.")
