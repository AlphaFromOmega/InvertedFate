//@function name(values)
function scr_controls()
{
	hdir = keyboard_check(vk_right) - keyboard_check(vk_left);
	vdir = keyboard_check(vk_down) - keyboard_check(vk_up);
}