/*
    File: fn_3dPreviewExit.sqf
    Author: KLM

    Description:
    Handles the cleanup of the 3d preview.
*/
if !(params [["_display", displayNull, [displayNull]]]) exitWith {};

// delete objects
if (!isNull life_3dPreview_object) then {deleteVehicle life_3dPreview_object;};
deleteVehicle life_3dPreview_light;
life_3dPreview_camera cameraEffect ["Terminate", "BACK"];
camDestroy life_3dPreview_camera;

// nil variables
life_3dPreview_position = nil;
life_3dPreview_object = nil;
life_3dPreview_light = nil;
life_3dPreview_camera = nil;
life_3dPreview_camera_mag = nil;
life_3dPreview_camera_zoom = nil;
life_3dPreview_camera_target = nil;
life_3dPreview_dragging = nil;
life_3dPreview_evh_down = nil;
life_3dPreview_evh_up = nil;
life_3dPreview_evh_move = nil;
life_3dPreview_evh_zoom = nil;
