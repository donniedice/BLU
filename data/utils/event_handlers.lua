--=====================================================================================
-- BLU | Better Level-Up! - event_handlers.lua
-- Contains event handling functions
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local BLU_L = BLU_L  -- Localization table

-- Prefixes for messaging
local BLU_PREFIX = "[BLU] "
local DEBUG_PREFIX = "[DEBUG] "

-- Global table to hold the event queue
BLU_EventQueue = BLU_EventQueue or {}

--=====================================================================================
-- Event Handling Functions
--=====================================================================================

function BLU:HandleEvent(eventName, soundSelectKey, volumeKey, defaultSound, debugMessage)
    if self.functionsHalted then 
        self:PrintDebugMessage("FUNCTIONS_HALTED")
        return 
    end
    
    table.insert(BLU_EventQueue, {
        eventName = eventName,
        soundSelectKey = soundSelectKey,
        volumeKey = volumeKey,
        defaultSound = defaultSound,
        debugMessage = debugMessage
    })

    if not self.isProcessingQueue then
        self.isProcessingQueue = true
        self:ProcessEventQueue()
    end
end

--=====================================================================================
-- Process the Event Queue
--=====================================================================================

function BLU:ProcessEventQueue()
    if #BLU_EventQueue == 0 then
        self.isProcessingQueue = false
        return
    end

    local event = table.remove(BLU_EventQueue, 1)

    -- Ensure the debug message is valid before playing the sound
    if event.debugMessage then
        self:PrintDebugMessage(event.debugMessage)
    else
        self:PrintDebugMessage("DEBUG_MESSAGE_MISSING")
    end

    -- Process the event (select sound, check volume, play sound)
    local soundID = self.db.profile[event.soundSelectKey]
    local sound = self:SelectSound(soundID)
    if not sound then
        self:PrintDebugMessage("ERROR_SOUND_NOT_FOUND", tostring(event.soundSelectKey))
        -- Continue processing the queue after a short delay
        C_Timer.After(1, function() self:ProcessEventQueue() end)
        return
    end

    local volumeLevel = self.db.profile[event.volumeKey]
    if volumeLevel < 0 or volumeLevel > 3 then
        self:PrintDebugMessage("INVALID_VOLUME_LEVEL", tostring(volumeLevel))
        -- Continue processing the queue after a short delay
        C_Timer.After(1, function() self:ProcessEventQueue() end)
        return
    end

    -- Play the selected sound after debug message is printed
    self:PlaySelectedSound(sound, volumeLevel)

    -- Continue processing the queue after a 1-second delay
    C_Timer.After(1, function() self:ProcessEventQueue() end)
end

--=====================================================================================
-- Handle Player Entering World
--=====================================================================================

function BLU:HandlePlayerEnteringWorld()
    self:HaltOperations()
end

--=====================================================================================
-- Halt Operations
--=====================================================================================

function BLU:HaltOperations()
    -- Ensure functions are halted
    if not self.functionsHalted then
        self.functionsHalted = true
    end

    -- Cancel the existing timer if it's running
    if self.haltTimer then
        self.haltTimer:Cancel()
        self.haltTimer = nil
    end

    -- Initialize countdown variables
    local countdownTime = 5

    -- Start the countdown timer
    self.haltTimer = C_Timer.NewTicker(1, function()
        countdownTime = countdownTime - 1

        -- Debug message for each countdown tick
        self:PrintDebugMessage("COUNTDOWN_TICK", countdownTime)

        if countdownTime <= 0 then
            -- Call the resume function when countdown finishes
            self:ResumeOperations()
        end
    end, countdownTime)
end

--=====================================================================================
-- Resume Operations
--=====================================================================================

function BLU:ResumeOperations()
    -- Lift the function halt
    if self.functionsHalted then
        self.functionsHalted = false
    end

    -- Mark the countdown as not running
    self.countdownRunning = false

    -- Stop the timer after it finishes
    if self.haltTimer then
        self.haltTimer:Cancel()
        self.haltTimer = nil
    end
end
