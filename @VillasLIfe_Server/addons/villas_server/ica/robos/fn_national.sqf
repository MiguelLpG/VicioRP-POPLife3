private["_ladron","_shop","_dinero","_ui","_progress","_pgText","_cP","_rip","_pos","_dineroextra"];

_shop = RoboNationalBank;
_ladron = player;

if(side _ladron != civilian) exitWith {hintSilent "¿Como me estas intentando robar tu?"};
if(_ladron distance _shop > 10) exitWith {hintSilent "No puedo estar a mas de 10 metros!"};
if (RoboNationalBank getVariable ["Robo", false]) exitWith {hintSilent "El robo esta en progreso!"};
if (vehicle player != _ladron) exitWith {hintSilent "No puedo robar si estoy dentro del vehiculo!"};
if (call mafia <= 0 && call terrorista <= 0) exitWith {hint "Necesitas estar en una mafia o tener un grupo terrorista para poder robar esto"}; 
if !(alive _ladron) exitWith {};
if ({alive _x} count (nearestObjects [player, ["man"], 20]) > 1) exitwith {hint "Aleja a tu amigo, esto ya no se puede hacer"};
if (currentWeapon _ladron in ["","pop_linterna","Binocular","Rangefinder","cl_fishing_rod","cl_axe","cl_pick_axeweap","cl_shovel","cl_picket_ftp","cl_picket_mlnw","cl_picket_rtp","pop_linterna"]) exitWith {hint "No me amenaces , fuera de aqui muerto de hambre!"};
_policias = (west countSide playableUnits);
if(_policias < 6) exitWith{hintSilent "Hacen falta 6 policias";};
if ((robosactivos + 1.5) >= 3) exitWith {hint "Hay muchos robos en progreso, espera a que terminen"};
if (RoboNationalBank getVariable ["Robo", false]) exitwith {hint "Ya esta robando tu colega, ayudale"};

_metros_cancelar_robo = 15;
_rip = true;

_dinero = 250000 + round(random 50000);


_chance = random(100);


if(_chance >= 0) then {[1,format["Alarma! - National Bank: %1 Esta siendo robado!", _shop]] remoteExec ["life_fnc_broadcast",west]};
[10,"Robo",[1,0,0,1],2,("Alarma! - National Bank: Esta siendo robado!"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",west];
//"AlarmCar" remoteExec ["playSound",west];
RoboNationalBank setVariable ["Robo", true, true];
[32,RoboNationalBank,1] remoteExec ["ica_fnc_robodesconexion",2];
robosactivos = robosactivos + 1.5;
publicVariable "robosactivos";


disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_cP = 0.01;
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["APERTURA: (%1 %2) Estas a %3 Metros de %4 Metros",round(_cP * 100),"%",round (_distancia),_metros_cancelar_robo];
_progress progressSetPosition 0.01;

if(_rip) then{
	while{true} do {
		uiSleep 1.5;
		_cP = _cP + 0.0093165;

		if (_solo1Vez == 0) then {
			if (_cp > 0.6) then {
			    _solo1Vez = 1;
			};
		};
		_progress progressSetPosition _cP;
		_distancia = _ladron distance _shop;
		_pgText ctrlSetText format["APERTURA: (%1 %2) Estas a %3 Metros de %4 Metros",round(_cP * 100),"%",round (_distancia),_metros_cancelar_robo];


		_Pos = position player;
										_marker = createMarker ["nationalbankss", _Pos];
										"nationalbankss" setMarkerColor "ColorRed";
										"nationalbankss" setMarkerText "!!ATENCION!!Estan Robando aqui!";
										"nationalbankss" setMarkerType "mil_warning";
		if(_cP >= 1) exitWith {};
		if !(alive _ladron) exitWith {deleteMarker "nationalbankss";_rip = false;5 cutText ["","PLAIN"];};
		if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {};

	};

	if((_ladron distance _shop > _metros_cancelar_robo) || (!isPlayer _ladron)) exitWith {deleteMarker "nationalbankss"; hintSilent "Necesitas estar a menos de 15 metros de el dependiente! - El dependiente a bloqueado la caja registradora"; 5 cutText ["","PLAIN"]; _rip = false; };
	_dineroextra = _dinero + (_dinero * 0.25);
	if!(alive _ladron) exitWith {_cp = 1;deleteMarker "nationalbankss";_rip = false;5 cutText ["","PLAIN"];};
	5 cutText ["","PLAIN"];

	titleText[format["Has robado %1 € hasta la proxima",[_dinero] call life_fnc_numberText],"PLAIN"];

	deleteMarker "nationalbankss";
	vicio_din = vicio_din + _dinero;

	[] call life_fnc_hudUpdate;
	_rip = false;
	life_use_atm = false;

	sleep (30 + random(180));

	life_use_atm = true;
	if!(alive _ladron) exitWith {};
	[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};

sleep 10 * 60;
_shop setVariable ["Robo",false,true];

["Dinero",format [
	    "%1 - ha robado %2 (ROBOS)",
	    profileName,
	    _shop
	]
] remoteexeccall ["ica_fnc_customlog",2];