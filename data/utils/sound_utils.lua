--=====================================================================================
-- BLU | Better Level-Up! - sound_utils.lua
-- Contains sound selection and playback functions
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local BLU_L = BLU_L  -- Localization table

-- Prefixes for messaging
local BLU_PREFIX = "[BLU] "
local DEBUG_PREFIX = "[DEBUG] "

-- Reference to sounds tables
local sounds = sounds  -- Assuming 'sounds' is a global table loaded from sounds.lua
local defaultSounds = defaultSounds  -- Similarly for defaultSounds

--=====================================================================================
-- Sound Selection Functions
--=====================================================================================

function BLU:RandomSoundID()
    self:PrintDebugMessage("SELECTING_RANDOM_SOUND_ID")

    local validSoundIDs = {}

    -- Collect all sound IDs, including variants
    for soundID, soundList in pairs(sounds) do
        if type(soundList) == "table" then
            table.insert(validSoundIDs, {table = sounds, id = soundID})
        end
    end

    if #validSoundIDs == 0 then
        self:PrintDebugMessage("NO_VALID_SOUND_IDS")
        return nil
    end

    local randomIndex = math.random(1, #validSoundIDs)
    local selectedSoundID = validSoundIDs[randomIndex]

    self:PrintDebugMessage("RANDOM_SOUND_ID_SELECTED", "|cff8080ff" .. selectedSoundID.id .. "|r")

    return selectedSoundID
end

--=====================================================================================
-- Select Sound Based on Sound ID
--=====================================================================================

function BLU:SelectSound(soundID)
    self:PrintDebugMessage("SELECTING_SOUND", "|cff8080ff" .. tostring(soundID) .. "|r")

    -- Handle Random Sound selection
    if not soundID or soundID == "Random" then
        local randomSoundID = self:RandomSoundID()
        if randomSoundID then
            self:PrintDebugMessage("USING_RANDOM_SOUND_ID", "|cff8080ff" .. randomSoundID.id .. "|r")
            return randomSoundID
        end
    end

    -- Check for sound in the default or custom sound tables
    if sounds[soundID] then
        self:PrintDebugMessage("USING_SPECIFIED_SOUND_ID", "|cff8080ff" .. soundID .. "|r")
        return {table = sounds, id = soundID}
    elseif defaultSounds[soundID] then
        self:PrintDebugMessage("USING_DEFAULT_SOUND_ID", "|cff8080ff" .. soundID .. "|r")
        return {table = defaultSounds, id = soundID}
    end

    -- If not found, return nil
    self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND", tostring(soundID))
    return nil
end

--=====================================================================================
-- Test Sound Functions with Detailed Debug Output
--=====================================================================================

function BLU:TestSound(soundIDKey, volumeKey, debugMessage)
    self:PrintDebugMessage(debugMessage)

    local soundID = self.db.profile[soundIDKey]
    local sound = self:SelectSound(soundID)

    local volumeLevel = self.db.profile[volumeKey]
    self:PlaySelectedSound(sound, volumeLevel)
end

--=====================================================================================
-- Play the Selected Sound
--=====================================================================================

function BLU:PlaySelectedSound(sound, volumeLevel)
    if not sound or not sound.id then
        self:PrintDebugMessage("INVALID_SOUND_OBJECT")
        return
    end

    self:PrintDebugMessage("PLAYING_SOUND", sound.id, volumeLevel)

    if volumeLevel == 0 then
        self:PrintDebugMessage("VOLUME_LEVEL_ZERO")
        return
    end

    local soundTable = sound.table[sound.id]
    local soundFile

    if soundTable then
        if soundTable.low and soundTable.med and soundTable.high then
            -- Simple structure
            if volumeLevel == 1 then
                soundFile = soundTable.low
            elseif volumeLevel == 2 then
                soundFile = soundTable.med
            elseif volumeLevel == 3 then
                soundFile = soundTable.high
            else
                soundFile = soundTable.med
            end
        else
            -- Complex structure (multiple variants)
            local variants = {}
            for _, variantTable in pairs(soundTable) do
                if variantTable.low and variantTable.med and variantTable.high then
                    table.insert(variants, variantTable)
                end
            end
            if #variants > 0 then
                local randomVariant = variants[math.random(#variants)]
                if volumeLevel == 1 then
                    soundFile = randomVariant.low
                elseif volumeLevel == 2 then
                    soundFile = randomVariant.med
                elseif volumeLevel == 3 then
                    soundFile = randomVariant.high
                else
                    soundFile = randomVariant.med
                end
            else
                self:PrintDebugMessage("NO_VARIANTS_FOUND_FOR_SOUND", sound.id)
                return
            end
        end
    else
        self:PrintDebugMessage("SOUND_NOT_FOUND_IN_TABLE", sound.id)
        return
    end

    self:PrintDebugMessage("SOUND_FILE_TO_PLAY", "|cffce9178" .. tostring(soundFile) .. "|r")

    if soundFile then
        PlaySoundFile(soundFile, "MASTER")
    else
        self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND", "|cff8080ff" .. sound.id .. "|r")
    end
end
