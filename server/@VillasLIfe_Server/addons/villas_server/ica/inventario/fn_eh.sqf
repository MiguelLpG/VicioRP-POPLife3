
/*
por: Icaruk
	
*/

player addEventHandler ["Put", {_this call ica_fnc_pongoItem}];

ica_fnc_dblClick = {
	_idc = ctrlIDC (_this select 0);
	_selectedIndex = _this select 1;
	_data = format ["%1",lbData [_idc, _selectedIndex]];
	_text = format ["%1",lbText [_idc, _selectedIndex]];
	_value = format ["%1",lbValue [_idc, _selectedIndex]];

	[_data, _text] call ica_fnc_usoItemFis;
	
	false
};
while {true} do {
	waituntil {!(isnull (findDisplay 602))}; // espero a que se abra
	((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // uniforme
	((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // chaleco
	((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // mochila
	// ((findDisplay 602) displayCtrl 640) ctrlSetEventHandler ["LBDblClick", "_this call ica_fnc_dblClick"]; // suelo
	waituntil {isnull (findDisplay 602)}; // espero a que se cierre
};