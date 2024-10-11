--=====================================================================================
-- BLU | Better Level-Up! - Initialization and Main Script
--=====================================================================================

-- Initialize the BLU addon table within a protected environment to avoid global namespace pollution
local addonName, addon = ...
BLU = BLU or {} -- Create the BLU table if it doesn't exist
BLU.db = BLU.db or {}
BLU.db.profile = BLU.db.profile or {}
BLU.Modules = BLU.Modules or {}

-- Version Information
BLU.VersionNumber = "v6.0.0"

-- Load localization
BLU_L = BLU_L or addon.L or {}  -- Ensure the localization table is loaded

--=====================================================================================
-- Sound Management
--=====================================================================================

BLU.muteSoundIDs = {
    retail = {
        569143,  -- Achievement
        1489546, -- Honor
        569593,  -- Level Up
        642841,  -- Battle Pet Level
        4745441, -- Renown
        568016,  -- Reputation
        567400,  -- Quest Accepted
        567439,  -- Quest Turned In
        2066672  -- Trade Post
    }
}

BLU.sounds = {
    -- Single sounds with low/med/high volume levels
    ["Achievement"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\achievement_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\achievement_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\achievement_default_high.ogg"
    },
    ["Battle Pet Level"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\battle_pet_level_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\battle_pet_level_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\battle_pet_level_default_high.ogg"
    },
    ["Honor"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\honor_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\honor_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\honor_default_high.ogg"
    },
    ["Level Up"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\level_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\level_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\level_default_high.ogg"
    },
    ["Renown"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\renown_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\renown_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\renown_default_high.ogg"
    },
    ["Reputation"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\rep_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\rep_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\rep_default_high.ogg"
    },
    ["Quest Accept"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\quest_accept_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\quest_accept_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\quest_accept_default_high.ogg"
    },
    ["Quest Turn In"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\quest_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\quest_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\quest_default_high.ogg"
    },
    ["Post"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\post_default_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\post_default_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\post_default_high.ogg"
    },

    -- Games with multiple variants and low/med/high volume levels
    ["Altered Beast"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\altered_beast_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\altered_beast_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\altered_beast_high.ogg"
    },
    ["Assassin's Creed"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\assassins_creed_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\assassins_creed_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\assassins_creed_high.ogg"
    },
    ["Castlevania"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\castlevania_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\castlevania_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\castlevania_high.ogg"
    },
    ["Diablo 2"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\diablo_2_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\diablo_2_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\diablo_2_high.ogg"
    },
    ["Dragon Quest"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\dragon_quest_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\dragon_quest_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\dragon_quest_high.ogg"
    },
    ["DotA 2"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\dota_2_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\dota_2_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\dota_2_high.ogg"
    },
    ["Elden Ring"] = {
        { -- Variant 1
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-1_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-1_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-1_high.ogg"
        },
        { -- Variant 2
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-2_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-2_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-2_high.ogg"
        },
        { -- Variant 3
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-3_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-3_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-3_high.ogg"
        },
        { -- Variant 4
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-4_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-4_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-4_high.ogg"
        },
        { -- Variant 5
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-5_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-5_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-5_high.ogg"
        },
        { -- Variant 6
            [1] = "Interface\\Addons\\BLU\\sounds\\elden_ring-6_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\elden_ring-6_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\elden_ring-6_high.ogg"
        }
    },
    ["Fire Emblem"] = {
        { -- Variant 1
            [1] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_high.ogg"
        },
        { -- Awakening
            [1] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_awakening_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_awakening_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\fire_emblem_awakening_high.ogg"
        }
    },
    ["GTA - San Andreas"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\gta_san_andreas_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\gta_san_andreas_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\gta_san_andreas_high.ogg"
    },
    ["Kingdom Hearts 3"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\kingdom_hearts_3_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\kingdom_hearts_3_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\kingdom_hearts_3_high.ogg"
    },
    ["Kirby"] = {
        { -- Kirby Variant 1
            [1] = "Interface\\Addons\\BLU\\sounds\\kirby_1_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\kirby_1_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\kirby_1_high.ogg"
        },
        { -- Kirby Variant 2
            [1] = "Interface\\Addons\\BLU\\sounds\\kirby_2_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\kirby_2_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\kirby_2_high.ogg"
        }
    },
    ["League of Legends"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\league_of_legends_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\league_of_legends_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\league_of_legends_high.ogg"
    },
    ["Legend of Zelda"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\legend_of_zelda_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\legend_of_zelda_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\legend_of_zelda_high.ogg"
    },
    ["Maplestory"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\maplestory_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\maplestory_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\maplestory_high.ogg"
    },
    ["Metal Gear Solid"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\metalgear_solid_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\metalgear_solid_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\metalgear_solid_high.ogg"
    },
    ["Minecraft"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\minecraft_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\minecraft_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\minecraft_high.ogg"
    },
    ["Modern Warfare 2"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\modern_warfare_2_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\modern_warfare_2_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\modern_warfare_2_high.ogg"
    },
    ["Morrowind"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\morrowind_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\morrowind_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\morrowind_high.ogg"
    },
    ["Old School Runescape"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\old_school_runescape_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\old_school_runescape_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\old_school_runescape_high.ogg"
    },
    ["Palworld"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\palworld_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\palworld_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\palworld_high.ogg"
    },
    ["Path of Exile"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\path_of_exile_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\path_of_exile_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\path_of_exile_high.ogg"
    },
    ["Pokemon"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\pokemon_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\pokemon_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\pokemon_high.ogg"
    },
    ["Ragnarok Online"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\ragnarok_online_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\ragnarok_online_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\ragnarok_online_high.ogg"
    },
    ["Shining Force"] = {
        { -- Shining Force II
            [1] = "Interface\\Addons\\BLU\\sounds\\shining_force_2_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\shining_force_2_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\shining_force_2_high.ogg"
        },
        { -- Shining Force III
            [1] = "Interface\\Addons\\BLU\\sounds\\shining_force_3_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\shining_force_3_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\shining_force_3_high.ogg"
        }
    },
    ["Skyrim"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\skyrim_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\skyrim_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\skyrim_high.ogg"
    },
    ["Sonic The Hedgehog"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\sonic_the_hedgehog_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\sonic_the_hedgehog_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\sonic_the_hedgehog_high.ogg"
    },
    ["Spyro The Dragon"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\spyro_the_dragon_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\spyro_the_dragon_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\spyro_the_dragon_high.ogg"
    },
    ["Super Mario Bros 3"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\super_mario_bros_3_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\super_mario_bros_3_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\super_mario_bros_3_high.ogg"
    },
    ["Warcraft 3"] = {
        [1] = "Interface\\Addons\\BLU\\sounds\\warcraft_3_low.ogg",
        [2] = "Interface\\Addons\\BLU\\sounds\\warcraft_3_med.ogg",
        [3] = "Interface\\Addons\\BLU\\sounds\\warcraft_3_high.ogg"
    },
    ["Witcher 3"] = {
        { -- Variant 1
            [1] = "Interface\\Addons\\BLU\\sounds\\witcher_3-1_low.ogg",
            [2] = "Interface\\Addons\\BLU\\sounds\\witcher_3-1_med.ogg",
            [3] = "Interface\\Addons\\BLU\\sounds\\witcher_3-1_high.ogg"
        }
    }
}
--=====================================================================================
-- Initialization of Saved Variables
--=====================================================================================
function BLU:InitSavedVariables()
    -- Check if BLU.sounds is loaded
    if not BLU.sounds then
        self:PrintError("Error: Sounds table is not initialized.")
        return
    end

    local defaults = {
        debugMode = false,
        showWelcomeMessage = true,
        AchievementSoundSelect = BLU.sounds["Achievement"],
        AchievementVolume = 2,
        BattlePetLevelSoundSelect = BLU.sounds["Battle Pet Level"],
        BattlePetLevelVolume = 2,
        DelveLevelUpSoundSelect = BLU.sounds["Delve Level Up"],
        DelveLevelUpVolume = 2,
        HonorSoundSelect = BLU.sounds["Honor"],
        HonorVolume = 2,
        LevelSoundSelect = BLU.sounds["Level Up"],
        LevelVolume = 2,
        QuestAcceptSoundSelect = BLU.sounds["Quest Accept"],
        QuestAcceptVolume = 2,
        QuestSoundSelect = BLU.sounds["Quest Turn In"],
        QuestVolume = 2,
        RenownSoundSelect = BLU.sounds["Renown"],
        RenownVolume = 2,
        RepSoundSelect = BLU.sounds["Reputation"],
        RepVolume = 2,
        PostSoundSelect = BLU.sounds["Post"],
        PostVolume = 2,
    }

    for key, value in pairs(defaults) do
        if self.db.profile[key] == nil then
            self.db.profile[key] = value
        end
    end
end


--=====================================================================================
-- Sound Categories
--=====================================================================================
BLU.soundCategories = {
    { label = BLU_L["ACHIEVEMENT"] or "Achievement", configKeySound = "AchievementSoundSelect", configKeyVolume = "AchievementVolume", defaultSound = BLU.sounds["Achievement"], defaultVolume = 2.0 },
    { label = BLU_L["BATTLE_PET_LEVEL"] or "Battle Pet Level", configKeySound = "BattlePetLevelSoundSelect", configKeyVolume = "BattlePetLevelVolume", defaultSound = BLU.sounds["Battle Pet Level"], defaultVolume = 2.0 },
    { label = BLU_L["DELVE_LEVEL_UP"] or "Delve Level Up", configKeySound = "DelveLevelUpSoundSelect", configKeyVolume = "DelveLevelUpVolume", defaultSound = BLU.sounds["Delve Level Up"], defaultVolume = 2.0 },
    { label = BLU_L["HONOR"] or "Honor", configKeySound = "HonorSoundSelect", configKeyVolume = "HonorVolume", defaultSound = BLU.sounds["Honor"], defaultVolume = 2.0 },
    { label = BLU_L["LEVEL_UP"] or "Level Up", configKeySound = "LevelSoundSelect", configKeyVolume = "LevelVolume", defaultSound = BLU.sounds["Level Up"], defaultVolume = 2.0 },
    { label = BLU_L["REPUTATION"] or "Reputation", configKeySound = "RepSoundSelect", configKeyVolume = "RepVolume", defaultSound = BLU.sounds["Reputation"], defaultVolume = 2.0 },
    { label = BLU_L["QUEST_ACCEPT"] or "Quest Accept", configKeySound = "QuestAcceptSoundSelect", configKeyVolume = "QuestAcceptVolume", defaultSound = BLU.sounds["Quest Accept"], defaultVolume = 2.0 },
    { label = BLU_L["QUEST_TURN_IN"] or "Quest Turn In", configKeySound = "QuestSoundSelect", configKeyVolume = "QuestVolume", defaultSound = BLU.sounds["Quest Turn In"], defaultVolume = 2.0 },
    { label = BLU_L["TRADE_POST"] or "Trade Post", configKeySound = "PostSoundSelect", configKeyVolume = "PostVolume", defaultSound = BLU.sounds["Post"], defaultVolume = 2.0 },
}


--=====================================================================================
-- Utility Functions - ui_helpers.lua
--=====================================================================================

-- Print helper functions with debug mode support
function BLU:Print(message)
    print("|cFF33FF99BLU|r: " .. message)
end

function BLU:PrintSuccess(message)
    if self.db.profile.debugMode then
        self:Print(message)
    end
end

function BLU:PrintError(message)
    print("|cFFFF3333BLU|r: " .. message)
end

-- Create a checkbox with tooltip
function BLU:CreateCheckbox(parent, label, configKey, tooltip)
    local checkbox = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    checkbox.Text:SetText(label)
    checkbox:SetChecked(self.db.profile[configKey])
    checkbox:SetScript("OnClick", function(selfCheckbox)
        BLU.db.profile[configKey] = selfCheckbox:GetChecked()
    end)

    if tooltip then
        checkbox.tooltip = tooltip
        checkbox:SetScript("OnEnter", function(selfCheckbox)
            GameTooltip:SetOwner(selfCheckbox, "ANCHOR_RIGHT")
            GameTooltip:SetText(selfCheckbox.tooltip, 1, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        checkbox:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    return checkbox
end

-- Create a dropdown with defensive checks and tooltips
function BLU:CreateDropdown(parent, label, configKeySound, configKeyVolume, values, tooltip)
    if not values or type(values) ~= "table" then
        self:PrintError("CreateDropdown Warning: 'values' must be a non-nil table for dropdown: " .. (label or "nil"))
        return nil
    end

    if #values == 0 then
        self:PrintError("No values available for dropdown: " .. (label or "nil"))
        return nil
    end

    local dropdown = CreateFrame("Frame", nil, parent, "UIDropDownMenuTemplate")
    dropdown.label = dropdown:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dropdown.label:SetPoint("BOTTOMLEFT", dropdown, "TOPLEFT", 16, 3)
    dropdown.label:SetText(label)

    UIDropDownMenu_SetWidth(dropdown, 180)

    UIDropDownMenu_Initialize(dropdown, function(self, level, menuList)
        local selectedValue = BLU.db.profile[configKeySound]
        local info = UIDropDownMenu_CreateInfo()

        if level == 1 then
            for _, value in ipairs(values) do
                info.text = value.text
                info.hasArrow = value.hasArrow
                info.menuList = value.menuList
                info.func = function()
                    BLU.db.profile[configKeySound] = value.value
                    UIDropDownMenu_SetSelectedValue(dropdown, value.value)
                    UIDropDownMenu_SetText(dropdown, value.text)
                    BLU:PrintSuccess(label .. " set to " .. value.text)
                end
                info.checked = (value.value == selectedValue)
                UIDropDownMenu_AddButton(info, level)
            end
        elseif menuList then
            for _, subValue in ipairs(menuList) do
                info.text = subValue.text
                info.func = function()
                    BLU.db.profile[configKeySound] = subValue.value
                    UIDropDownMenu_SetSelectedValue(dropdown, subValue.value)
                    UIDropDownMenu_SetText(dropdown, subValue.text)
                    BLU:PrintSuccess(label .. " set to " .. subValue.text)
                end
                info.checked = (subValue.value == selectedValue)
                UIDropDownMenu_AddButton(info, level)
            end
        end
    end)

    -- Set the selected value text
    local selectedValue = BLU.db.profile[configKeySound]
    for _, value in ipairs(values) do
        if value.value == selectedValue then
            UIDropDownMenu_SetText(dropdown, value.text)
            break
        end
    end

    if tooltip then
        dropdown:SetScript("OnEnter", function()
            GameTooltip:SetOwner(dropdown, "ANCHOR_RIGHT")
            GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        dropdown:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    return dropdown
end

-- Create a slider with tooltip
function BLU:CreateSlider(parent, label, configKey, minVal, maxVal, step, tooltip)
    self.db.profile[configKey] = self.db.profile[configKey] or minVal  -- Default to minVal if not initialized

    local slider = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetValue(self.db.profile[configKey])
    slider:SetObeyStepOnDrag(true)
    slider:SetWidth(180)
    slider.Text = slider:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    slider.Text:SetPoint("BOTTOM", slider, "TOP", 0, 0)
    slider.Text:SetText(label)

    -- Labels for the slider positions
    local labels = { [0] = "No Sound", [1] = "Low", [2] = "Medium", [3] = "High" }

    -- Display the current value
    slider.ValueText = slider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    slider.ValueText:SetPoint("TOP", slider, "BOTTOM", 0, -2)
    slider.ValueText:SetText(labels[self.db.profile[configKey]] or self.db.profile[configKey])

    slider:SetScript("OnValueChanged", function(selfSlider, value)
        value = math.floor(value + 0.5)  -- Round to nearest integer
        BLU.db.profile[configKey] = value
        selfSlider:SetValue(value)  -- Snap to integer value
        selfSlider.ValueText:SetText(labels[value] or value)
        BLU:PrintSuccess(label .. " set to " .. (labels[value] or value))
    end)

    if tooltip then
        slider:SetScript("OnEnter", function()
            GameTooltip:SetOwner(slider, "ANCHOR_RIGHT")
            GameTooltip:SetText(tooltip, 1, 1, 1, 1, true)
            GameTooltip:Show()
        end)
        slider:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    return slider
end

--=====================================================================================
-- Sound Management Functions
--=====================================================================================

-- Get Available Sound Options as a BLU method
function BLU:GetAvailableSoundOptions(categoryLabel)
    if not categoryLabel then
        self:PrintError("Category label is nil.")
        return {}
    end

    local dropdownValues = {}

    for soundName, soundData in pairs(BLU.sounds) do 
        if type(soundData) == "table" then
            if type(soundData[1]) == "table" then -- Games with multiple DISTINCT sounds (e.g., Elden Ring)
                local subMenu = {}
                for i, soundVariant in ipairs(soundData) do
                    local displayName = string.format("%s - %d", soundName, i)
                    table.insert(subMenu, { text = displayName, value = soundVariant }) 
                end
                table.insert(dropdownValues, { text = soundName, menuList = subMenu, hasArrow = true })
            else  -- Games with multiple variants, but SHARED sounds (e.g., Altered Beast)
                table.insert(dropdownValues, { text = soundName, value = soundData, hasArrow = false })
            end
        else
            -- Single sound
            table.insert(dropdownValues, { text = soundName, value = soundData, hasArrow = false })
        end
    end

    -- Add "Default" option at the beginning
    table.insert(dropdownValues, 1, { text = "Default", value = "default", hasArrow = false })

    return dropdownValues
end

-- Load Custom Sounds dynamically from the sounds folder
function BLU:LoadCustomSounds()
    -- Placeholder for actual implementation
    -- WoW's API does not provide a direct way to list files in a directory.
    -- Custom sounds should be predefined in the BLU.sounds table.
    -- Ensure that any custom sounds are added to the BLU.sounds table manually.
     
    self:PrintSuccess("Custom sounds loaded successfully (if any).")
end

-- Play Sound with volume handling
function BLU:PlaySound(categoryLabel)
    local soundPath = BLU.db.profile[BLU.soundCategories[categoryLabel].configKeySound]
    local volumeLevel = BLU.db.profile[BLU.soundCategories[categoryLabel].configKeyVolume]

    -- Get the correct sound path based on volumeLevel (1 for low, 2 for medium, 3 for high)
    if type(soundPath) == "table" then  -- Multiple volume levels
        soundPath = soundPath[volumeLevel]  -- Select appropriate sound based on volume
    end

    if soundPath and volumeLevel > 0 then
        PlaySoundFile(soundPath, "Master")  -- Play the selected sound
    end
end


--=====================================================================================
-- UI Panel Creation
--=====================================================================================

function BLU:BuildSoundOptionsPanel()
    -- Create a new frame for the options panel
    local panel = CreateFrame("Frame", "BLU_SoundOptionsPanel", UIParent)
    panel.name = "Better Level-Up! Sounds"
    panel.parent = "Better Level-Up!"

    -- Create a title for the panel
    panel.title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    panel.title:SetPoint("TOPLEFT", 16, -16)
    panel.title:SetText("Better Level-Up! Sounds")

    -- Initialize yOffset for positioning UI elements
    local yOffset = -50 

    -- Iterate over each sound category using BLU.soundCategories
    for index, category in ipairs(self.soundCategories) do
        -- Fetch available sound options using the category label
        local soundOptions = self:GetAvailableSoundOptions(category.label)

        -- Defensive check to ensure soundOptions is not empty
        if not soundOptions or #soundOptions == 0 then
            self:PrintError("No sound options available for category: " .. category.label)
        else
            -- Create a dropdown for selecting the sound
            local dropdown = self:CreateDropdown(
                panel,
                category.label .. " Sound",
                category.configKeySound,
                category.configKeyVolume, -- Pass configKeyVolume here
                soundOptions,
                "Select the sound to play for " .. category.label
            )
            if dropdown then
                dropdown:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, yOffset)

                -- Create a slider for volume
                local slider = self:CreateSlider(
                    panel,
                    category.label .. " Volume",
                    category.configKeyVolume,
                    0,
                    3,
                    1,  -- Step size of 1 for discrete values
                    "Adjust the volume for " .. category.label
                )
                if slider then
                    slider:SetPoint("LEFT", dropdown, "RIGHT", 20, 0) -- Place slider to the right
                    yOffset = yOffset - 60  -- Adjust Y offset for the next element
                end
            end
        end
    end

    -- Register your options panel using the new Settings API
    local category = Settings.RegisterCanvasLayoutCategory(panel, "Better Level-Up! Sounds")
    Settings.RegisterAddOnCategory(category)
end

function BLU:InitializeOptionsPanel()
    self:BuildSoundOptionsPanel()
end

--=====================================================================================
-- Event Handling and Initialization
--=====================================================================================

function BLU:OnAddonLoaded(arg1)
    if arg1 ~= addonName then return end
    self:PrintSuccess("Addon loaded.")

    -- Initialize saved variables
    self:InitSavedVariables()

    -- Ensure sounds and defaultSounds are loaded correctly
    if not self.sounds or not self.defaultSounds then
        self.sounds = self.sounds or {}
        self.defaultSounds = self.defaultSounds or {}
        self:PrintError("Sounds data not found. Please ensure 'sounds.lua' is loaded correctly.")
    end

    -- Load custom sounds
    self:LoadCustomSounds()
end

function BLU:OnPlayerLogin()
    self:PrintSuccess("Player logged in.")
    -- Show welcome message if enabled
    if self.db.profile.showWelcomeMessage then
        self:Print("Welcome to Better Level-Up! Enjoy your enhanced leveling experience.")
    end

    -- Initialize options panel
    self:InitializeOptionsPanel()
end

-- Define the main event frame
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        BLU:OnAddonLoaded(arg1)
    elseif event == "PLAYER_LOGIN" then
        BLU:OnPlayerLogin()
    end
end)