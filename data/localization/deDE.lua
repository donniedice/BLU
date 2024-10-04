local L = LibStub("BLULocale"):NewLocale("BLU", "deDE")

if not L then return end

-- Option Colors
L["optionColor1"] = "|cff05dffa"
L["optionColor2"] = "|cffffffff"

-- Option Labels and Descriptions
L["OPTIONS_PANEL_TITLE"] = "|Tinterface/addons/blu/images/icon:16:16|t - |cff05dffaBLU|r |cffffffff|| |cff05dffaB|r|cffffffffesser |cff05dffaL|r|cffffffffevel-|cff05dffaU|r|cffffffffp!|r"

-- Profiles
L["PROFILES_TITLE"] = "Profile"

-- =====================================================================================
-- Localization for initialization.lua
-- =====================================================================================

-- BLU:GetGameVersion()
L["ERROR_UNKNOWN_GAME_VERSION"] = "|cffff0000Unbekannte Spielversion erkannt.|r"

-- BLU:OnInitialize()
L["WELCOME_MESSAGE"] = "Willkommen! Verwende |cff05dffa/blu|r, um das Optionsfenster zu öffnen, oder |cff05dffa/blu help|r für weitere Befehle."
L["VERSION"] = "|cffffff00Version:|r"

-- BLU:InitializeOptions()
L["ERROR_OPTIONS_NOT_INITIALIZED"] = "|cffff0000Optionen nicht richtig initialisiert.|r"
L["SKIPPING_GROUP_NOT_COMPATIBLE"] = "|cffff0000Inkompatible oder unbenannte Optionsgruppe.|r"
L["OPTIONS_LIST_MENU_TITLE"] = "|Tinterface/addons/blu/images/icon:16:16|t - |cff05dffaB|r|cffffffffesser |cff05dffaL|r|cffffffffevel-|cff05dffaU|r|cffffffffp!"
L["OPTIONS_ALREADY_REGISTERED"] = "Optionen bereits registriert."

-- =====================================================================================
-- Localization for utils.lua
-- =====================================================================================

-- BLU:ProcessEventQueue()
L["ERROR_SOUND_NOT_FOUND"] = "|cffff0000Sound für Sound-ID nicht gefunden: |cff8080ff%s.|r"
L["INVALID_VOLUME_LEVEL"] = "|cffff0000Ungültiger Lautstärkepegel: |cff8080ff%d.|r"
L["DEBUG_MESSAGE_MISSING"] = "|cffffcc00Debug-Nachricht für das Ereignis fehlt.|r"
L["FUNCTIONS_HALTED"] = "|cffff0000Funktionen angehalten.|r"

-- BLU:HaltOperations()
L["COUNTDOWN_TICK"] = "|cffffff00Countdown: |cff8080ff%d|cffffff00 Sekunden verbleibend.|r"

-- BLU:HandleSlashCommands(input)
L["OPTIONS_PANEL_OPENED"] = "Optionsfenster |cff00ff00geöffnet|r."
L["UNKNOWN_SLASH_COMMAND"] = "Unbekannter Slash-Befehl: |cff8080ff%s|r."

-- BLU:DisplayBLUHelp()
L["HELP_COMMAND"] = "|cffffff00Verfügbare Befehle:"
L["HELP_DEBUG"] = " |cff05dffa/blu debug|r - Debug-Modus umschalten."
L["HELP_WELCOME"] = " |cff05dffa/blu welcome|r - Begrüßungsnachricht ein-/ausschalten."
L["HELP_PANEL"] = " |cff05dffa/blu|r - Öffne das Optionsfenster."

-- BLU:ToggleDebugMode()
L["DEBUG_MODE_ENABLED"] = "|cff00ff00Debug-Modus aktiviert|r"
L["DEBUG_MODE_DISABLED"] = "|cffff0000Debug-Modus deaktiviert|r"
L["DEBUG_MODE_TOGGLED"] = "Debug-Modus umgeschaltet: |cff8080ff%s|r."

-- BLU:ToggleWelcomeMessage()
L["WELCOME_MSG_ENABLED"] = "Begrüßungsnachricht |cff00ff00aktiviert|r."
L["WELCOME_MSG_DISABLED"] = "Begrüßungsnachricht |cffff0000deaktiviert|r."
L["SHOW_WELCOME_MESSAGE_TOGGLED"] = "Begrüßungsnachricht umgeschaltet: |cff8080ff%s|r."
L["CURRENT_DB_SETTING"] = "Aktuelle Datenbankeinstellung: |cffffff00%s|r."

-- BLU:RandomSoundID()
L["SELECTING_RANDOM_SOUND"] = "Zufällige Sound-ID auswählen."
L["NO_VALID_SOUND_IDS"] = "|cffff0000Keine gültigen Sound-IDs gefunden.|r"
L["RANDOM_SOUND_ID_SELECTED"] = "Zufällige Sound-ID ausgewählt: |cff8080ff%s|r."

-- BLU:SelectSound()
L["SELECTING_SOUND"] = "Sound mit ID auswählen: |cff8080ff%s|r."
L["USING_RANDOM_SOUND_ID"] = "Verwende zufällige Sound-ID: |cff8080ff%s|r."
L["USING_SPECIFIED_SOUND_ID"] = "Verwende angegebene Sound-ID: |cff8080ff%s|r."

-- PlaySelectedSound()
L["PLAYING_SOUND"] = "Spiele Sound mit ID: |cff8080ff%s|r und Lautstärkepegel: |cff8080ff%d|r."
L["VOLUME_LEVEL_ZERO"] = "|cffff0000Lautstärkepegel ist |cff8080ff0|cffff0000, Sound wird nicht abgespielt.|r"
L["SOUND_FILE_TO_PLAY"] = "Sounddatei zum Abspielen: |cffce9178%s|r."
