params ["_robo"];
_RobosEnCurso = missionNamespace getVariable "RobosEnCurso";

if (_RobosEnCurso <= 2 ) then {
	switch (_robo) do 
	{
		case "huella": {[] call lsyt_fnc_huella;}; break;
		case "taladro": {[] call lsyt_fnc_taladro;}; break;
		// case "": {}; ;break;
	};
	
	//  Añadir robo a los que hay en curso
	_RobosEnCurso = _RobosEnCurso + 1;
	missionNamespace setVariable ["RobosEnCurso", _RobosEnCurso, true];

} else {
    hint parseText  
 
    "<t size = ""2"" color=""#DE2828"" align='center'>AVISO <br/>
    <t size = ""1"" color=""#21618C"" align='left'>Ya hay demasiados robos en curso, Espera que finalicen algunos</t></t> 
    ";
};

