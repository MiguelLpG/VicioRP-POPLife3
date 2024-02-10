/*
	File: fn_drugUsed.sqf
	Author: John "Paratus" VanderZwet / cptjames32
	
	Description:
	Took things a little too far!
*/

_item = _this select 0;

_index = switch (_item) do
{
	case "pop_cannabis_i": { 0 };
	case "pop_cannabis_i": { 0 };
	case "pop_coca_b": { 1 };
	case "pop_opio_b": { 2 };
	case "meth": { 3 };
	case "pop_meta_b": { 4 };
};

_addInc = switch (_item) do
{
	case "pop_cannabis_i": { 0.03 };
	case "pop_cannabis_i": { 0.05 };
	case "pop_coca_b": { 0.1 };
	case "pop_opio_b": { 0.1 };
	case "meth": { 0.3 };
	case "pop_meta_b": { 0.5 };
};

_add = life_addiction select _index;
if (_add > 0.9) then { life_drug_withdrawl = false; };
_add = _add + _addInc;
if (_add > 1) then { _add = 1; };
life_addiction set [_index, _add];
life_used_drug set [_index, time];

if (life_drug_level > 0.9) then
{
	_od = random 1;
	if (_od > 0.6) then { [] spawn ica_fnc_overdose; };
};