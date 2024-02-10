
// ***********************************************************
// PoP Police framework by Blakord
// Solicitar valores de variables remotas a otros jugadores
// ***********************************************************

// _ReqHandler = ["varRequest","vicio_din",jugadorObj] call ica_fnc_bkRemoteRequest;
// waitUntil { scriptDone _ReqHandler };
// _Result = MyRemoteRequest;

private ["_remoteMode","_verRequest","_callTarget","_callBack","_startTime","_goReturn"];

_remoteMode 	= param[0];
_verRequest  	= param[1];
_callTarget  	= param[2];

MyRemoteRequest = nil ;
_startTime = time ;

If ( _remoteMode == "varRequest" ) Then {
	[["varPetition",_verRequest,player],"ica_fnc_bkRemoteRequest",_callTarget,false,true] call BIS_fnc_MP;
	//["varPetition",_verRequest,player] remoteExecCall ["ica_fnc_bkRemoteRequest", _callTarget, false];
	waitUntil { !(isNil "MyRemoteRequest") or time >= _startTime + 5 };
	//MyRemoteRequest
};

If ( _remoteMode == "varPetition" ) Then {
	_goReturn = call compile _verRequest;
	[["varReturn",_goReturn,player],"ica_fnc_bkRemoteRequest",_callTarget,false,true] call BIS_fnc_MP;
	//hint str compile "a = b";
	//Result: {a=b}
};

If ( _remoteMode == "varReturn" ) Then {
	MyRemoteRequest = _verRequest;
};