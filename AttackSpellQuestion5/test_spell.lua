local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)


local MY_AREA = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 1, 0, 1, 0, 1, 0},
	{1, 0, 1, 3, 1, 0, 1},
	{0, 1, 0, 1, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 0, 0}
}

local SMALLER_AREA = {
	{0, 0, 1, 0, 0},
	{0, 1, 1, 1, 0},
	{1, 1, 2, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0},
}
combat:setArea(createCombatArea(SMALLER_AREA))


function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 1.2) + 7
    local max = (level / 5) + (magicLevel * 2) + 12
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    for i = 1, 10 do
        addEvent(function()
			local player = Player(creature:getId())
            combat:execute(player, variant)
        end, 1000 * (i - 1))
    end
end
