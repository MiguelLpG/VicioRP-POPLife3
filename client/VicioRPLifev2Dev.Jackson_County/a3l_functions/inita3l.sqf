A3L_fnc_serverexec = [
			  
		      "\Core\Server\jailsystem.sqf",
			   "\Core\Network\fn_trafficlights.sqf"
];
A3L_fnc_PVList = [		  
];
{
	private ["_compiled", "_preprocess"];
	_preprocess = preprocessFile (format ["\villas_server\A3L_Functions%1", _x]);
	_compiled   = compile _preprocess;
	[] spawn _compiled;
} foreach A3L_fnc_serverexec;
A3L_fnc_serverexec = Nil;