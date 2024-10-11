--=====================================================================================
-- BLU | Better Level-Up! - slash_commands.lua
-- Contains slash command registration and handling functions
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local L = BLU_L or {}  -- Localization table

-- Prefixes for messaging
local BLU_PREFIX = "|cff05dffaBLU|r - "

--=====================================================================================
-- Slash Command Registration
--=====================================================================================

function BLU:RegisterSlashCommands()
    SLASH_BLU1 = "/blu"
    SlashCmdList["BLU"] = function(input)
        self:HandleSlashCommands(input)
    end
end

--=====================================================================================
-- Slash Command Handling
--=====================================================================================

function BLU:HandleSlashCommands(input)
    input = strtrim(strlower(input or ""))  -- Convert input to lowercase

    if input == "" or input == "panel" or input == "options" then
        self:OpenOptionsPanel()
    elseif input == "debug" then
        self:ToggleDebugMode()
    elseif input == "welcome" then
        self:ToggleWelcomeMessage()
    elseif input == "help" then
        self:DisplayBLUHelp()
    else
        print(BLU_PREFIX .. (L["UNKNOWN_SLASH_COMMAND"] or "Unknown command."))
    end
end

--=====================================================================================
-- Display Help Information
--=====================================================================================

function BLU:DisplayBLUHelp()
    local helpCommand = L["HELP_COMMAND"] or "/blu help - Displays help information."
    local helpDebug = L["HELP_DEBUG"] or "/blu debug - Toggles debug mode."
    local helpWelcome = L["HELP_WELCOME"] or "/blu welcome - Toggles welcome messages."
    local helpPanel = L["HELP_PANEL"] or "/blu panel - Opens the options panel."

    print(BLU_PREFIX .. helpCommand)
    print(BLU_PREFIX .. helpDebug)
    print(BLU_PREFIX .. helpWelcome)
    print(BLU_PREFIX .. helpPanel)
end

--=====================================================================================
-- Open Options Panel
--=====================================================================================

function BLU:OpenOptionsPanel()
    self:InitializeOptionsPanel()
    Settings.OpenToCategory(self.optionsFrame)
end
