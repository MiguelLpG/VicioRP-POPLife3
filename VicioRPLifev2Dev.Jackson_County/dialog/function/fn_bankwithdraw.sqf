
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > vicio_atmdin) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && vicio_atmdin > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

vicio_din = vicio_din + _val;
vicio_atmdin = vicio_atmdin - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

	["Money Log",format [
	"%1 - (%2) ha sacado %3 del banco (%6)  - Dinero en banco : %4 - Dinero en mano %5",
	profileName,
	(getPlayerUID player),
	_val,
	vicio_atmdin,
	vicio_din,
	mapgridposition player
	]
	] remoteexeccall ["ica_fnc_customlog",2];
