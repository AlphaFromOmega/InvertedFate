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