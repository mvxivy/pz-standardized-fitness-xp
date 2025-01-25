local modOptions = require("ST_Fitness_ModOptions")
modOptions.init()

local fitnessBoost = {1, 2, 3, 4, 5, 10, 15, 25, 50, 100, 1000}
local fitnessChance = {200, 300, 500, 700, 1000}

local strengthBoost = {1, 2, 3, 4, 5, 10, 15, 25, 50, 100, 1000}
local strengthChance = {200, 300, 500, 700, 1000}
-- Whether you need weapons to get XP from trees
local gachiTreesTraining = {true, false}

-- do we get xp ?
  local randXp = function(OneInX)
    return ZombRand(tonumber(OneInX) * GameTime:getInstance():getInvMultiplier()) == 0;
  end

-- used everytime the player move
local onPlayerMove = function()
  local player = getPlayer();
  local xp = player:getXp();
  -- Passive fitness from running xp
  -- if you're running and your endurance has changed
  if (player:IsRunning() or player:isSprinting()) and player:getStats():getEndurance() >
    player:getStats():getEndurancewarn() then
    -- you may gain some xp in fitness
    if randXp(fitnessChance[modOptions.ComboBoxFitnessChance:getValue()]) then
      xp:AddXP(Perks.Fitness, fitnessBoost[modOptions.ComboBoxFitnessXP:getValue()]);
    end
  end

  -- if you're walking with a lot of stuff, you may gain in Strength
  if player:getInventoryWeight() > player:getMaxWeight() * 0.5 then
    if randXp(strengthChance[modOptions.ComboBoxStrengthChance:getValue()]) then
      xp:AddXP(Perks.Strength, strengthBoost[modOptions.ComboBoxStrengthXP:getValue()]);
    end
  end
end

-- when you or a npc try to hit a tree
local OnWeaponHitTree = function(owner, weapon)
  if gachiTreesTraining[tonumber(SETTINGS.options.dropdown5)] then
    if weapon and weapon:getType() ~= "BareHands" then
      owner:getXp():AddXP(Perks.Strength, strengthBoost[modOptions.ComboBoxStrengthXP:getValue()]);
    end
  else
    if weapon then
      owner:getXp():AddXP(Perks.Strength, strengthBoost[modOptions.ComboBoxStrengthXP:getValue()]);
    end
  end
end

-- when you or a npc try to hit something
local onWeaponHitXp = function(owner, weapon, hitObject, damage)
  -- if you sucessful swing your non ranged weapon
  if owner:getStats():getEndurance() > owner:getStats():getEndurancewarn() and not weapon:isRanged() then
    owner:getXp():AddXP(Perks.Fitness, fitnessBoost[modOptions.ComboBoxFitnessXP:getValue()]);
  end

  -- we add xp depending on how many target you hit
  if not weapon:isRanged() and owner:getLastHitCount() > 0 then
    owner:getXp():AddXP(Perks.Strength, (owner:getLastHitCount() + strengthBoost[modOptions.ComboBoxStrengthXP:getValue()]));
  end
end

Events.OnPlayerMove.Add(onPlayerMove);

Events.OnWeaponHitXp.Add(onWeaponHitXp);

Events.OnWeaponHitTree.Add(OnWeaponHitTree);
