-- =====================================================================================
-- BLU | Better Level-Up! - quests.lua
-- =====================================================================================
local quests = {}

-- =====================================================================================
-- Initialization for Quests Module
-- =====================================================================================
function quests:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to Quests
    self.frame:RegisterEvent("QUEST_ACCEPTED")
    self.frame:RegisterEvent("QUEST_TURNED_IN")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event)
        if event == "QUEST_ACCEPTED" then
            self:HandleQuestAccepted()
        elseif event == "QUEST_TURNED_IN" then
            self:HandleQuestTurnedIn()
        end
    end)

    BLU:PrintDebugMessage(BLU_L["QUESTS_MODULE_LOADED"])
end

-- =====================================================================================
-- Handle Quest Accepted Event
-- =====================================================================================
function quests:HandleQuestAccepted()
    BLU:HandleEvent("QUEST_ACCEPTED", "QuestAcceptSoundSelect", "QuestAcceptVolume", BLU.Modules.Sounds.defaultSounds[7], BLU_L["QUEST_ACCEPTED_TRIGGERED"])
end

-- =====================================================================================
-- Handle Quest Turned In Event
-- =====================================================================================
function quests:HandleQuestTurnedIn()
    BLU:HandleEvent("QUEST_TURNED_IN", "QuestSoundSelect", "QuestVolume", BLU.Modules.Sounds.defaultSounds[8], BLU_L["QUEST_TURNED_IN_TRIGGERED"])
end

-- =====================================================================================
-- Test Quest Accepted Sound Trigger
-- =====================================================================================
function BLU:TestQuestAcceptSound()
    self:TestSound("QuestAcceptSoundSelect", "QuestAcceptVolume", BLU.Modules.Sounds.defaultSounds[7], BLU_L["TEST_QUEST_ACCEPT_SOUND"])
end

-- =====================================================================================
-- Test Quest Turned In Sound Trigger
-- =====================================================================================
function BLU:TestQuestSound()
    self:TestSound("QuestSoundSelect", "QuestVolume", BLU.Modules.Sounds.defaultSounds[8], BLU_L["TEST_QUEST_SOUND"])
end

-- Return the module
BLU.Modules.Quests = quests
