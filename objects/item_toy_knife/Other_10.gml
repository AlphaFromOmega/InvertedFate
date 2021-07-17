/// @description ?

// Inherit the parent event
event_inherited();

global.item_at = 3;
global.weapon_name = item_name;

global.weapon_style = WEAPON_STYLE.SINGLE;
global.weapon_amount = 1;
if (instance_exists(obj_battle))
{
	BATTLE.atk = global.at + global.item_at + BASE_ATK;
}