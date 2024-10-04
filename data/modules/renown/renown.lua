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
    self.frame:SetScript("OnEvent", function(_, event)
        if event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED" then
            self:HandleRenownLevelChanged()
        end
    end)

    BLU:PrintDebugMessage(BLU_L["RENOWN_MODULE_LOADED"])
end

-- =====================================================================================
-- Handle Renown Level Changed Event
-- =====================================================================================
function renown:HandleRenownLevelChanged()
    BLU:HandleEvent("MAJOR_FACTION_RENOWN_LEVEL_CHANGED", "RenownSoundSelect", "RenownVolume", BLU.Modules.Sounds.defaultSounds[6], BLU_L["MAJOR_FACTION_RENOWN_LEVEL_CHANGED_TRIGGERED"])
end

-- =====================================================================================
-- Test Renown Sound Trigger
-- =====================================================================================
function BLU:TestRenownSound()
    self:TestSound("RenownSoundSelect", "RenownVolume", BLU.Modules.Sounds.defaultSounds[6], BLU_L["TEST_RENOWN_SOUND"])
end

-- Return the module
BLU.Modules.Renown = renown
