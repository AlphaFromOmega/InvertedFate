/// @description ?
image_xscale = 2;
image_yscale = 2;

audio_play_sound(sfx_swipe, 100, false);

attack = 8;

target = BATTLE.target;

var atk_r = global.at + global.item_at + BATTLE.t_atk + BASE_ATK + random(2);
var _damage = 0
for (var i = 0; i < global.weapon_amount; i++)
{
	_damage += BATTLE.attack_accuracy[i];
}
_damage = abs(_damage/global.weapon_amount);
_damage *= max(atk_r - target.defence, 1);

damage = round(_damage);