-- =====================================================================================
-- BLU | Better Level-Up! - achievements.lua
-- =====================================================================================

local achievements = {}

-- ============================
-- Initialize the module
-- ============================
function achievements:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events specific to achievements
    self.frame:RegisterEvent("ACHIEVEMENT_EARNED")
    self.frame:SetScript("OnEvent", function(_, event, ...)
        if event == "ACHIEVEMENT_EARNED" then
            self:HandleAchievementEarned(...)
        end
    end)

    -- Print debug message for module load
    BLU:PrintDebugMessage("Achievements module loaded and initialized.")
end

-- ============================
-- Handle Achievement Earned Event
-- ============================
function achievements:HandleAchievementEarned(...)
    -- Trigger the achievement earned sound
    BLU:HandleEvent("ACHIEVEMENT_EARNED", "AchievementSoundSelect", "AchievementVolume", BLU.Modules.Sounds.defaultSounds[1], "ACHIEVEMENT_EARNED_TRIGGERED")
end

-- ============================
-- Test Achievement Sound Trigger
-- ============================
function achievements:TestAchievementSound()
    -- Test the achievement sound trigger
    BLU:TestSound("AchievementSoundSelect", "AchievementVolume", BLU.Modules.Sounds.defaultSounds[1], "TEST_ACHIEVEMENT_SOUND")
end

-- Return the module
BLU.Modules.Achievements = achievements
