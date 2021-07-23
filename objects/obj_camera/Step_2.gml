/// @description ?

x = clamp(obj_chara.x, c_origin_x, room_width - c_origin_x);
y = clamp(obj_chara.y, c_origin_y, room_height - c_origin_y);

camera_set_view_pos(view_camera[0], x - c_origin_x, y - c_origin_y);