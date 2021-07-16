/// @description ?
var c_origin_x = camera_get_view_width(view_camera[0])/2;
var c_origin_y = camera_get_view_height(view_camera[0])/2;

x = clamp(obj_chara.x, c_origin_x * 2, room_width - c_origin_x);
y = clamp(obj_chara.y, c_origin_y * 2, room_height - c_origin_y);

camera_set_view_pos(view_camera[0], x, y);