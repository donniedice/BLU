-- =====================================================================================
-- BLU | Better Level-Up! - battlepets.lua
-- =====================================================================================
local battlepets = {}

-- ============================
-- Constants
-- ============================
local MAX_PET_LEVEL = 25 -- Maximum battle pet level

-- ============================
-- Level-Up Handling Functions
-- ============================
function battlepets:HandlePetLevelUp(petID)
    petID = tostring(petID)
    local speciesID, _, level, _, _, _, _, petName = C_PetJournal.GetPetInfoByPetID(petID)
    if not level then
        BLU:PrintDebugMessage("INVALID_PET_LEVEL for petID: " .. petID)
        return
    end

    local displayName = petName or BLU_L["UNKNOWN_PET"]
    BLU:PrintDebugMessage("PET_LEVEL_UP_TRIGGERED for " .. displayName .. ", Level: " .. level)

    self:TriggerLevelUpSound(displayName, level)
    BLU.previousPetLevels[petID] = { level = level, speciesID = speciesID }
end

function battlepets:TriggerLevelUpSound(petName, currentLevel)
    BLU:HandleEvent(
        "PET_LEVEL_UP",
        "BattlePetLevelSoundSelect",
        "BattlePetLevelVolume",
        BLU.Modules.Sounds.defaultSounds[2],
        "PET_LEVEL_UP_TRIGGERED for " .. petName .. " at level " .. currentLevel
    )
end

-- ============================
-- Pet Data Management
-- ============================
function battlepets:UpdatePetData()
    local numPets = C_PetJournal.GetNumPets()
    if not numPets or numPets == 0 then
        BLU:PrintDebugMessage("NO_PETS_FOUND")
        return
    end

    local currentPetLevels = {}
    for i = 1, numPets do
        local petID, speciesID, isOwned, _, level = C_PetJournal.GetPetInfoByIndex(i)
        if petID and isOwned then
            if level and level >= 1 and level <= MAX_PET_LEVEL then
                currentPetLevels[petID] = { level = level, speciesID = speciesID }
            end
        end
    end

    if BLU.isInitialized then
        for petID, petData in pairs(currentPetLevels) do
            local previousData = BLU.previousPetLevels[petID]
            if previousData and petData.level > previousData.level then
                self:HandlePetLevelUp(petID)
            end
        end
    else
        BLU.isInitialized = true
        BLU:PrintDebugMessage("INIT_LOAD_COMPLETE for BattlePets module")
    end

    BLU.previousPetLevels = currentPetLevels
end

function battlepets:CheckPetJournalForLevelUps()
    self:UpdatePetData()
end

-- ============================
-- Event Handler
-- ============================
function battlepets:HandleBattlePetLevelUp(event, ...)
    if event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unitTarget, _, spellID = ...
        if unitTarget == "player" and IsPetBattleItem(spellID) then
            self:CheckPetJournalForLevelUps()
        end
    elseif event == "PLAYER_LOGIN" then
        self:UpdatePetData()
    elseif event == "PET_BATTLE_LEVEL_CHANGED" or event == "UNIT_PET_EXPERIENCE" then
        self:UpdatePetData()
    elseif event == "PET_JOURNAL_LIST_UPDATE" then
        self:CheckPetJournalForLevelUps()
    end
end

-- ============================
-- Module Initialization
-- ============================
function battlepets:OnLoad()
    -- Create a frame for event handling
    self.frame = CreateFrame("Frame")

    -- Register events
    self.frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    self.frame:RegisterEvent("PLAYER_LOGIN")
    self.frame:RegisterEvent("PET_BATTLE_LEVEL_CHANGED")
    self.frame:RegisterEvent("UNIT_PET_EXPERIENCE")
    self.frame:RegisterEvent("PET_JOURNAL_LIST_UPDATE")

    -- Set script for handling events
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:HandleBattlePetLevelUp(event, ...)
    end)

    -- Initialize pet data
    self:UpdatePetData()
    BLU:PrintDebugMessage("BattlePets module loaded and initialized.")
end

-- Register the module
BLU.Modules.BattlePets = battlepets
