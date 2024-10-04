-- =====================================================================================
-- BLU | Better Level-Up! - reputation.lua
-- =====================================================================================
local reputation = {}

-- =====================================================================================
-- Module Initialization
-- =====================================================================================
function reputation:OnLoad()
    -- Ensure the chat frame is hooked only once
    if not BLU.chatFrameHooked then
        self:ReputationChatFrameHook()
        BLU.chatFrameHooked = true
        BLU:PrintDebugMessage(BLU_L["REPUTATION_MODULE_LOADED"])
    end
end

-- =====================================================================================
-- Test Reputation Sound Trigger
-- =====================================================================================
function BLU:TestRepSound()
    self:TestSound("RepSoundSelect", "RepVolume", BLU.Modules.Sounds.defaultSounds[6], BLU_L["TEST_REP_SOUND"])
end

-- =====================================================================================
-- Reputation Chat Frame Hook for Rank Matching
-- =====================================================================================
function reputation:ReputationChatFrameHook()
    -- Create a frame for event handling
    local frame = CreateFrame("Frame")

    -- Register CHAT_MSG_SYSTEM event
    frame:RegisterEvent("CHAT_MSG_SYSTEM")

    -- Set script for handling the event
    frame:SetScript("OnEvent", function(_, _, msg)
        BLU:PrintDebugMessage(BLU_L["INCOMING_CHAT_MESSAGE"]:format(msg))

        local rankPatterns = {
            { "Exalted", BLU_L["RANK_EXALTED"] },
            { "Revered", BLU_L["RANK_REVERED"] },
            { "Honored", BLU_L["RANK_HONORED"] },
            { "Friendly", BLU_L["RANK_FRIENDLY"] },
            { "Neutral", BLU_L["RANK_NEUTRAL"] },
            { "Unfriendly", BLU_L["RANK_UNFRIENDLY"] },
            { "Hostile", BLU_L["RANK_HOSTILE"] },
            { "Hated", BLU_L["RANK_HATED"] },
            { "Acquaintance", BLU_L["RANK_ACQUAINTANCE"] },
            { "Crony", BLU_L["RANK_CRONY"] },
            { "Accomplice", BLU_L["RANK_ACCOMPLICE"] },
            { "Collaborator", BLU_L["RANK_COLLABORATOR"] },
            { "Accessory", BLU_L["RANK_ACCESSORY"] },
            { "Abettor", BLU_L["RANK_ABETTOR"] },
            { "Conspirator", BLU_L["RANK_CONSPIRATOR"] },
            { "Mastermind", BLU_L["RANK_MASTERMIND"] },
        }

        local rankFound = false
        for _, pattern in ipairs(rankPatterns) do
            if string.match(msg, "You are now " .. pattern[1] .. " with") or string.match(msg, "Your standing with") then
                BLU:PrintDebugMessage(BLU_L["RANK_FOUND"]:format(pattern[2]))
                self:ReputationRankIncrease(pattern[2], msg)
                rankFound = true
                break
            end
        end

        if not rankFound then
            BLU:PrintDebugMessage(BLU_L["NO_RANK_FOUND"])
        end

        return false -- Ensure the message is not blocked from being displayed
    end)
end

-- =====================================================================================
-- Handle Reputation Rank Increase
-- =====================================================================================
function reputation:ReputationRankIncrease(rank, msg)
    -- Extract the faction name from the message
    local factionName = string.match(msg, "with (.+)")
    
    -- Use HandleEvent for consistency
    BLU:HandleEvent("REPUTATION_RANK_INCREASE", "RepSoundSelect", "RepVolume", BLU.Modules.Sounds.defaultSounds[6], BLU_L["REPUTATION_RANK_INCREASE_TRIGGERED"]:format(rank, factionName))
end

-- Return the module
BLU.Modules.Reputation = reputation
