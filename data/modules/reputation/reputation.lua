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
        BLU:PrintDebugMessage(BLU.L["REPUTATION_MODULE_LOADED"] or "Reputation module loaded and initialized.")
    end
end

-- =====================================================================================
-- Test Reputation Sound Trigger
-- =====================================================================================
function BLU:TestRepSound()
    self:TestSound("RepSoundSelect", "RepVolume", BLU.Modules.Sounds.defaultSounds[6], BLU.L["TEST_REP_SOUND"] or "Test Reputation Sound Triggered.")
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
        BLU:PrintDebugMessage(BLU.L["INCOMING_CHAT_MESSAGE"]:format(msg) or ("Incoming Chat Message: " .. msg))

        local rankPatterns = {
            { "Exalted", BLU.L["RANK_EXALTED"] or "Exalted" },
            { "Revered", BLU.L["RANK_REVERED"] or "Revered" },
            { "Honored", BLU.L["RANK_HONORED"] or "Honored" },
            { "Friendly", BLU.L["RANK_FRIENDLY"] or "Friendly" },
            { "Neutral", BLU.L["RANK_NEUTRAL"] or "Neutral" },
            { "Unfriendly", BLU.L["RANK_UNFRIENDLY"] or "Unfriendly" },
            { "Hostile", BLU.L["RANK_HOSTILE"] or "Hostile" },
            { "Hated", BLU.L["RANK_HATED"] or "Hated" },
            { "Acquaintance", BLU.L["RANK_ACQUAINTANCE"] or "Acquaintance" },
            { "Crony", BLU.L["RANK_CRONY"] or "Crony" },
            { "Accomplice", BLU.L["RANK_ACCOMPLICE"] or "Accomplice" },
            { "Collaborator", BLU.L["RANK_COLLABORATOR"] or "Collaborator" },
            { "Accessory", BLU.L["RANK_ACCESSORY"] or "Accessory" },
            { "Abettor", BLU.L["RANK_ABETTOR"] or "Abettor" },
            { "Conspirator", BLU.L["RANK_CONSPIRATOR"] or "Conspirator" },
            { "Mastermind", BLU.L["RANK_MASTERMIND"] or "Mastermind" },
        }

        local rankFound = false
        for _, pattern in ipairs(rankPatterns) do
            if string.match(msg, "You are now " .. pattern[1] .. " with") or string.match(msg, "Your standing with") then
                BLU:PrintDebugMessage(BLU.L["RANK_FOUND"]:format(pattern[2]) or "Rank found: " .. pattern[2])
                self:ReputationRankIncrease(pattern[2], msg)
                rankFound = true
                break
            end
        end

        if not rankFound then
            BLU:PrintDebugMessage(BLU.L["NO_RANK_FOUND"] or "No rank found in the message.")
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
    BLU:HandleEvent("REPUTATION_RANK_INCREASE", "RepSoundSelect", "RepVolume", BLU.Modules.Sounds.defaultSounds[6], BLU.L["REPUTATION_RANK_INCREASE_TRIGGERED"]:format(rank, factionName) or ("Reputation rank increased to " .. rank .. " with " .. factionName))
end

-- Return the module
BLU.Modules.Reputation = reputation
