-- =====================================================================================
-- BLU | Better Level-Up! - optionspanel.lua
-- =====================================================================================

-- Ensure the localization table is properly initialized before usage.
BLU_L = BLU_L or {}  -- Ensure BLU_L is defined
local panels = {}

-- =====================================================================================
-- Create Option Controls
-- =====================================================================================
local function CreateOptionDropdown(name, label, parent, configKey, values, defaultValue)
    local dropdown = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", 16, -32)
    UIDropDownMenu_SetWidth(dropdown, 180)

    -- Label
    if label and label ~= "" then
        local labelText = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        labelText:SetText(label)
        labelText:SetPoint("TOPLEFT", dropdown, "TOPLEFT", 20, 30)
    end

    -- Dropdown initialization
    UIDropDownMenu_Initialize(dropdown, function(self, level, menuList)
        for key, text in pairs(values) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = text
            info.value = key
            info.func = function()
                UIDropDownMenu_SetSelectedValue(dropdown, key)
                if BLU and BLU.db and BLU.db.profile then
                    BLU.db.profile[configKey] = key  -- Safeguard for accessing saved variables
                end
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    -- Load current value
    if BLU and BLU.db and BLU.db.profile then
        UIDropDownMenu_SetSelectedValue(dropdown, BLU.db.profile[configKey] or defaultValue)  -- Safeguard for accessing saved variables
    else
        UIDropDownMenu_SetSelectedValue(dropdown, defaultValue)
    end

    return dropdown
end

local function CreateSlider(name, label, parent, configKey, minValue, maxValue, defaultValue, step)
    local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
    slider:SetMinMaxValues(minValue, maxValue)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)

    -- Set slider value
    if BLU and BLU.db and BLU.db.profile then
        slider:SetValue(BLU.db.profile[configKey] or defaultValue)  -- Safeguard for accessing saved variables
    else
        slider:SetValue(defaultValue)
    end

    slider:SetPoint("TOPLEFT", parent, "TOPLEFT", 16, -80)
    slider:SetWidth(200)

    -- Slider label and value display
    slider.Text:ClearAllPoints()
    slider.Text:SetPoint("TOP", slider, "BOTTOM", 0, 0)
    slider.Text:SetText(label or "") -- Safeguard against nil labels

    slider.Low:SetText(minValue)
    slider.High:SetText(maxValue)

    -- Update on change
    slider:SetScript("OnValueChanged", function(self, value)
        if BLU and BLU.db and BLU.db.profile then
            BLU.db.profile[configKey] = value  -- Safeguard for accessing saved variables
        end
    end)

    return slider
end

-- =====================================================================================
-- Build Options Panels for Each Module
-- =====================================================================================
local function BuildOptionsPanel(moduleName, settings)
    local panel = CreateFrame("Frame", moduleName .. "OptionsPanel", UIParent)
    panel.name = moduleName .. " | Better Level-Up!"

    -- Title and Description
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(moduleName .. " | Better Level-Up!")

    local subText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    subText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    subText:SetText("Configure sound settings for " .. moduleName)

    -- Generate Controls from Settings
    local lastControl = subText
    for _, setting in ipairs(settings) do
        local label = setting.label or "" -- Safeguard: use empty string if label is nil
        if setting.type == "dropdown" then
            local dropdown = CreateOptionDropdown(moduleName .. label, label, panel, setting.configKey, setting.values, setting.defaultValue)
            dropdown:SetPoint("TOPLEFT", lastControl, "BOTTOMLEFT", 0, -50)
            lastControl = dropdown
        elseif setting.type == "slider" then
            local slider = CreateSlider(moduleName .. label, label, panel, setting.configKey, setting.minValue, setting.maxValue, setting.defaultValue, setting.step)
            slider:SetPoint("TOPLEFT", lastControl, "BOTTOMLEFT", 0, -50)
            lastControl = slider
        end
    end

    -- Register panel with Settings
    Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    return panel
end

-- =====================================================================================
-- Define Settings for Each Module
-- =====================================================================================
local achievementSettings = {
    {type = "dropdown", label = BLU_L["ACHIEVEMENT_EARNED"], configKey = "AchievementSoundSelect", values = soundOptions, defaultValue = 35},
    {type = "slider", label = BLU_L["ACHIEVEMENT_VOLUME_LABEL"], configKey = "AchievementVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local battlePetSettings = {
    {type = "dropdown", label = BLU_L["BATTLE_PET_LEVEL_UP"], configKey = "BattlePetLevelSoundSelect", values = soundOptions, defaultValue = 37},
    {type = "slider", label = BLU_L["BATTLE_PET_VOLUME_LABEL"], configKey = "BattlePetLevelVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local delveSettings = {
    {type = "dropdown", label = BLU_L["DELVE_COMPANION_LEVEL_UP"], configKey = "DelveLevelUpSoundSelect", values = soundOptions, defaultValue = 50},
    {type = "slider", label = BLU_L["DELVE_VOLUME_LABEL"], configKey = "DelveLevelUpVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local honorSettings = {
    {type = "dropdown", label = BLU_L["HONOR_RANK_UP"], configKey = "HonorSoundSelect", values = soundOptions, defaultValue = 27},
    {type = "slider", label = BLU_L["HONOR_VOLUME_LABEL"], configKey = "HonorVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local levelUpSettings = {
    {type = "dropdown", label = BLU_L["LEVEL_UP"], configKey = "LevelSoundSelect", values = soundOptions, defaultValue = 24},
    {type = "slider", label = BLU_L["LEVEL_VOLUME_LABEL"], configKey = "LevelVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local questAcceptSettings = {
    {type = "dropdown", label = BLU_L["QUEST_ACCEPTED"], configKey = "QuestAcceptSoundSelect", values = soundOptions, defaultValue = 26},
    {type = "slider", label = BLU_L["QUEST_ACCEPT_VOLUME_LABEL"], configKey = "QuestAcceptVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local questCompleteSettings = {
    {type = "dropdown", label = BLU_L["QUEST_COMPLETE"], configKey = "QuestSoundSelect", values = soundOptions, defaultValue = 25},
    {type = "slider", label = BLU_L["QUEST_COMPLETE_VOLUME_LABEL"], configKey = "QuestVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local renownSettings = {
    {type = "dropdown", label = BLU_L["RENOWN_RANK_UP"], configKey = "RenownSoundSelect", values = soundOptions, defaultValue = 21},
    {type = "slider", label = BLU_L["RENOWN_VOLUME_LABEL"], configKey = "RenownVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local reputationSettings = {
    {type = "dropdown", label = BLU_L["REPUTATION_RANK_UP"], configKey = "RepSoundSelect", values = soundOptions, defaultValue = 15},
    {type = "slider", label = BLU_L["REP_VOLUME_LABEL"], configKey = "RepVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

local tradePostSettings = {
    {type = "dropdown", label = BLU_L["TRADE_POST_ACTIVITY_COMPLETE"], configKey = "PostSoundSelect", values = soundOptions, defaultValue = 55},
    {type = "slider", label = BLU_L["POST_VOLUME_LABEL"], configKey = "PostVolume", minValue = 0, maxValue = 3, defaultValue = 2.0, step = 0.1},
}

-- =====================================================================================
-- Create Panels for All Modules
-- =====================================================================================
table.insert(panels, BuildOptionsPanel("Achievements", achievementSettings))
table.insert(panels, BuildOptionsPanel("Battle Pets", battlePetSettings))
table.insert(panels, BuildOptionsPanel("Delves", delveSettings))
table.insert(panels, BuildOptionsPanel("Honor", honorSettings))
table.insert(panels, BuildOptionsPanel("Level Up", levelUpSettings))
table.insert(panels, BuildOptionsPanel("Quest Accepted", questAcceptSettings))
table.insert(panels, BuildOptionsPanel("Quest Complete", questCompleteSettings))
table.insert(panels, BuildOptionsPanel("Renown", renownSettings))
table.insert(panels, BuildOptionsPanel("Reputation", reputationSettings))
table.insert(panels, BuildOptionsPanel("Trade Post", tradePostSettings))

-- =====================================================================================
-- Handle Opening the Panel
-- =====================================================================================
function BLU:OpenOptionsPanel()
    if not self.optionsFrame then
        self.optionsFrame = {}
        for _, panel in ipairs(panels) do
            table.insert(self.optionsFrame, panel)
        end
    end

    Settings.OpenToCategory(panels[1])  -- Open to first panel (Achievements)
end
