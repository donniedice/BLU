BLU = LibStub("AceAddon-3.0"):NewAddon("BLU", "AceEvent-3.0", "AceConsole-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

function BLU:OnInitialize()
	-- uses the "Default" profile instead of character-specific profiles
	-- https://www.wowace.com/projects/ace3/pages/api/ace-db-3-0
	self.db = LibStub("AceDB-3.0"):New("BLUDB", self.defaults, true)

	-- registers an options table and adds it to the Blizzard options window
	-- https://www.wowace.com/projects/ace3/pages/api/ace-config-3-0
	AC:RegisterOptionsTable("BLU_Options", self.options)
	self.optionsFrame = ACD:AddToBlizOptions("BLU_Options", "Better Level Up!")

	-- adds a child options table, in this case our profiles panel
	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AC:RegisterOptionsTable("BLU_Profiles", profiles)
	ACD:AddToBlizOptions("BLU_Profiles", "Profiles", "Better Level Up!")

	-- https://www.wowace.com/projects/ace3/pages/api/ace-console-3-0
	self:RegisterChatCommand("lu", "SlashCommand")
	self:RegisterChatCommand("blu", "SlashCommand")
end





function BLU:OnEnable()
	self:RegisterEvent("PLAYER_STARTED_MOVING")
	self:RegisterEvent("PLAYER_LEVEL_UP")
end

function BLU:PLAYER_LEVEL_UP(self, event, ...)
	if BLU.db.profile.LevelSoundSelect == 1 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\FFLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 2 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\KH3LU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 3 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MSLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 4 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\FNLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 5 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\LoLLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 6 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MCLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 7 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MW2LU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 8 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MWLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 9 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\OSRSLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 10 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\PkmnLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 11 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\PoELU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 12 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SHHLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 13 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SMB3LU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 14 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SRLU.ogg", "Master")
elseif BLU.db.profile.LevelSoundSelect == 15 then
	PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\WC3LU.ogg", "Master")
end
end
--]]

function BLU:PLAYER_STARTED_MOVING(event)
	if BLU.db.profile.MuteLevelDefault == true then
	MuteSoundFile(569593)
elseif BLU.db.profile.MuteLevelDefault == false then
	UnmuteSoundFile(569593)
end
end





function BLU:PLAYER_STARTED_MOVING(event)
	if BLU.db.profile.MuteRepDefault == true then
	MuteSoundFile(568016)
elseif BLU.db.profile.MuteRepDefault == false then
	UnmuteSoundFile(568016)
end
end


local TrackedFactions={};
local Event_Frame_B=CreateFrame("Frame");
Event_Frame_B:RegisterEvent("PLAYER_LOGIN");			-- Player login
Event_Frame_B:RegisterEvent("UPDATE_FACTION");		-- Kill rep
Event_Frame_B:RegisterEvent("QUEST_LOG_UPDATE");	-- Quest rep

Event_Frame_B:SetScript("OnEvent",function()
	   for i=1,GetNumFactions() do
	       local _,_,newstanding,_,_,_,_,_,isheader,_,hasrep,_,_,faction=GetFactionInfo(i);
	       if faction and (not isheader or hasrep) and (newstanding or 0)>0 then-- Make sure we have the info we need and standing isn't UNKNOWN (0)
	           local oldstanding=TrackedFactions[faction];
	           if oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 1 then-- Check if standing went up (allow same code to initialize tracking)
	                PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\FFLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 2 then-- Check if standing went up (allow same code to initialize tracking)
			             PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\KH3LU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 3 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MSLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 4 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\FNLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 5 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\LoLLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 6 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MCLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 7 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MW2LU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 8 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\MWLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 9 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\OSRSLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 10 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\PkmnLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 11 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\PoELU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 12 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SHHLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 13 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SMB3LU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 14 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\SRLU.ogg", "Master")
								elseif oldstanding and oldstanding<newstanding and BLU.db.profile.RepSoundSelect == 15 then-- Check if standing went up (allow same code to initialize tracking)
									PlaySoundFile("Interface\\Addons\\BLU\\Sounds\\WC3LU.ogg", "Master")
	           end

	           TrackedFactions[faction]=newstanding;-- Update standing
	       end
	   end
end);
















function BLU:SlashCommand(input, editbox)

	if input == "enable" then
			self:Enable()
			self:Print("Enabled.")
		elseif input == "disable" then
			-- unregisters all events and calls BLU:OnDisable() if you defined that
			self:Disable()
			self:Print("Disabled.")
		elseif input == "message" then
			print("this is our saved message:", self.db.profile.someInput)
		else


		-- https://github.com/Stanzilla/WoWUIBugs/issues/89
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		--[[ or as a standalone window
		if ACD.OpenFrames["BLU_Options"] then
			ACD:Close("BLU_Options")
		else
			ACD:Open("BLU_Options")
		end
		]]
end
end
