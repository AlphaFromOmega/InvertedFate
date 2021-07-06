/// @function scr_create_textbox(message, text_speed, sprite, voice);

function scr_create_textbox(_message, _speed)
{
	var _sprite = (argument_count > 2) ? argument[2] : noone;
	var _voice = (argument_count > 3) ? argument[3] : noone;
	
	var _obj;
	if (instance_exists(obj_textbox))
	{
		_obj = obj_textbox_queue;
	}
	else
	{
		_obj = obj_textbox;
	}
	with (instance_create_depth(0, 0, 0, _obj))
	{
		//if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		change = _speed;
		voice = _voice;
		head = _sprite;
		offset_spr = sprite_exists(_sprite) ? 144 : 0; 
		str = convert_string(_message, GUI_TEXTBOX_WIDTH - (offset_spr + GUI_MARGIN*4));
	}
}