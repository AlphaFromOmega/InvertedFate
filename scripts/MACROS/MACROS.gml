//@desc Conatins Macros
#macro WALK_SPEED 2

#macro GUI_TEXTBOX_HEIGHT 142
#macro GUI_TEXTBOX_WIDTH 608

#macro GUI_MARGIN 16
#macro GUI_MARGIN_H 16 + ((display_get_gui_width() - 640)/ 2)

#macro GUI_BATTLE_MARGIN_W 32
#macro GUI_BATTLE_MARGIN_H 8

#macro BATTLE obj_battle


enum GUI_DRAW
{
	NONE,
	FLAVOUR_TEXT,
	MONSTERS,
	METER,
	WIN_TEXT
}

enum HIEARCHY
{
	DISABLED = -1,
	ACTION_BUTTONS = 0,
	UI_BUTTONS = 1,
	BUTTON_ACTION = 2,
	BUTTON_RESULT = 3,
	BATTLE_WON = 4
}

enum BUTTON
{
	FIGHT,
	ACT,
	ITEM,
	MERCY
}


// Colours for text custom
#macro S_AQUA "[$"+string(c_aqua)+"]"
#macro S_BLACK "[$"+string(c_black)+"]"
#macro S_BLUE "[$"+string(c_blue)+"]"
#macro S_DARKGRAY "[$"+string(c_dkgray)+"]"
#macro S_FUCHSIA "[$"+string(c_fuchsia)+"]"
#macro S_GRAY "[$"+string(c_gray)+"]"
#macro S_GREEN "[$"+string(c_green)+"]"
#macro S_LIME "[$"+string(c_lime)+"]"
#macro S_LIGHTGRAY "[$"+string(c_ltgray)+"]"
#macro S_MAROON "[$"+string(c_maroon)+"]"
#macro S_NAVY "[$"+string(c_navy)+"]"
#macro S_OLIVE "[$"+string(c_olive)+"]"
#macro S_ORANGE "[$"+string(c_orange)+"]"
#macro S_PURPLE "[$"+string(c_purple)+"]"
#macro S_RED "[$"+string(c_red)+"]"
#macro S_SILVER "[$"+string(c_silver)+"]"
#macro S_TEAL "[$"+string(c_teal)+"]"
#macro S_WHITE "[$"+string(c_white)+"]"
#macro S_YELLOW "[$"+string(c_yellow)+"]"


#macro FNT_ATTACK global.fnt_attack