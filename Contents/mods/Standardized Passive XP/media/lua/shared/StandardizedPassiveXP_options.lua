--Default options.
local SETTINGS = { 
	options = {
		dropdown1 = 1,
		dropdown2 = 1,
		dropdown3 = 1,
		dropdown4 = 1,
		dropdown5 = 1,
	},
	names= {
		dropdown1 = "Fitness XP Multiplier",
		dropdown2 = "Fitness XP Chance (One in X chance (1/x))",
		dropdown3 = "Strength XP Multiplier",
		dropdown4 = "Strength XP Chance (One in X chance (1/x))",
		dropdown5 = "Trees require weapons to give strength XP",
	},
	mod_id = "STPASSIVE",
	mod_shortname = "Standardized Passive XP"
}

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
	local settings = ModOptions:getInstance(SETTINGS)
	
	local drop1 = settings:getData("dropdown1")
	drop1[1] = "1xp - Vanilla"
	drop1[2] = "2xp"
	drop1[3] = "3xp"
	drop1[4] = "4xp"
	drop1[5] = "5xp"
	drop1[6] = "10xp"
	drop1[7] = "15xp"
	drop1[8] = "25xp"
	drop1[9] = "50xp"
	drop1[10] = "100xp"
	drop1.tooltip = "Xp Multiplier for passive Fitness XP.(that means NOT training XP)"
	local drop2 = settings:getData("dropdown2")
	drop2[1] = "200"
	drop2[2] = "300"
	drop2[3] = "500"
	drop2[4] = "700 - Vanilla"
	drop2[5] = "1000"
	drop2.tooltip = "Chance to obtain Fitness XP, as a one in x chance (1/x). Setting to 200 means 1/200 chance. Vanilla value is 700."
	local drop3 = settings:getData("dropdown3")
	drop3[1] = "1xp"
	drop3[2] = "2xp - Vanilla"
	drop3[3] = "3xp"
	drop3[4] = "4xp"
	drop3[5] = "5xp"
	drop3[6] = "10xp"
	drop3[7] = "15xp"
	drop3[8] = "25xp"
	drop3[9] = "50xp"
	drop3[10] = "100xp"
	drop3.tooltip = "Xp Multiplier for passive Strength XP.(that means NOT training XP)"
	local drop4 = settings:getData("dropdown4")
	drop4[1] = "200"
	drop4[2] = "300"
	drop4[3] = "500"
	drop4[4] = "700 - Vanilla"
	drop4[5] = "1000"
	drop4.tooltip = "Chance to obtain Strength XP, as a one in x chance (1/x). Setting to 200 means 1/200 chance. Vanilla value is 700."
	local drop5 = settings:getData("dropdown5")
	drop5[1] = "Yes. I must have a weapon."
	drop5[2] = "No. I want to become Steve from minecraft."
	drop5.tooltip = "When a player hits a tree, they are given strength experience as long as they are not using their bare hands.  This allows you to enable using your bare hands in addition to weapons."

end

StandardizedPassiveXP_global = {}
StandardizedPassiveXP_global.SETTINGS = SETTINGS