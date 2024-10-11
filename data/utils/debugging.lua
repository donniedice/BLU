--=====================================================================================
-- BLU | Better Level-Up! - debugging.lua
-- Contains debugging functions
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local BLU_L = BLU_L  -- Localization table

-- Prefixes for messaging
local BLU_PREFIX = "[BLU] "
local DEBUG_PREFIX = "[DEBUG] "

--=====================================================================================
-- Debug Messaging Functions
--=====================================================================================

function BLU:DebugMessage(message)
    if self.debugMode then
        print(BLU_PREFIX .. DEBUG_PREFIX .. message)
    end
end

function BLU:PrintDebugMessage(key, ...)
    if self.debugMode and BLU_L[key] then
        self:DebugMessage(BLU_L[key]:format(...))
    end
end
