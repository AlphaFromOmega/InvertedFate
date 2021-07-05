/// @description ?
view_x = clamp(camera_get_view_x(cam), 0, room_width - camera_get_view_width(cam));
view_y = clamp(camera_get_view_y(cam), 0, room_height - camera_get_view_height(cam));