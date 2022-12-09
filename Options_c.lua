--v0.0.14
BLU.defaults = {
	profile = {
		LevelSoundSelect = 1,
		MuteLevelDefault = false,
		RepSoundSelect = 1,
		MuteRepDefault = false,
		QuestSoundSelect = 1,
		MuteQuestDefault = false,
		AchievementSoundSelect = 1,
		MuteAchievementDefault = false,
	},
}
BLU.options = {
	type = "group",
	name = "Sound Settings",
	handler = BLU,
	args = {
		group1 = {
			type = "group",
			order = 1,
			name = "Level-Up!",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				LevelSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = {"Default", "DotA 2", "EverQuest", "Final Fantasy", "Fly For Fun", "Fortnite", "Kingdom Hearts 3", "League of Legends", "Legend of Zelda", "Maplestory", "Minecraft", "Modern Warfare 2", "Morrowind", "Old School Runescape", "Path of Exile", "Pokemon", "Skyrim", "Sonic The Hedgehog", "Super Mario Bros 3", "Warcraft 3", "Witcher 3"},
				},
				TestLevelSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestLevelSound,
					},
				MuteLevelDefault = {
					type = "toggle",
					order = 3,
					name = "Mute Default",
					desc = "Mute Default Level Up Sound",
					get = function(info) return BLU.db.profile.MuteLevelDefault end,
					set = function(info, value) BLU.db.profile.MuteLevelDefault = value end,
				},
			},
		},
		group2 = {
			type = "group",
			order = 2,
			name = "Reputation Rank-Up!",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				RepSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = {"Default", "DotA 2", "EverQuest", "Final Fantasy", "Fly For Fun", "Fortnite", "Kingdom Hearts 3", "League of Legends", "Legend of Zelda", "Maplestory", "Minecraft", "Modern Warfare 2", "Morrowind", "Old School Runescape", "Path of Exile", "Pokemon", "Skyrim", "Sonic The Hedgehog", "Super Mario Bros 3", "Warcraft 3", "Witcher 3"},
				},
				TestRepSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
						name = "",
						desc = "",
					func = TestRepSound,
					},
				MuteRepDefault = {
					type = "toggle",
					order = 3,
					name = "Mute Default",
					desc = "Mute Default Rep Up Sound",
					get = function(info) return BLU.db.profile.MuteRepDefault end,
					set = function(info, value) BLU.db.profile.MuteRepDefault = value end,
				},
			},
		},
		group4 = {
			type = "group",
			order = 4,
			name = "Quest Turn-In!",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				QuestSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = {"Default", "DotA 2", "EverQuest", "Final Fantasy", "Fly For Fun", "Fortnite", "Kingdom Hearts 3", "League of Legends", "Legend of Zelda", "Maplestory", "Minecraft", "Modern Warfare 2", "Morrowind", "Old School Runescape", "Path of Exile", "Pokemon", "Skyrim", "Sonic The Hedgehog", "Super Mario Bros 3", "Warcraft 3", "Witcher 3"},
				},
				TestQuestSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestQuestSound,
					},
				MuteQuestDefault = {
					type = "toggle",
					order = 3,
					name = "Mute Default",
					desc = "Mute Default Level Up Sound",
					get = function(info) return BLU.db.profile.MuteQuestDefault end,
					set = function(info, value) BLU.db.profile.MuteQuestDefault = value end,
				},
			},
		},
		group5 = {
			type = "group",
			order = 5,
			name = "Achievement Earned!",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				AchievementSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = {"Default", "DotA 2", "EverQuest", "Final Fantasy", "Fly For Fun", "Fortnite", "Kingdom Hearts 3", "League of Legends", "Legend of Zelda", "Maplestory", "Minecraft", "Modern Warfare 2", "Morrowind", "Old School Runescape", "Path of Exile", "Pokemon", "Skyrim", "Sonic The Hedgehog", "Super Mario Bros 3", "Warcraft 3", "Witcher 3"},
				},
				TestAchievementSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestAchievementSound,
					},
				MuteAchievementDefault = {
					type = "toggle",
					order = 3,
					name = "Mute Default",
					desc = "Mute Default Achievement Earned Sound",
					get = function(info) return BLU.db.profile.MuteAchievementDefault end,
					set = function(info, value) BLU.db.profile.MuteAchievementDefault = value end,
				},
			},
		},
	},
}
function BLU:GetValue(info)
	return self.db.profile[info[#info]]
end
function BLU:SetValue(info, value)
	self.db.profile[info[#info]] = value
end
