local function ability(scores)
  local min = 6
  local sum = 0
  for _, value in ipairs(scores) do
    if value < min then
      min = value
    end
    sum = sum + value
  end
  return sum - min
end

local function roll_dice()
  local rolls = {}
  for i = 1, 4 do
    rolls[i] = math.random(6)
  end
  return rolls
end

local function modifier(input)
  return math.floor((input - 10) / 2)
end

local Character = {}
function Character:new(name)
  local strength = ability(roll_dice())
  local dexterity = ability(roll_dice())
  local constitution = ability(roll_dice())
  local intelligence = ability(roll_dice())
  local wisdom = ability(roll_dice())
  local charisma = ability(roll_dice())
  local hitpoints = 10 + modifier(constitution)
  return {
    name = name,
    strength = strength,
    dexterity = dexterity,
    constitution = constitution,
    intelligence = intelligence,
    wisdom = wisdom,
    charisma = charisma,
    hitpoints = hitpoints
  }
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
