/// @description ?
if (changing_scene)
{
	alpha += 0.003;
	if (lrp < 1)
	{
		lrp += 0.005;
	}
	if (alpha > 1.1)
	{
		file_delete("save.dtr");
		ResetGame();
		global.name = player_name;
		room_goto(rm_ruins_flowey);
	}
}
else
{
	var xmov = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
	var ymov = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	if (done)
	{
		if (lrp < 1)
		{
			lrp += 0.005;
		}
	
		cursor_x += xmov + ymov;	
		if (cursor_x > allowed)
		{
			cursor_x = !changeable;
		}
		if (cursor_x < !changeable)
		{
			cursor_x = allowed;
		}
		if (keyboard_check_pressed(ord("Z")))
		{
			switch (cursor_x)
			{
				case 0:
				{
					done = false;
					cursor_x = 0;
					cursor_y = 0;
					break;
				}
				case 1:
				{
					// goto flowey room
					changing_scene = true;
					audio_play_sound(sfx_revcymbal, 0, false);
					change_music(noone);
					break;
				}
			}
		}
	}
	else
	{
		cursor_x += xmov;
		cursor_y += ymov;

		var hoz_max = (cursor_y == 8) ? 3 : array_length(total_case);

		while (cursor_x > 0 && cursor_y > 0 && cursor_x < 7 && cursor_y < 8 && total_case[cursor_x][cursor_y] == "")
		{
			cursor_x += xmov;
			cursor_y += ymov;
		}

		if (cursor_x < 0)
		{
			cursor_x = hoz_max - 1;
		}
		if (cursor_y < 0)
		{
			cursor_y = 8;
		}
		if (cursor_x >= hoz_max)
		{
			cursor_x = 0;
		}
		if (cursor_y > 8)
		{
			cursor_y = 0;
		}


		while (cursor_x > 0 && cursor_y > 0 && cursor_x < 7 && cursor_y < 8 && total_case[cursor_x][cursor_y] == "")
		{
			cursor_x += xmov;
			cursor_y += ymov;
		}

		if (cursor_y == 8)
		{
			switch(cursor_bottom)
			{
				case 0:
				{
					cursor_x = 0;
					break;
				}
				case 1:
				{
					cursor_x = 2;
					break;
				}
				case 2:
				{
					cursor_x = 5;
					break;
				}
			}
			cursor_bottom += xmov
			if (cursor_bottom < 0)
			{
				cursor_bottom = 2;
			}
			if (cursor_bottom > 2)
			{
				cursor_bottom = 0;
			}
		}
		else
		{
			switch(cursor_x)
			{
				case 0: case 1:
				{
					cursor_bottom = 0;
					break;
				}
				case 2: case 3: case 4:
				{
					cursor_bottom = 1;
					break;
				}
				case 5: case 6:
				{
					cursor_bottom = 2;
					break;
				}
			}
		}

		if (keyboard_check_pressed(ord("Z")))
		{
			if (cursor_y < 8)
			{
				if (string_length(player_name) < 6)
				{
					player_name += total_case[cursor_x][cursor_y];
				}
			}
			else
			{
				switch (cursor_bottom)
				{
					case 0:
					{
						room_goto(rm_titlescreen);
						break;
					}
					case 1:
					{
						player_name = string_delete(player_name, string_length(player_name), 1);
						break;
					}
					case 2:
					{
						changeable = true;
						done = true;
						lrp = 0;
						cursor_x = 0;
						switch (string_lower(player_name))
						{
							// Disallowed Names
							case "":
							{
								text = "You must choose a name.";
								allowed = false;
								break;
							}
							case "alphys":
							{
								text = "C-can you pick a less u-used name.";
								allowed = false;
								break;
							}
							case "asgore":
							{
								text = "You should not, human.";
								allowed = false;
								break;
							}
							case "asriel": case "toriel":
							{
								text = "...";
								allowed = false;
								break;
							}
							case "blooky": case "napsta":
							{
								text = "uh..........\ncan you pick a different name......";
								allowed = false;
								break;
							}
							case "critt":
							{
								text = "DARLING, WHY DON'T YOU\ THINK OF SOMETHING ELSE.";
								allowed = false;
								break;
							}
							case "flowey":
							{
								text = "You should think of something more ORIGINAL.";
								allowed = false;
								break;
							}
							case "sans":
							{
								text = "nah.";
								allowed = false;
								break;
							}
							case "undyne":
							{
								text = "Find your own name, punk!";
								allowed = false;
								break;
							}
						
							// Custom Responses Names
							case "frisk":
							{
								text = "WARNING:This name will make textboxes a living hell \nProceed anyway? \n\n\n\n\n\nWhat expected hard mode?";
								allowed = true;
								break;
							}
							case "aaaaaa":
							{
								text = "Still not very creative...?";
								allowed = true;
								break;
							}
						
							case "zzzzzz":
							{
								text = "Incredibly creative!";
								allowed = true;
								break;
							}
						
							case "aaron":
							{
								text = "Is this name correct? ;)";
								allowed = true;
								break;
							}
						
							case "bratty":
							{
								text = "Like, alright then.";
								allowed = true;
								break;
							}
						
							case "bpants":
							{
								text = "About the closest I'll get to stardom.";
								allowed = true;
								break;
							}
						
							case "catty":
							{
								text = "Bratty! My name is still Bratty!";
								allowed = true;
								break;
							}
						
							case "chara":
							{
								text = "Is this name correct!?!";
								allowed = true;
								break;
							}
						
							default:
							{
								text = "Is this name correct?";
								allowed = true;
								break;
							}
						}
						break;
					}
				}
			}
		}
	}
}