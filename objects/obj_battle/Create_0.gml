/// @description Insert description here
// You can write your code in this editor

t_atk = 0; // Temporary stat buffs and penalties.
t_def = 0;

end_room = global.lastroom;

attack = false;

button_seperation = (display_get_gui_width() - (sprite_get_width(spr_ui_battle_act) * 4 + GUI_BATTLE_MARGIN_W * 2)) / 3;

textbox_x1 = GUI_BATTLE_MARGIN_W;
textbox_y1 = display_get_gui_height() / 2 + 8;
textbox_x2 = display_get_gui_width() - GUI_BATTLE_MARGIN_W;
textbox_y2 = display_get_gui_height() / 2 + 150;

instance_create_depth(0, 0, depth + 1, obj_bulletboard);

barmake = 0;

lerp_prog = 0;

BB.destined_x1 = textbox_x1;
BB.destined_y1 = textbox_y1;
BB.destined_x2 = textbox_x2;
BB.destined_y2 = textbox_y2;

BB.ui9slice_x1 = display_get_gui_width() / 2;
BB.ui9slice_y1 = textbox_y1;
BB.ui9slice_x2 = display_get_gui_width() / 2;
BB.ui9slice_y2 = textbox_y2;

button[3] = spr_ui_battle_mercy;
button[2] = spr_ui_battle_item;
button[1] = spr_ui_battle_act;
button[0] = spr_ui_battle_fight;

selected_button = 0;
selected_option = 0;
selected_act = 0;

text_page = 0;

display_length = 0;
target = noone;

instance_create_depth(0, 0, depth-1, obj_soul);

infobar_bottom = (display_get_gui_height() - (sprite_get_height(button[0]) + GUI_BATTLE_MARGIN_H));
infobar_health = display_get_gui_width()/2 - 45;

xp_earned = 0;
gold_earned = 0;

win_text = "ah shit something fucked up";

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

textbox_width = (textbox_x2 + GUI_MARGIN * 1.25) - (textbox_x1 + GUI_MARGIN * 1.25) - 32;

change_music(music); // Adjusts music

typewriter_init(); // Enables Typewriter Variables
print = []; // Print result
turn = 0; // Turn number (primarily used for flavour text)
str = string_to_array(convert_string(script_execute(flavour_script), textbox_width));

mercy[0] = string_to_array(convert_string(S_WHITE + "Spare", textbox_width));
mercy[1] = string_to_array(convert_string(S_WHITE + "Flee", textbox_width));

flee_text[0] = S_WHITE + "I'm outta here.";
flee_text[1] = S_WHITE + "Don't slow me down.";
flee_text[2] = S_WHITE + "I've got better to do.";

hierarchy = 0;
set_hierarchy(HIERARCHY.ACTION_BUTTONS);

empty = string_to_array(convert_string(S_GRAY + "[EMPTY]", 256));

dead = false;