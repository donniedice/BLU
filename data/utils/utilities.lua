--=====================================================================================
-- BLU | Better Level-Up! - utilities.lua
-- Contains utility functions
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local L = BLU_L or {}  -- Localization table

-- Prefixes for messaging
local BLU_PREFIX = "|cff05dffaBLU|r - "

--=====================================================================================
-- Utility Functions
--=====================================================================================

-- Print the welcome message
function BLU:PrintWelcomeMessage()
    if BLU.db.profile.showWelcomeMessage then
        print(BLU_PREFIX .. (L["WELCOME_MESSAGE"] or "Welcome to Better Level-Up!"))
    end
end

-- Toggle debug mode on/off
function BLU:ToggleDebugMode()
    BLU.db.profile.debugMode = not BLU.db.profile.debugMode
    local message = BLU.db.profile.debugMode and (L["DEBUG_MODE_ENABLED"] or "Debug mode enabled.") or (L["DEBUG_MODE_DISABLED"] or "Debug mode disabled.")
    print(BLU_PREFIX .. message)
end

-- Toggle welcome message on/off
function BLU:ToggleWelcomeMessage()
    BLU.db.profile.showWelcomeMessage = not BLU.db.profile.showWelcomeMessage
    local message = BLU.db.profile.showWelcomeMessage and (L["WELCOME_MSG_ENABLED"] or "Welcome message enabled.") or (L["WELCOME_MSG_DISABLED"] or "Welcome message disabled.")
    print(BLU_PREFIX .. message)
end

