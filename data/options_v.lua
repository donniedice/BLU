local VersionNumber = "3.1.4"
local soundOptions = {
  "[Default]",
  "[Random]",
  "Altered Beast",
  "Assassin's Creed",
  "Castlevania",
  "Diablo 2",
  "Dragon Quest",
  "DotA 2",
  "EverQuest",
  "Fallout - New Vegas",
  "Fallout 3",
  "Final Fantasy",
  "Fire Emblem",
  "Fire Emblem - Awakening",
  "Fly For Fun",
  "Fortnite",
  "GTA - San Andreas",
  "Kingdom Hearts 3",
  "Kirby (1)",
  "Kirby (2)",
  "League of Legends",
  "Legend of Zelda",
  "Maplestory",
  "Metal Gear Solid",
  "Minecraft",
  "Modern Warfare 2",
  "Morrowind",
  "Old School Runescape",
  "Palworld",
  "Path of Exile",
  "Pokemon",
  "Ragnarok Online",
  "Shining Force II",
  "Shining Force III (1)",
  "Shining Force III (2)",
  "Shining Force III (3)",
  "Shining Force III (4)",
  "Shining Force III (5)",
  "Shining Force III (6)",
  "Shining Force III (7)",
  "Shining Force III (8)",
  "Shining Force III (9)",
  "Shining Force III (10)",
  "Shining Force III (11)",
  "Skyrim",
  "Sonic The Hedgehog",
  "Spryo The Dragon",
  "Super Mario Bros 3",
  "Warcraft 3",
  "Witcher 3 (1)",
  "Witcher 3 (2)",
};
BLU.defaults = {
	profile = {
		LevelSoundSelect = 17,
		MuteLevelDefault = true,
		RepSoundSelect = 26,
		MuteRepDefault = true,
		QuestAcceptSoundSelect = 19,
		MuteQuestAcceptDefault = true,
		QuestSoundSelect = 18,
		MuteQuestDefault = true,
	},
}
BLU.options = {
	type = "group",
	name = "",
	handler = BLU,
	args = {
		group1 = {
			type = "header",
			order = 1,
			name = "|cff05dffaBLU|r |cffffffff|| |cff05dffaB|r|cffffffffetter|r |cff05dffaL|r|cffffffffevel|r |cff05dffaU|r|cffffffffp!|r",
		},
		group2 = {
			type = "group",
			order = 2,
			name = "|cff05dffaLevel-Up!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				LevelSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestLevelSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\images\\play.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestLevelSound,
					},
				MuteLevelDefault = {
					type = "toggle",
					order = 3,
					name = "|cff05dffaMute Default|r",
					desc = "|cffffffffMute Default Level Up Sound|r",
					get = function(info) return BLU.db.profile.MuteLevelDefault end,
					set = function(info, value) BLU.db.profile.MuteLevelDefault = value end,
				},
			},
		},
		group3 = {
			type = "group",
			order = 3,
			name = "|cffffffffReputation Rank-Up!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				RepSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestRepSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\images\\play.blp",
						imageWidth = 20,
						imageHeight = 20,
						name = "",
						desc = "",
					func = TestRepSound,
					},
				MuteRepDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Rep-Up Sound|r",
					get = function(info) return BLU.db.profile.MuteRepDefault end,
					set = function(info, value) BLU.db.profile.MuteRepDefault = value end,
				},
			},
		},
		group4 = {
			type = "group",
			order = 4,
			name = "|cff05dffaQuest Accepted|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				QuestAcceptSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestQuestAcceptSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\images\\play.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestQuestAcceptSound,
					},
				MuteQuestAcceptDefault = {
					type = "toggle",
					order = 3,
					name = "|cff05dffaMute Default|r",
					desc = "|cffffffffMute Default Quest Accepted Sound|r",
					get = function(info) return BLU.db.profile.MuteQuestAcceptDefault end,
					set = function(info, value) BLU.db.profile.MuteQuestAcceptDefault = value end,
				},
			},
		},
		group5 = {
			type = "group",
			order = 5,
			name = "|cffffffffQuest Turn-In!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				QuestSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestQuestSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\images\\play.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestQuestSound,
					},
				MuteQuestDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Quest Turn-In Sound|r",
					get = function(info) return BLU.db.profile.MuteQuestDefault end,
					set = function(info, value) BLU.db.profile.MuteQuestDefault = value end,
				},
			},
		},
		group6 = {
			type = "header",
			order = 6,
			name = "|cff8080ff" .. VersionNumber .. "|r",
		},
	},
}
function BLU:GetValue(info)
	return self.db.profile[info[#info]]
end
function BLU:SetValue(info, value)
	self.db.profile[info[#info]] = value
end
