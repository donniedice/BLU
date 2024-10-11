-- panels.lua
-- Contains panel-building functions

local BLU = BLU  -- Reference to the global BLU table

function BLU:BuildSoundOptionsPanel()
    -- Create a new frame for the options panel
    local panel = CreateFrame("Frame", "BLU_SoundOptionsPanel", UIParent)
    panel.name = "Better Level-Up! Sounds"
    panel.parent = "Better Level-Up!"

    -- Create a title for the panel
    panel.title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    panel.title:SetPoint("TOPLEFT", 16, -16)
    panel.title:SetText("Better Level-Up! Sounds")

    -- Adjust the starting Y offset
    local yOffset = -50

    -- Iterate over each sound category to create dropdowns and sliders
    for index, category in ipairs(self.soundCategories) do
        -- Fetch available sound options for the current category using the label
        local soundOptions = GetAvailableSoundOptions(category.label)

        -- Defensive check to ensure soundOptions is not empty
        if not soundOptions or #soundOptions == 0 then
            print("No sound options available for category:", category.label)
        else
            -- Create a dropdown for selecting the sound
            local dropdown = self:CreateDropdown(
                panel, 
                category.label .. " Sound", 
                category.configKeySound,  -- Use the configKeySound from the category table
                soundOptions  -- Pass the aggregated sound options
            )
            dropdown:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, yOffset)
            yOffset = yOffset - 60  -- Adjust Y offset for the next element

            -- Create a slider for volume
            local slider = self:CreateSlider(
                panel, 
                category.label .. " Volume", 
                category.configKeyVolume,  -- Use the configKeyVolume from the category table
                0, 
                3, 
                1  -- Step size of 1 for discrete values
            )
            slider:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, yOffset)
            yOffset = yOffset - 60  -- Adjust Y offset for the next element
        end
    end

    -- Register your options panel using the new Settings API
    local category = Settings.RegisterCanvasLayoutCategory(panel, "Better Level-Up! Sounds")
    Settings.RegisterAddOnCategory(category)
end

function BLU:InitializeOptionsPanel()
    self:BuildSoundOptionsPanel()
end
