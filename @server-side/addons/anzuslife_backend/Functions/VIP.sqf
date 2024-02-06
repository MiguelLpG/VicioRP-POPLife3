["AnzusLife_VIPNametagMenu",{
	createDialog "AnzusLife_VIPNametag";
	_getColor = profileNamespace getVariable ["AnzusLife_NametagColor",[1,1,1,1]];

	{
		sliderSetRange [_x,0.2,1];
	} forEach [1903,1904,1905];

	sliderSetPosition [1903,_getColor select 0];
	sliderSetPosition [1904,_getColor select 1];
	sliderSetPosition [1905,_getColor select 2];
	ctrlSetText [1200, format["#(argb,8,8,3)color(%1,%2,%3,1)",_getColor select 0,_getColor select 1,_getColor select 2]];

	buttonSetAction [2400,"_red = sliderPosition 1903; _green = sliderPosition 1904; _blue = sliderPosition 1905; ctrlSetText [1200, format[""#(argb,8,8,3)color(%1,%2,%3,1)"",_red,_green,_blue]]; profileNamespace setVariable [""AnzusLife_NametagColor"",[_red,_green,_blue,1]]; player setVariable [""AnzusLife_NametagColor"",profileNamespace getVariable [""AnzusLife_NametagColor"",[1,1,1,1]],true]; [""Nametag Color Updated!"",true,""slow""] call ANZUS_fnc_notificationSystem; closeDialog 0;"];
}] call AnzusLife_ClientCompile;

["AnzusLife_VIPColorUpdate",{
	disableSerialization;
	_dis = findDisplay 12582;
	if (isNull _dis) exitWith {};
	
	_red = sliderPosition 1903;
	_green = sliderPosition 1904;
	_blue = sliderPosition 1905;
	ctrlSetText [1200, format["#(argb,8,8,3)color(%1,%2,%3,1)",_red,_green,_blue]];
}] call AnzusLife_ClientCompile;