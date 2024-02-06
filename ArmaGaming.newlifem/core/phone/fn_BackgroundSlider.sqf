if (AnzusLife_Phone_CurrentlyOpen !=  "AnzusLife_ChangeBackground") exitWith {};

while {!(AnzusLife_Phone_BackgroundControlMouseup)} do {
	private _left = 0.368 * safezoneW + safezoneX;
	private _right = _left + (0.261937 * safezoneW);
	private _top = 0.273 * safezoneH + safezoneY;
	private _bottom = (_top + (0.4532 * safezoneH));
	private _lastControl = AnzusLife_Phone_BackgroundControls select ((count AnzusLife_Phone_BackgroundControls) - 1);
	(ctrlPosition _lastControl) params ['','_lastControlTop','',''];
	private _firstControl = AnzusLife_Phone_BackgroundControls select 0;
	(ctrlPosition _firstControl) params ['','_firstControlTop','','_firstControlHeight'];
	private _firstControlBottom = (_firstControlTop + _firstControlHeight);
	getMousePosition params ["_mouseX","_mouseY"];
	sleep 0.01;
	if (((getMousePosition select 0) > _right) || ((getMousePosition select 0) < _left)) exitWith {};
	private _difference = ((getMousePosition) select 1) - _mouseY;
	if !(((_lastControlTop <= 0) && (_difference < 0)) || ((_firstControlBottom >= (_bottom - 0.09)) && (_difference > 0))) then {
		{
		private _pos = (ctrlPosition _x);
		_shiftedPosition = (_pos select 1) + _difference;
		_pos set [1,_shiftedPosition];
		(AnzusLife_Phone_BackgroundControlsButtons select _forEachIndex) ctrlSetPosition _pos;
		(AnzusLife_Phone_BackgroundControlsButtons select _forEachIndex) ctrlCommit 0;
		_x ctrlsetposition _pos;
		_x ctrlCommit 0;
		} forEach AnzusLife_Phone_BackgroundControls;
	};

	private _handle = [_lastControlTop,_difference,_firstControlBottom,_bottom] spawn {

		params ["_lastControlTop","_difference","_firstControlBottom","_bottom"];
		
		if ((_lastControlTop <= 0) && (_difference < 0)) then {
		private _lastControl = AnzusLife_Phone_BackgroundControls select ((count AnzusLife_Phone_BackgroundControls) - 1);
		(ctrlPosition _lastControl) params ['','_lastControlTop','',''];
			{
				private _difference = (0 - _lastControlTop);
				_pos = ctrlPosition _x;
				_pos params ["","_y"];
				_pos set [1,_y + _difference];
				_x ctrlsetPosition _pos;
				_x ctrlCommit 0;
			} forEach AnzusLife_Phone_BackgroundControls;
		};

		if ((_firstControlBottom >= (_bottom - 0.09)) && (_difference > 0)) then {
			private _firstControl = AnzusLife_Phone_BackgroundControls select 0;
			(ctrlPosition _firstControl) params ['','_firstControlTop','','_firstControlHeight'];
			private _firstControlBottom = (_firstControlTop + _firstControlHeight);
			{
				private _difference = (_firstControlBottom - (_bottom - 0.09));
				_pos = ctrlPosition _x;
				_pos params ["","_y"];
				_pos set [1,_y - _difference];
				_x ctrlsetPosition _pos;
				_x ctrlCommit 0;
			} forEach AnzusLife_Phone_BackgroundControls
		};
	};
};