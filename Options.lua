--v1.0.12
local soundOptions = {
  "Default",
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
  "Kirby [1]",
  "Kirby [2]",
  "League of Legends",
  "Legend of Zelda",
  "Maplestory",
  "Metal Gear Solid",
  "Minecraft",
  "Modern Warfare 2",
  "Morrowind",
  "Old School Runescape",
  "Path of Exile",
  "Pokemon",
  "Ragnarok Online",
  "Shining Force II",
  "Shining Force III[1]",
  "Shining Force III[2]",
  "Shining Force III[3]",
  "Shining Force III[4]",
  "Shining Force III[5]",
  "Shining Force III[6]",
  "Shining Force III[7]",
  "Shining Force III[8]",
  "Shining Force III[9]",
  "Shining Force III[10]",
  "Shining Force III[11]",
  "Skyrim",
  "Sonic The Hedgehog",
  "Spryo The Dragon",
  "Super Mario Bros 3",
  "Warcraft 3",
  "Witcher 3 [1]",
  "Witcher 3 [2]"
};
BLU.defaults = {
	profile = {
		AchievementSoundSelect = 1,
		MuteAchievementDefault = false,
		HonorSoundSelect = 1,
		MuteHonorDefault = false,
		LevelSoundSelect = 1,
		MuteLevelDefault = false,
    BattlePetLevelSoundSelect = 1,
    MuteBattlePetLevelDefault = false,
		RenownSoundSelect = 1,
		MuteRenownDefault = false,
		RepSoundSelect = 1,
		MuteRepDefault = false,
		QuestAcceptSoundSelect = 1,
		MuteQuestAcceptDefault = false,
		QuestSoundSelect = 1,
		MuteQuestDefault = false,
    PostSoundSelect = 1,
    MutePostDefault = false,
	},
}
BLU.options = {
	type = "group",
	name = "|cff05dffaBLU|r |cffffffff|| |cff05dffaB|r|cffffffffetter|r |cff05dffaL|r|cffffffffevel|r |cff05dffaU|r|cffffffffp! - v1.0.12|r",
	handler = BLU,
	args = {
		group1 = {
			type = "group",
			order = 1,
			name = "|cffffffffAchievement Earned!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				AchievementSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
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
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Achievement Earned Sound|r",
					get = function(info) return BLU.db.profile.MuteAchievementDefault end,
					set = function(info, value) BLU.db.profile.MuteAchievementDefault = value end,
				},
			},
		},
    group2 = {
      type = "group",
      order = 2,
      name = "|cff05dffaBattle Pet Level-Up!|r",
      inline = true,
      get = "GetValue",
      set = "SetValue",
      args = {
        BattlePetLevelSoundSelect = {
          type = "select",
          order = 1,
          name = "",
          values = soundOptions,
        },
        TestBattlePetLevelSound = {
          type = "execute",
          order = 2,
          image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
            imageWidth = 20,
            imageHeight = 20,
          name = "",
          desc = "",
          func = TestBattlePetLevelSound,
          },
        MuteLevelDefault = {
          type = "toggle",
          order = 3,
          name = "|cff05dffaMute Default|r",
          desc = "Mute Default Battle Pet Level Up Sound",
          get = function(info) return BLU.db.profile.MuteBattlePetLevelDefault end,
          set = function(info, value) BLU.db.profile.MuteBattlePetLevelDefault = value end,
        },
      },
    },
		group3 = {
			type = "group",
			order = 3,
			name = "|cffffffffHonor Rank-Up!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				HonorSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestHonorSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestHonorSound,
					},
				MuteHonorDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Honor Rank Up Sound|r",
					get = function(info) return BLU.db.profile.MuteHonorDefault end,
					set = function(info, value) BLU.db.profile.MuteHonorDefault = value end,
				},
			},
		},
		group4 = {
			type = "group",
			order = 4,
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
					name = "|cff05dffaMute Default|r",
					desc = "Mute Default Level Up Sound",
					get = function(info) return BLU.db.profile.MuteLevelDefault end,
					set = function(info, value) BLU.db.profile.MuteLevelDefault = value end,
				},
			},
		},
		group5 = {
			type = "group",
			order = 5,
			name = "|cffffffffRenown Rank-Up!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				RenownSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestRenownSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestRenownSound,
					},
				MuteRenownDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Level Up Sound|r",
					get = function(info) return BLU.db.profile.MuteRenownDefault end,
					set = function(info, value) BLU.db.profile.MuteRenownDefault = value end,
				},
			},
		},
		group6 = {
			type = "group",
			order = 6,
			name = "|cff05dffaReputation Rank-Up!|r",
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
					name = "|cff05dffaMute Default|r",
					desc = "Mute Default Rep-Up Sound",
					get = function(info) return BLU.db.profile.MuteRepDefault end,
					set = function(info, value) BLU.db.profile.MuteRepDefault = value end,
				},
			},
		},
		group7 = {
			type = "group",
			order = 7,
			name = "|cffffffffQuest Accepted|r",
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
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestQuestAcceptSound,
					},
				MuteQuestAcceptDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Quest Accepted Sound|r",
					get = function(info) return BLU.db.profile.MuteQuestAcceptDefault end,
					set = function(info, value) BLU.db.profile.MuteQuestAcceptDefault = value end,
				},
			},
		},
		group8 = {
			type = "group",
			order = 8,
			name = "|cff05dffaQuest Turn-In!|r",
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
					name = "|cff05dffaMute Default|r",
					desc = "Mute Default Quest Turn-In Sound",
					get = function(info) return BLU.db.profile.MuteQuestDefault end,
					set = function(info, value) BLU.db.profile.MuteQuestDefault = value end,
				},
			},
		},
    group9 = {
			type = "group",
			order = 9,
			name = "|cffffffffTrade Post Activity Completed!|r",
			inline = true,
			get = "GetValue",
			set = "SetValue",
			args = {
				PostSoundSelect = {
					type = "select",
					order = 1,
					name = "",
					values = soundOptions,
				},
				TestPostSound = {
					type = "execute",
					order = 2,
					image = "Interface\\Addons\\BLU\\Images\\PLAY.blp",
						imageWidth = 20,
						imageHeight = 20,
					name = "",
					desc = "",
					func = TestPostSound,
					},
				MutePostDefault = {
					type = "toggle",
					order = 3,
					name = "|cffffffffMute Default|r",
					desc = "|cff05dffaMute Default Trade Post Activity Completed Sound|r",
					get = function(info) return BLU.db.profile.MutePostDefault end,
					set = function(info, value) BLU.db.profile.MutePostDefault = value end,
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
