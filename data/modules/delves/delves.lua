-- =====================================================================================
-- BLU | Better Level-Up! - delves.lua
-- =====================================================================================
local delves = {}

-- =====================================================================================
-- Initialization for Delves Module
-- =====================================================================================
function delves:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to Delves
    self.frame:RegisterEvent("TRAIT_CONFIG_UPDATED")
    self.frame:RegisterEvent("UPDATE_FACTION")
    self.frame:RegisterEvent("CHAT_MSG_SYSTEM")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:OnDelveCompanionLevelUp(event, ...)
    end)

    BLU:PrintDebugMessage(BLU_L["DELVE_MODULE_LOADED"])
end

-- =====================================================================================
-- Test Sound Trigger Functions
-- =====================================================================================
function delves:TestDelveLevelUpSound()
    BLU:TestSound("DelveLevelUpSoundSelect", "DelveLevelUpVolume", BLU.Modules.Sounds.defaultSounds[3], BLU_L["TEST_DELVE_LEVEL_UP_SOUND"])
end

-- =====================================================================================
-- Delve Companion Level-Up Event Handler
-- =====================================================================================
function delves:OnDelveCompanionLevelUp(event, ...)
    -- Print debug message for the triggering event
    BLU:PrintDebugMessage(BLU_L["EVENT_TRIGGERED"]:format(event))

    -- Only proceed with the CHAT_MSG_SYSTEM event to finalize the check
    if event == "CHAT_MSG_SYSTEM" then
        local msg = ...
        BLU:PrintDebugMessage(BLU_L["INCOMING_CHAT_MESSAGE"]:format(msg))

        -- Check if the level-up message for Brann is found in the chat (localized)
        local levelUpMatch = string.match(msg, BLU_L["BRANN_LEVEL_UP_MATCH"])
        if levelUpMatch then
            local level = tonumber(levelUpMatch)
            BLU:PrintDebugMessage(BLU_L["BRANN_LEVEL_UP_DETECTED"]:format(level))
            BLU:TriggerDelveLevelUpSound(level)
        else
            BLU:PrintDebugMessage(BLU_L["NO_BRANN_LEVEL_FOUND"])
        end
    end
end

-- =====================================================================================
-- Trigger Delve Level-Up Sound
-- =====================================================================================
function delves:TriggerDelveLevelUpSound(level)
    BLU:HandleEvent("DELVE_LEVEL_UP", "DelveLevelUpSoundSelect", "DelveLevelUpVolume", BLU.Modules.Sounds.defaultSounds[3], BLU_L["DELVE_LEVEL_UP_SOUND_TRIGGERED"]:format(level))
end

-- Return the module
BLU.Modules.Delves = delves
