--=====================================================================================
-- BLU | Better Level-Up! - ui_helpers.lua
--=====================================================================================

local BLU = BLU  -- Reference to the global BLU table
local L = BLU_L or {}  -- Localization table

-- Create a checkbox
function BLU:CreateCheckbox(parent, label, configKey)
    local checkbox = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    checkbox.Text:SetText(label)
    checkbox:SetChecked(BLU.db.profile[configKey])
    checkbox:SetScript("OnClick", function(self)
        BLU.db.profile[configKey] = self:GetChecked()
    end)
    return checkbox
end

-- Create a dropdown with defensive checks
function BLU:CreateDropdown(parent, label, configKey, values)
    -- Ensure that values is a table and not nil
    if not values or type(values) ~= "table" then
        print("CreateDropdown Warning: 'values' must be a non-nil table for dropdown:", label)
        return nil
    end

    -- If values table is empty, provide feedback and skip dropdown creation
    if #values == 0 then
        print("No values available for dropdown:", label)
        return nil
    end

    local dropdown = CreateFrame("Frame", nil, parent, "UIDropDownMenuTemplate")
    dropdown.label = dropdown:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    dropdown.label:SetPoint("BOTTOMLEFT", dropdown, "TOPLEFT", 16, 3)
    dropdown.label:SetText(label)

    UIDropDownMenu_SetWidth(dropdown, 180)

    UIDropDownMenu_Initialize(dropdown, function(self, level, menuList)
        local selectedValue = BLU.db.profile[configKey]
        local info = UIDropDownMenu_CreateInfo()

        if level == 1 then
            for _, value in ipairs(values) do
                info = UIDropDownMenu_CreateInfo()
                info.text = value.text
                info.hasArrow = value.hasArrow
                info.menuList = value.menuList
                info.func = function(self)
                    BLU.db.profile[configKey] = value.value
                    UIDropDownMenu_SetSelectedValue(dropdown, value.value)
                end
                info.checked = (value.value == selectedValue)
                UIDropDownMenu_AddButton(info, level)
            end
        else
            for _, subValue in ipairs(menuList) do
                info = UIDropDownMenu_CreateInfo()
                info.text = subValue.text
                info.func = function(self)
                    BLU.db.profile[configKey] = subValue.value
                    UIDropDownMenu_SetSelectedValue(dropdown, subValue.value)
                end
                info.checked = (subValue.value == selectedValue)
                UIDropDownMenu_AddButton(info, level)
            end
        end
    end)

    UIDropDownMenu_SetSelectedValue(dropdown, BLU.db.profile[configKey])
    return dropdown
end

-- Create a slider
function BLU:CreateSlider(parent, label, configKey, minVal, maxVal, step)
    BLU.db.profile[configKey] = BLU.db.profile[configKey] or minVal  -- Default to minVal if not initialized

    local slider = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetValue(BLU.db.profile[configKey])
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
    slider.ValueText:SetText(labels[BLU.db.profile[configKey]] or BLU.db.profile[configKey])

    slider:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5)  -- Round to nearest integer
        BLU.db.profile[configKey] = value
        self:SetValue(value)  -- Snap to integer value
        self.ValueText:SetText(labels[value] or value)
    end)

    return slider
end
