/// @description ?
text = ["EXIT", "LANGUAGE", "BUTTON CONFIG", "RESET TO DEFAULT", "BORDER"];
bc_text = ["CONFIRM", "CANCEL", "MENU"];
selected = 0;
button_config = false;

var month = date_get_month(date_current_datetime());

var season = ((month + 1) div 3) % 4;

show_debug_message(season)
switch (season)
{
	case 0:
	{
		change_music(mus_options_winter);
		break;
	}
	case 2:
	{
		change_music(mus_options_summer);
		break;
	}
	default:
	{
		change_music(mus_options_moderate);
		break;
	}
}