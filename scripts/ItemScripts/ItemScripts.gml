/// @function use_item(item)
function use_item(_item)
{
	var _location = find_item(_item);
	INVENTORY.items[_location] = noone;
	with (_item)
	{
		event_user(0);
	}
}

/// @function find_item(item)
function find_item(_item)
{
	for (var _i = 0; _i < array_length(INVENTORY.items); _i++;)
	{
		if (INVENTORY.items[_i].id == _item.id)
		{
			return _i;
		}
	}
	return noone;
}
