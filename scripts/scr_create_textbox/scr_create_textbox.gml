/// @function scr_create_textbox(message, text_speed, sprite, voice);

function scr_create_textbox(_message, _speed, _sprite, _voice)
{
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
		str = _message;
		//if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		change = _speed;
		voice = _voice
		head = _sprite;
	}
}