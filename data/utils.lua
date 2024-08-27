--=====================================================================================
-- Utility Function to Handle Events
--=====================================================================================
function HandleEvent(self, eventName, soundID, volumeKey, defaultSound)
    if self.functionsHalted then 
        self:PrintDebugMessage("FUNCTIONS_HALTED")
        return
    end
    self:PrintDebugMessage(eventName)
    local sound = self:SelectSound(self.db.profile[soundID])
    if not sound then
        self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND")
        return
    end
    self:PlaySelectedSound(sound, self.db.profile[volumeKey], defaultSound)
end

--=====================================================================================
-- Sound Selection Functions
--=====================================================================================
function BLU:RandomSoundID()
    self:PrintDebugMessage("SELECTING_RANDOM_SOUND_ID")

    local validSoundIDs = {}

    -- Collect all custom sound IDs
    for soundID, soundList in pairs(sounds) do
        for _, _ in pairs(soundList) do
            table.insert(validSoundIDs, {table = sounds, id = soundID})
        end
    end

    -- Collect all default sound IDs
    for soundID, soundList in pairs(defaultSounds) do
        for _, _ in pairs(soundList) do
            table.insert(validSoundIDs, {table = defaultSounds, id = soundID})
        end
    end

    -- Return nil if no valid sound IDs are found
    if #validSoundIDs == 0 then
        self:PrintDebugMessage("NO_VALID_SOUND_IDS")
        return nil
    end

    -- Select a random sound ID from the list
    local randomIndex = math.random(1, #validSoundIDs)
    local selectedSoundID = validSoundIDs[randomIndex]

    self:PrintDebugMessage("RANDOM_SOUND_ID_SELECTED", selectedSoundID.id)

    return selectedSoundID
end

--=====================================================================================
-- Function to select a sound based on the provided sound ID
--=====================================================================================
function BLU:SelectSound(soundID)
    self:PrintDebugMessage("SELECTING_SOUND", tostring(soundID))

    -- If the sound ID is set to random (2), return a random sound ID
    if soundID == 2 then
        local randomSoundID = self:RandomSoundID()
        if randomSoundID then
            self:PrintDebugMessage("USING_RANDOM_SOUND_ID", randomSoundID.id)
            return randomSoundID
        end
    end

    -- If the sound ID is a valid custom or default sound, return it
    if sounds[soundID] or defaultSounds[soundID] then
        self:PrintDebugMessage("USING_SPECIFIED_SOUND_ID", soundID)
        return { table = sounds[soundID] and sounds or defaultSounds, id = soundID }
    end

    -- If sound ID is invalid, log and return nil
    self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND", soundID)
    return nil
end

function BLU:PlaySelectedSound(sound, volumeLevel, defaultTable)
    self:PrintDebugMessage("PLAYING_SOUND", sound.id, volumeLevel)

    if volumeLevel == 0 then
        self:PrintDebugMessage("VOLUME_LEVEL_ZERO")
        return
    end

    local soundFile
    if sound and sound.table and sound.id then
        soundFile = sound.table[sound.id][volumeLevel]
    elseif defaultTable then
        soundFile = defaultTable[volumeLevel]
    end

    self:PrintDebugMessage("SOUND_FILE_TO_PLAY", tostring(soundFile))

    if soundFile then
        PlaySoundFile(soundFile, "MASTER")
    else
        self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND", sound.id)
    end
end

--=====================================================================================
-- Utility Functions
--=====================================================================================
function BLU:DebugMessage(message)
    if self.debugMode then
        print(DEBUG_PREFIX .. message)
    end
end

function BLU:PrintDebugMessage(key, ...)
    if self.debugMode and L[key] then
        self:DebugMessage(L[key]:format(...))
    end
end

function BLU:DisplayWelcomeMessage()
    print(L["WELCOME_MESSAGE"])
    self:PrintDebugMessage("WELCOME_MESSAGE_DISPLAYED")
end

--=====================================================================================
-- Slash Command Handler
--=====================================================================================
function BLU:SlashCommand(input)
    self:PrintDebugMessage("PROCESSING_SLASH_COMMAND", input)

    if input == "debug" then
        self.debugMode = not self.debugMode
        self.db.profile.debugMode = self.debugMode
        local status = self.debugMode and L["DEBUG_MODE_ENABLED"] or L["DEBUG_MODE_DISABLED"]
        print(L["DEBUG_MODE_STATUS"]:format(status))

    elseif input == "welcome" then
        self.showWelcomeMessage = not self.showWelcomeMessage
        self.db.profile.showWelcomeMessage = self.showWelcomeMessage
        local status = self.showWelcomeMessage and L["WELCOME_MSG_ENABLED"] or L["WELCOME_MSG_DISABLED"]
        print(L["WELCOME_MESSAGE_STATUS"]:format(status))

    elseif input == "enable" then
        self:Enable()
        self:PrintDebugMessage("ENABLING_ADDON")
        print(L["ADDON_ENABLED"])

    elseif input == "disable" then
        self:Disable()
        print(L["ADDON_DISABLED"])

    elseif input == "help" then
        print(L["SLASH_COMMAND_HELP"])

    else
        self:PrintDebugMessage("UNKNOWN_SLASH_COMMAND", input)
        Settings.OpenToCategory(self.optionsFrame.name)
        if self.debugMode then
            self:PrintDebugMessage("OPTIONS_PANEL_OPENED")
        end
    end
end