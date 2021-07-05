/// @description ?
for (var i = 0; i < instance_number(par_monster); i++)
{
	monsters[i] = instance_find(par_monster,i);
}
show_debug_message(string(monsters));