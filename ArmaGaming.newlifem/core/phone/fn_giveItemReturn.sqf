params [
	["_return", "", [""]],
	["_amount", 0, [0]],
	["_item", "", [""]],
	["_player", objNull, [objNull]]
];

	
if (_return isEqualTo "") exitWith {};
if (_item isEqualTo "") exitWith {};
if (_amount isEqualto 0) exitWith {};
if (isNull _player) exitWith {};

switch (_return) do 
{
	case "all" : {
		[format["%1 recived your items.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
	};

	case "some" : {
		[format["%1 didn't have enough space for all of the items, %1 were returned.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
		[true, _item, _amount,"give"] call ANZUS_fnc_handleInv;
	};

	case "none" : {
		[format["%1 didn't have enough space for the items you sent, they have been returned.",name _player, _amount],true,"slow"] call ANZUS_fnc_notificationSystem;
		[true, _item, _amount,"give"] call ANZUS_fnc_handleInv;
	};
};

switch (_item) do { 
    case "keyCard" : { player setVariable ["copLevel",1,true]; }; 
    default { }; 
};

[3] call ANZUS_fnc_updatePartial;
[] call ANZUS_fnc_LoadInventory;