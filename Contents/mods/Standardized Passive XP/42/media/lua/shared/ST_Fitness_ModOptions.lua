local config = require("ST_Fitness_Config")
local MVXIVY_Utils = require("MVXIVY_Utils")
local modOptions = {}

function modOptions.init()
  local UI = PZAPI.ModOptions:create(config.modId, config.modName)

  local ComboBoxFactory = MVXIVY_Utils.useComboBoxFactory(
    "ST_Fitness_",
    "UI_options_" .. config.modId .. "_",
    UI
  )

  local ComboBoxFitnessXP = ComboBoxFactory {
    name = "FitnessXP",
    label = "fitness_xp_label",
    items = {"1xp", "2xp", "3xp", "4xp", "5xp", "10xp", "15xp", "25xp", "50xp", "100xp"},
    defaultItem = 1,
    description = "fitness_xp_description"
  }
  modOptions.ComboBoxFitnessXP = ComboBoxFitnessXP

  local ComboBoxFitnessChance = ComboBoxFactory {
    name = "FitnessChance",
    label = "fitness_chance_label",
    items = {"1/200", "1/300", "1/500", "1/700", "1/1000"},
    defaultItem = 4,
    description = "fitness_chance_description"
  }
  modOptions.ComboBoxFitnessChance = ComboBoxFitnessChance

  local ComboBoxStrengthXP = ComboBoxFactory {
    name = "StrengthXP",
    label = "strength_xp_label",
    items = {"1xp", "2xp", "3xp", "4xp", "5xp", "10xp", "15xp", "25xp", "50xp", "100xp"},
    defaultItem = 1,
    description = "strength_xp_description"
  }
  modOptions.ComboBoxStrengthXP = ComboBoxStrengthXP

  local ComboBoxStrengthChance = ComboBoxFactory {
    name = "StrengthChance",
    label = "strength_chance_label",
    items = {"1/200", "1/300", "1/500", "1/700", "1/1000"},
    defaultItem = 4,
    description = "strength_chance_description"
  }
  modOptions.ComboBoxStrengthChance = ComboBoxStrengthChance

  local ComboBoxGachi = ComboBoxFactory {
    name = "Gachi",
    label = "gachi_label",
    items = {getText("UI_options_STPASSIVE_B42_gachi_option_yes"),
             getText("UI_options_STPASSIVE_B42_gachi_option_no")},
    defaultItem = 1,
    description = "gachi_description"
  }
  modOptions.ComboBoxGachi = ComboBoxGachi
end

return modOptions
