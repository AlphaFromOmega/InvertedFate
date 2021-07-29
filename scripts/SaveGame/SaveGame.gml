///@function name(values)
function SaveGame()
{
	var _save = ds_map_create();
	
	// If objects need to have a state saved put a flag for it in global flags NOT HERE
	
	_save[? "room"] = room;
	_save[? "room_name"] = string(obj_global.saved_name);
	_save[? "time"] = global.time;
	_save[? "charax"] = obj_chara.x;
	_save[? "charay"] = obj_chara.y;
	
	_save[? "name"] = global.name;
	_save[? "xp"] = global.xp;
	_save[? "lv"] = global.lv;
	_save[? "kills"] = global.kills;
	
	_save[? "gold"] = global.gold;
	
	_save[? "weapon"] = global.weapon;
	_save[? "armour"] = global.armour;
	
	var inv;
	for (var i = 0; i < array_length(INVENTORY.items); i++;)
	{
		if (instance_exists(INVENTORY.items[i]))
		{
			inv[i] =INVENTORY.items[i].object_index;
		}
		else
		{
			inv[i] = noone;
		}
	}
	_save[? "inventory"] = inv;
	
	var _flags = ds_map_create();
	ds_map_copy(_flags, global.flags);
	ds_map_add_map(_save, "flags", _flags);
	
	var _string = json_encode(_save);
	SaveEncodedString("save.dtr", _string);
	show_debug_message(_string);
	
	ds_map_destroy(_save);
}

function SaveEncodedString(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}

function LoadGame()
{
	var _file = "save.dtr"
	if (file_exists(_file))
	{
		var _json = LoadEncodedString(_file);
	
		global.name = _json[? "name"];
		global.time = _json[? "time"];
		global.xp = _json[? "xp"];
		global.lv = _json[? "lv"];
		global.kills = _json[? "kills"];
	
		global.gold = _json[? "gold"];
	
		var _weapon = _json[? "weapon"];
		if (_weapon == item_stick || !object_exists(_weapon))
		{
			global.weapon = item_stick;
			global.weapon_name = "Stick";
			global.weapon_style = WEAPON_STYLE.SINGLE;
			global.weapon_amount = 1;
		}
		else
		{
			var _ins_w = instance_create_depth(0, 0, 0, _weapon);
			use_item(_ins_w);
		}
		
		var _armour = _json[? "armour"];
		if (_armour == item_bandage || !object_exists(_armour))
		{
			global.armour = item_bandage;
			global.armour_name = "Bandage";
		}
		else
		{
			var _ins_a = instance_create_depth(0, 0, 0, _armour);
			use_item(_ins_a);
		}
		
		var _inv =_json[? "inventory"];
		show_debug_message(_json[? "inventory"]);
		for (var i = 0; i < array_length(INVENTORY.items); i++;)
		{
			if (object_exists(_inv[| i]))
			{
				INVENTORY.items[i] = instance_create_depth(0, 0, 0, _inv[| i]);
			}
			else
			{
				INVENTORY.items[i] = noone;
			}
		}
		sort_items();
		obj_global.queued_x = _json[? "charax"];
		obj_global.queued_y = _json[? "charay"];
		obj_global.saved_room = _json[? "room"];
		obj_global.saved_name = string(_json[? "room_name"]);
	}
	else
	{
		global.weapon = item_stick;
		global.weapon_name = "Stick";
		global.weapon_style = WEAPON_STYLE.SINGLE;
		global.weapon_amount = 1;

		global.armour = item_bandage;
		global.armour_name = "Bandage";
	}
}

function LoadEncodedString(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	return json_decode(_string);
}

function QuickLoad()
{
	var _file = "save.dtr"
	if (file_exists(_file))
	{
		var _json = LoadEncodedString(_file);
		chara_name = _json[? "name"];
		lv = _json[? "lv"];
		saved_name = _json[? "room_name"];
		time = _json[? "time"];
	}
	else
	{
		chara_name = "EMPTY";
		lv = 0;
		saved_name = "--";
		time = 0;
	}
}
function ResetGame()
{
	global.name = "Chara";

	global.xp = 0;
	global.lv = 1;
	global.gold = 0;

	global.inv = 30;
	global.kills = 0;

	global.weapon = item_stick;
	global.weapon_name = "Stick";
	global.weapon_style = WEAPON_STYLE.SINGLE;
	global.weapon_amount = 1;

	global.armour = item_bandage;
	global.armour_name = "Bandage";

	global.item_at = 0;
	global.item_df = 0;

	global.time = 0;
	
	INVENTORY.items = [noone, noone, noone, noone, noone, noone, noone, noone];
}