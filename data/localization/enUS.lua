-- =====================================================================================
-- BLU | Better Level-Up! - Localization for enUS.lua
-- =====================================================================================

-- Load the localization table for the addon
BLU_L = BLULocale:GetLocale("BLU") -- Ensure BLU_L is initialized correctly

if not BLU_L then return end

-- Option Colors
BLU_L["optionColor1"] = "|cff05dffa"
BLU_L["optionColor2"] = "|cffffffff"

-- Option Labels and Descriptions
BLU_L["OPTIONS_PANEL_TITLE"] = "|Tinterface/addons/blu/images/icon:16:16|t - |cff05dffaBLU|r |cffffffff|| |cff05dffaB|r|cffffffffetter |cff05dffaL|r|cffffffffevel-|cff05dffaU|r|cffffffffp!|r"

-- Profiles
BLU_L["PROFILES_TITLE"] = "Profiles"

-- =====================================================================================
-- Localization for initialization.lua
-- =====================================================================================

-- BLU:GetGameVersion()
BLU_L["ERROR_UNKNOWN_GAME_VERSION"] = "|cffff0000Unknown game version detected.|r"

-- BLU:OnInitialize()
BLU_L["WELCOME_MESSAGE"] = "Welcome! Use |cff05dffa/blu|r to open the options panel or |cff05dffa/blu help|r for more commands."
BLU_L["VERSION"] = "|cffffff00Version:|r"

-- BLU:InitializeOptions()
BLU_L["ERROR_OPTIONS_NOT_INITIALIZED"] = "|cffff0000Options not initialized properly.|r"
BLU_L["SKIPPING_GROUP_NOT_COMPATIBLE"] = "|cffff0000Incompatible or Unnamed Options Group.|r"
BLU_L["OPTIONS_LIST_MENU_TITLE"] = "|Tinterface/addons/blu/images/icon:16:16|t - |cff05dffaB|r|cffffffffetter |cff05dffaL|r|cffffffffevel-|cff05dffaU|r|cffffffffp!"
BLU_L["OPTIONS_ALREADY_REGISTERED"] = "Options already registered."

-- =====================================================================================
-- Localization for utils.lua
-- =====================================================================================

-- BLU:ProcessEventQueue()
BLU_L["ERROR_SOUND_NOT_FOUND"] = "|cffff0000Sound not found for sound ID: |cff8080ff%s.|r"
BLU_L["INVALID_VOLUME_LEVEL"] = "|cffff0000Invalid volume level: |cff8080ff%d.|r"
BLU_L["DEBUG_MESSAGE_MISSING"] = "|cffffcc00Debug message missing for event.|r"
BLU_L["FUNCTIONS_HALTED"] = "|cffff0000Functions halted.|r"

-- BLU:HaltOperations()
BLU_L["COUNTDOWN_TICK"] = "|cffffff00Countdown: |cff8080ff%d|cffffff00 seconds remaining.|r"

-- BLU:HandleSlashCommands(input)
BLU_L["OPTIONS_PANEL_OPENED"] = "Options panel |cff00ff00opened|r."
BLU_L["UNKNOWN_SLASH_COMMAND"] = "Unknown slash command: |cff8080ff%s|r."

-- BLU:DisplayBLUHelp()
BLU_L["HELP_COMMAND"] = "|cffffff00Available commands:"
BLU_L["HELP_DEBUG"] = " |cff05dffa/blu debug|r - Toggle debug mode."
BLU_L["HELP_WELCOME"] = " |cff05dffa/blu welcome|r - Toggles the welcome message on/off."
BLU_L["HELP_PANEL"] = " |cff05dffa/blu|r - Open the options panel."

-- BLU:ToggleDebugMode()
BLU_L["DEBUG_MODE_ENABLED"] = "|cff00ff00Debug Mode Enabled|r"
BLU_L["DEBUG_MODE_DISABLED"] = "|cffff0000Debug Mode Disabled|r"
BLU_L["DEBUG_MODE_TOGGLED"] = "Debug mode toggled: |cff8080ff%s|r."

-- BLU:ToggleWelcomeMessage()
BLU_L["WELCOME_MSG_ENABLED"] = "Welcome message |cff00ff00enabled|r."
BLU_L["WELCOME_MSG_DISABLED"] = "Welcome message |cffff0000disabled|r."
BLU_L["SHOW_WELCOME_MESSAGE_TOGGLED"] = "Welcome message toggled: |cff8080ff%s|r."
BLU_L["CURRENT_DB_SETTING"] = "Current DB setting: |cffffff00%s|r."

-- BLU:RandomSoundID()
BLU_L["SELECTING_RANDOM_SOUND"] = "Selecting Random SoundID."
BLU_L["NO_VALID_SOUND_IDS"] = "|cffff0000No valid sound IDs found.|r"
BLU_L["RANDOM_SOUND_ID_SELECTED"] = "Random sound ID selected: |cff8080ff%s|r."

-- BLU:SelectSound()
BLU_L["SELECTING_SOUND"] = "Selecting sound with ID: |cff8080ff%s|r."
BLU_L["USING_RANDOM_SOUND_ID"] = "Using random sound ID: |cff8080ff%s|r."
BLU_L["USING_SPECIFIED_SOUND_ID"] = "Using specified sound ID: |cff8080ff%s|r."

-- PlaySelectedSound()
BLU_L["PLAYING_SOUND"] = "Playing sound with ID: |cff8080ff%s|r and volume level: |cff8080ff%d|r."
BLU_L["VOLUME_LEVEL_ZERO"] = "|cffff0000Volume level is |cff8080ff0|cffff0000, sound not played.|r"
BLU_L["SOUND_FILE_TO_PLAY"] = "Sound file to play: |cffce9178%s|r."

BLU_L["ACHIEVEMENT_EARNED"] = "Achievement Earned!"
BLU_L["ACHIEVEMENT_VOLUME_LABEL"] = "Achievement Volume"
BLU_L["ACHIEVEMENT_VOLUME_DESC"] = "Adjust the volume for the Achievement Earned! sound."

-- Hardcoded color versions of debug and test messages
BLU_L["TEST_ACHIEVEMENT_SOUND"] = "|cffffff00TestAchievementSound|r |cffc586c0triggered.|r"
BLU_L["ACHIEVEMENT_EARNED_TRIGGERED"] = "|cffffff00ACHIEVEMENT_EARNED|r |cffc586c0triggered.|r"

BLU_L["TEST_BATTLE_PET_LEVEL_SOUND"] = "|cffc586c0Test Battle Pet Level Sound|r |cffffff00triggered!|r"
BLU_L["BATTLE_PET_LEVEL_UP"] = "Battle Pet Level-Up!"
BLU_L["BATTLE_PET_VOLUME_LABEL"] = "Battle Pet Volume"
BLU_L["BATTLE_PET_VOLUME_DESC"] = "Adjust the volume for the Battle Pet Level-Up sound."
BLU_L["INVALID_PET_LEVEL"] = "|cffff0000Invalid petID or currentLevel.|r |cff00ff00PetID:|r %s, |cff00ff00Level:|r %s"
BLU_L["UNKNOWN_PET"] = "|cffff0000Unknown Pet|r"
BLU_L["PET_LEVEL_UP_TRIGGERED"] = "|cffffff00Pet Level-Up triggered for|r %s |cffffff00at level|r %d."
BLU_L["NO_PETS_FOUND"] = "|cffff0000No pets found, skipping pet data update.|r"
BLU_L["INIT_LOAD_COMPLETE"] = "|cffffff00Tracked Pet Levels Initialized on Login.|r"

-- Test Sound Trigger Function Message
BLU_L["TEST_DELVE_LEVEL_UP_SOUND"] = "|cffffff00TestDelveLevelUpSound|r |cffc586c0triggered.|r"

-- Option Labels and Descriptions for Volume Controls
BLU_L["DELVE_COMPANION_LEVEL_UP"] = "|cffffd700Delve Companion Level-Up!|r"
BLU_L["DELVE_VOLUME_LABEL"] = "|cff00ff00Delve Volume|r"
BLU_L["DELVE_VOLUME_DESC"] = "|cffffff00Adjust the volume for the Delve Level-Up! sound.|r"

-- Delve Companion Level-Up Event Handling Messages
BLU_L["DELVE_LEVEL_UP"] = "|cffffff00Brann Bronzebeard has reached Level %s|r"
BLU_L["NO_BRANN_LEVEL_FOUND"] = "|cffff0000No Delve Level found in chat message.|r"

-- Sound Trigger Message
BLU_L["DELVE_LEVEL_UP_SOUND_TRIGGERED"] = "|cffffff00Delve Level-Up sound triggered for Level %d.|r"

-- Module Load Message
BLU_L["HONOR_MODULE_LOADED"] = "|cff00ff00Honor module loaded and initialized.|r"

-- Test Honor Sound Trigger Message
BLU_L["TEST_HONOR_SOUND"] = "|cffffff00TestHonorSound|r |cffc586c0triggered.|r"

-- Honor Level Update Event Message
BLU_L["HONOR_LEVEL_UPDATE_TRIGGERED"] = "|cffffff00Honor Level Update triggered.|r"

-- Honor Rank-Up Option Labels
BLU_L["HONOR_RANK_UP"] = "Honor Rank-Up!"
BLU_L["HONOR_VOLUME_LABEL"] = "Honor Volume"
BLU_L["HONOR_VOLUME_DESC"] = "Adjust the volume for the Honor Rank-Up sound."

-- Module Load Message
BLU_L["LEVELUP_MODULE_LOADED"] = "|cff00ff00Level-Up module loaded and initialized.|r"

-- Test Player Level-Up Sound Trigger Message
BLU_L["TEST_LEVEL_SOUND"] = "|cffffff00TestLevelSound|r |cffc586c0triggered.|r"

-- Player Level-Up Event Message
BLU_L["PLAYER_LEVEL_UP_TRIGGERED"] = "|cffffff00Player Level-Up triggered.|r"

-- Level-Up Option Labels
BLU_L["LEVEL_UP"] = "Level-Up!"
BLU_L["LEVEL_VOLUME_LABEL"] = "Level-Up Volume"
BLU_L["LEVEL_VOLUME_DESC"] = "Adjust the volume for the Level-Up sound."

-- Module Load Message
BLU_L["QUESTS_MODULE_LOADED"] = "|cff00ff00Quests module loaded and initialized.|r"

-- Test Quest Accepted Sound Trigger Message
BLU_L["TEST_QUEST_ACCEPT_SOUND"] = "|cff00ff00TestQuestAcceptSound|r |cffffd700triggered.|r"

-- Test Quest Turned In Sound Trigger Message
BLU_L["TEST_QUEST_SOUND"] = "|cff00ff00TestQuestSound|r |cffffd700triggered.|r"

-- Quest Accepted Event Message
BLU_L["QUEST_ACCEPTED_TRIGGERED"] = "|cff00ff00Quest Accepted triggered.|r"

-- Quest Turned In Event Message
BLU_L["QUEST_TURNED_IN_TRIGGERED"] = "|cff00ff00Quest Turned In triggered.|r"

-- Quest Option Labels
BLU_L["QUEST_ACCEPTED"] = "|cff00ff00Quest Accepted!|r"
BLU_L["QUEST_ACCEPT_VOLUME_LABEL"] = "|cffffd700Quest Accept Volume|r"
BLU_L["QUEST_ACCEPT_VOLUME_DESC"] = "|cffffffffAdjust the volume for the Quest Accepted! sound.|r"
BLU_L["QUEST_COMPLETE"] = "|cff00ff00Quest Complete!|r"
BLU_L["QUEST_COMPLETE_VOLUME_LABEL"] = "|cffffd700Quest Complete Volume|r"
BLU_L["QUEST_COMPLETE_VOLUME_DESC"] = "|cffffffffAdjust the volume for the Quest Complete! sound.|r"

-- Module Load Message
BLU_L["RENOWN_MODULE_LOADED"] = "|cff00ff00Renown module loaded and initialized.|r"

-- Test Renown Sound Trigger Message
BLU_L["TEST_RENOWN_SOUND"] = "|cffffff00TestRenownSound|r |cffc586c0triggered.|r"

-- Renown Level Changed Event Message
BLU_L["MAJOR_FACTION_RENOWN_LEVEL_CHANGED_TRIGGERED"] = "|cffffff00Renown Level-Up triggered.|r"

-- Renown Option Labels
BLU_L["RENOWN_RANK_UP"] = "Renown Rank-Up!"
BLU_L["RENOWN_VOLUME_LABEL"] = "Renown Volume"
BLU_L["RENOWN_VOLUME_DESC"] = "Adjust the volume for the Renown Rank-Up sound."
