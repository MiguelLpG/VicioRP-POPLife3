	if(dialog) exitWith {systemChat "[Villas FactionSystems Error] Open dialog detected."};
	if ((call life_coplevel) < 0) exitWith {hint "No eres policía..."; closeDialog 0;};
	createDialog "entrarServicio";
	_display = findDisplay 8000;
	_list = _display displayCtrl 8004;

	_controls = allControls (_display); // Efecto al abrir el dialog
	{
		_x ctrlSetFade 1; 
		_x ctrlCommit 0;
		_x ctrlSetFade 0;
		_x ctrlCommit 1;
	} forEach _controls;

	(_display displayCtrl 1000) ctrlSetStructuredText parseText format ["<t align = 'center' size='1.7' shadow='0' font='RobotoCondensedBold' color='#0f0f23'>%1</t>","Policia"];
	(_display displayCtrl 8001) ctrlSetText "fotos\policia\policias.paa";

	if(isNil {PoliON}) then {PoliON = 0};	
	if (PoliON isEqualTo 0) then {_list lbAdd "No hay policias de servicio"};
	if (PoliON >= 1) then {_list lbAdd "Policias de Servicio"};
	{
		_nombre = name _x;
		if ((side _x) isEqualTo west) then {
			_list lbAdd format["%1",_nombre];
		};
	} foreach playableUnits;

	(_display displayCtrl 8002) buttonSetAction "if (deServicioMed = 1) exitwith {hint ""No puedes estar de EMS a la vez."";};if !(player getvariable ""PoliON"") then {PoliON = PoliON + 1; publicvariable ""PoliON"";};[""joinCop""] spawn ica_fnc_initFactions; closeDialog 0;";
	(_display displayCtrl 8003) buttonSetAction "if (player getvariable ""PoliON"")then {PoliON = PoliON - 1; publicvariable ""PoliON"";}; [""salir""] spawn ica_fnc_entrarServicio; closeDialog 0;";