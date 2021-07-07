/// @description Insert description here
// You can write your code in this editor
global.battleZ = false;

atk = 120;

button_seperation = (display_get_gui_width() - (sprite_get_width(spr_ui_battle_act) * 4 + GUI_BATTLE_MARGIN_W * 2)) / 3;

textbox_x1 = GUI_BATTLE_MARGIN_W;
textbox_y1 = display_get_gui_height() / 2 + 8;
textbox_x2 = display_get_gui_width() - GUI_BATTLE_MARGIN_W;
textbox_y2 = display_get_gui_height() / 2 + 150;

barmake = 0;

lerp_prog = 0;

destined_x1 = textbox_x1;
destined_y1 = textbox_y1;
destined_x2 = textbox_x2;
destined_y2 = textbox_y2;

ui9slice_x1 = display_get_gui_width() / 2;
ui9slice_y1 = textbox_y1;
ui9slice_x2 = display_get_gui_width() / 2;
ui9slice_y2 = textbox_y2;

button[3] = spr_ui_battle_mercy;
button[2] = spr_ui_battle_item;
button[1] = spr_ui_battle_act;
button[0] = spr_ui_battle_fight;

selected_button = 0;
selected_monster = 0;
selected_act = 0;
current_act_text = [];

text_page=0;

display_length = 0;
target = noone;

instance_create_depth(0, 0, depth-1, obj_soul);

infobar_bottom = (display_get_gui_height() - (sprite_get_height(button[0]) + GUI_BATTLE_MARGIN_H));
infobar_health = display_get_gui_width()/2 - 45;

typewriter_init();
print = [];
str = string_to_array(convert_string(S_WHITE + "You feel like you're going to have a good time", (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25)));

xp_earned = 0;
gold_earned = 0;

win_text = "ah shit something fucked up";

hiearchy = 0;

for (var i = 0; i < 6; i++)
{
	monsters[i] = noone;
	display[i] = noone;
}
draw_type = GUI_DRAW.FLAVOUR_TEXT;
barmake = 20;
spawned = 0;
spawn_max = 6;
for (var i = 0; i < spawn_max; i++)
{
	attack_accuracy[i] = -1;
}

change_music(mus_enemyapproaching);