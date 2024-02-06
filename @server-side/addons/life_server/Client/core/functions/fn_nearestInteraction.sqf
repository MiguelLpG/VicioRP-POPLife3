params[["_atm", false], ["_person", false]];

_retObj = cursorObject;
_type = typeOf _retObj;
if (isNull _retObj || (toLower _type find "land" > -1) || _type isEqualTo "") then {
	_objects = ["Land_InfoStand_V1_F"];
	if (_atm) then {
		_objects = ["Land_Atm_02_F","Land_ATM_01_malden_F","Land_ATM_02_malden_F","Land_Mattaust_ATM","TR8_ATM"];
	};
	
	if (_person) then {
		_objects = ["Man"];	
	};
	_nearObjects = (getPos player) nearEntities [_objects, 2];

	if (count _nearObjects > 0) then {
		_retObj = _nearObjects select 0;
	};
};

_retObj;