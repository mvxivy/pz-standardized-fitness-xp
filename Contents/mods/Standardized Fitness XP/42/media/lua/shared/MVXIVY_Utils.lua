local MVXIVY_Utils = {}

function MVXIVY_Utils.addComboBoxItems(comboBox, items, defaultItem)
  for i = 1, #items do
    local item = items[i]
    comboBox:addItem(item, i == defaultItem)
  end
end

--- Creates a factory function for generating combo boxes with specified options.
-- @param comboBoxNamespace The namespace to use for the combo box.
-- @param localizeNamespace The namespace to use for localization.
-- @param UI The UI object to which the combo box will be added.
-- @return A function that takes an options table and returns a combo box.
function MVXIVY_Utils.useComboBoxFactory(comboBoxNamespace, localizeNamespace, UI)
  --- Creates and returns a combo box UI element with specified options.
  -- @param options table A table containing the following fields:
  --   - name: string The name of the combo box.
  --   - label: string The label text for the combo box.
  --   - items: table A table of items to populate the combo box.
  --   - defaultItem: string The default selected item in the combo box.
  --   - description: string (Optional) A description text for the combo box.
  -- @return table The created combo box UI element.
  return function (options)
    local comboBox = UI:addComboBox(
      comboBoxNamespace .. options.name,
      getText(localizeNamespace .. options.label)
    )

    MVXIVY_Utils.addComboBoxItems(
      comboBox,
      options.items,
      options.defaultItem
    )

    if options.description then
       UI:addDescription(getText(localizeNamespace .. options.description))
    end

    return comboBox
  end
end

return MVXIVY_Utils