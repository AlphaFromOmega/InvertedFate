/// @description ?

view_camera[0] = camera_create_view(x, y, 320, 240, 0, object_index, 5, 5, -1, -1);
view_visible[0] = true;

c_origin_x = camera_get_view_width(view_camera[0])/2;
c_origin_y = camera_get_view_height(view_camera[0])/2;