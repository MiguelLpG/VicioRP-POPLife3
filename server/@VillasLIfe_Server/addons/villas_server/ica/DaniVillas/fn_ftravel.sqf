/*
	Filename: 		fn_fasttravel.sqf
	Author: 		Kellojo // Editado por Villas & Rosen 
	Description: 	Fast Travel main function - Part of the ETG script collection
*/

_mode = [_this, 0, 0, [0]] call BIS_fnc_param;
_dest = [_this, 1, "", [""]] call BIS_fnc_param;

//Modify these to change the price, travel time and the locations you can travel to
_distPriceMult = 0.2; //(price = distance * _distPriceMult)
_distTimeMultip = 10; //(time = distance * _distTimeMultip)
_Citys = ["A.Lakeside","A.Diablos"];	//These have to be markers!!! - Marker names will be displayed as the name of the location

//lb sel change
if (_mode == 1) exitwith {
	_index = lbCurSel 147413;
	disableSerialization;
	_Parentdisplay_FastTravel = findDisplay 147410;
	_ctrl = _Parentdisplay_FastTravel displayCtrl 147415;
	{
		if ((lbData [147413, _index]) == _x) then {
			_posDest = getMarkerPos _x;
			_ctrl ctrlMapAnimAdd [1, 0.05, _posDest];
			ctrlMapAnimCommit _ctrl;
			_distance = player distance2D _posDest;
			_Price = round (_distance * _distPriceMult);
			_Time = round ((round _distance / 1000) * _distTimeMultip) + 8;
			ctrlSetText [147417,format ["%1 €",_Price]];
			ctrlSetText [147419,format ["%1s",_Time]];
		};
	} forEach _Citys;
};

//setup dialog
if (_mode == 2) exitwith {
	{
		if ((position player distance2D getMarkerPos _x) > 20) then {
			_index = lbAdd [147413,_x];
			lbSetData [147413, _index, _x];
			lbSetCurSel [147413, _index];
		};
	} forEach _Citys;
};

//Travel
if (_mode == 3) exitwith {
	//Check for bad data / abuse of the script						
	if !(vehicle player == player) exitWith {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>POP Aerolineas</t></t></t></t></t></t><br/><br/>El piloto Rosen no te deja entrar el vehiculo al avion, merluzo.";
		hint _txt;
	};
	
	_destPos = getMarkerpos _dest;	
	_damagePlayer = damage player;
	_posPlayer = position player;
	_distance = player distance2D _destPos;
	_waitTime = round ((round _distance / 1000) * _distTimeMultip) - 8;
	_Price = round (_distance * _distPriceMult);
	_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>POP Aerolineas</t></t></t></t></t></t><br/><br/>Despegando en 10 segundos.";
	hint _txt;
	sleep 10;

	//Check for even more abuse...				
	if !(_posPlayer isEqualTo (position player)) exitWith {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>POP Aerolineas</t></t></t></t></t></t><br/><br/>El piloto Rosen te recomienda no moverte durante el trayecto.";
		hint _txt;
	};
	_curDamage = damage player;
	if (!(_damagePlayer >= _curDamage)) exitWith {
		_txt = parseText "<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>POP Aerolineas</t></t></t></t></t></t><br/><br/>Madre mia! Ve a un hospital antes de embarcar!";
		hint _txt;
	};

	//Start travel
	//You can add additional code to remove money etc. here
	if(vicio_din <_Price) exitWith {hint "No tienes suficiente dinero.";};
	vicio_din = vicio_din - _Price;
	
	player allowDamage false;
	showCinemaBorder true;
	
	_camera = "camera" camCreate [position player select 0,position player select 1,3];
	_camera cameraEffect ["internal","back"];
	_camera camSetFOV 0.700;
	_camera camCommit 0;

	//Countdown
	[_waitTime + 8] spawn {
		_countdowntime = _this select 0;
		_countdown = 0;
		33 cutRsc ["FastTravelSystem_Dialog_Countdown","PLAIN"];
		disableSerialization;
		_ctrl = (uiNamespace getVariable "FastTravelCountdownHUD") displayCtrl 147432;
	
		while {_countdowntime > _countdown} do {
			_countdown = _countdown + 1;
			_countdownTimer = _countdowntime - _countdown;
			_ctrl ctrlSetText (format ["%1s",_countdownTimer]);
			sleep 1;
		};
		33 cutText ["", "PLAIN"];
	};

	_camera camSetTarget player;
	_camera camSetRelPos [20,20,350];
	_camera camCommit 4;
	sleep 4;

	//randomposition = [_destPos, 0, 5, 0, 0, 2000, 0] call BIS_fnc_findSafePos;
	player setPos _destPos;

	_camera camSetTarget player;
	_camera camSetRelPos [-15,-18,250];
	_camera camCommit _waitTime;
	sleep _waitTime;

	_camera camSetTarget player;
	_camera camSetRelPos [6,6,3];
	_camera camCommit 4;
	sleep 4;
	playMusic "";

	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	[] spawn {
		sleep 5;
		player allowDamage true;
	};

	//finish
	_txt = parseText (format ["<t shadow='true'><t shadowColor='#ff0000'><t align='center'><t underline='1'><t color='#15FF00'><t size='1.8'>POP Aerolineas</t></t></t></t></t></t><br/><br/>Bienvenido a %1, %2!<br/>El viaje le ha costado %3 €.",_dest,name player,_Price]);
	hint _txt;
};