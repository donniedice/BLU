-- =====================================================================================
-- BLU | Better Level-Up! - achievements.lua
-- =====================================================================================

local achievements = {}
achievements.frame = CreateFrame("Frame") -- Create the frame outside OnLoad

-- ============================
-- Initialize the module
-- ============================
function achievements:OnLoad()
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
    local soundSelect = BLU.db.profile.AchievementSoundSelect or BLU.Modules.Sounds.defaultSounds[1]
    local volume = BLU.db.profile.AchievementVolume or 1.0
    BLU:HandleEvent("ACHIEVEMENT_EARNED", "AchievementSoundSelect", "AchievementVolume", soundSelect, "ACHIEVEMENT_EARNED_TRIGGERED", volume)
end

-- ============================
-- Test Achievement Sound Trigger
-- ============================
function achievements:TestAchievementSound()
    -- Test the achievement sound trigger
    local soundSelect = BLU.db.profile.AchievementSoundSelect or BLU.Modules.Sounds.defaultSounds[1]
    local volume = BLU.db.profile.AchievementVolume or 1.0
    BLU:TestSound("AchievementSoundSelect", "AchievementVolume", soundSelect, "TEST_ACHIEVEMENT_SOUND", volume)
end

-- Return the module
BLU.Modules.Achievements = achievements
