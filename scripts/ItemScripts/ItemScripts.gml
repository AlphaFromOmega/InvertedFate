/// @function use_item(item)
function use_item(_item)
{
	var _location = find_item(_item);
	INVENTORY.items[_location] = noone;
	with (_item)
	{
		event_user(0);
	}
	sort_items();
}

function remove_item(_item)
{
	var _location = find_item(_item);
	INVENTORY.items[_location] = noone;
	with (_item)
	{
		event_user(1);
	}
	sort_items();
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

function sort_items()
{
	var _inv_max = array_length(INVENTORY.items);
	for (var _i = 0; _i < _inv_max; _i++;)
	{
		if (INVENTORY.items[_i] == noone)
		{
			var _n_i = _i;
			while (INVENTORY.items[_n_i] == noone)
			{
				_n_i++;
				if (_n_i >= _inv_max)
				{
					_n_i = _inv_max - 1;
					break;
				}
			}
			INVENTORY.items[_i] = INVENTORY.items[_n_i];
			INVENTORY.items[_n_i] = noone;
			if (_n_i >= _inv_max - 1)
			{
				break;
			}
		}
	}
	for (var _i = 0; _i < _inv_max; _i++;)
	{
		if (INVENTORY.items[_i] == noone)
		{
			break;
		}
		else
		{
			INVENTORY.items[_i].location = _i;
		}
	}
	INVENTORY.item_count = _i;
	show_debug_message(INVENTORY.item_count);
}
