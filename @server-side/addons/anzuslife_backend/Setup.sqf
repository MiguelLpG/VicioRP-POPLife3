#include "\life_server\script_macros.hpp"
_AnzusLife_CString = {
    params["_in"];
    _out = "";
    if(typeName _in == "CODE") then {
        _str = str(_in);
        _out = _str select [1, (count(_str)-2)];
    };
    if(typeName _in == "STRING") then {
        _out = _in;
    };
    _out
};
AnzusLife_CString = compileFinal ([_AnzusLife_CString] call _AnzusLife_CString);

_AnzusLife_CFunction = {
    params["_in"];
    _code = compileFinal ([_in] call AnzusLife_CString);
    _code
};
AnzusLife_CFunction = [_AnzusLife_CFunction] call _AnzusLife_CFunction;

AnzusLife_ClientCompile = { 
  params [["_FuncName","",[""]],["_Function",{},[{}]],["_Fianl",true,[true]]];

  if (_Fianl isEqualTo false) then {
    _compile = format["%1 = %2;",_FuncName,_Function];
    call compile _compile;
  } else {
    _compile = format["%1 = [%2] call AnzusLife_CFunction;",_FuncName,_Function];
    call compile _compile;
  };

  diag_log format["Compiled Client Function %1",_FuncName];
  publicvariable _FuncName;
};

AnzusLife_ServerCompile = {
  params [["_FuncName","",[""]],["_Function",{},[{}]],["_Fianl",true,[true]]];

  if (_Fianl isEqualTo false) then {
    _compile = format["%1 = %2;",_FuncName,_Function];
    call compile _compile;
  } else {
    _compile = format["%1 = [%2] call AnzusLife_CFunction;",_FuncName,_Function];
    call compile _compile;
  };

  diag_log format["Compiled Server Function %1",_FuncName];
};


/* Server Lotto Tickets Array */
Tickets = [];

AnzusLife_MafiaTasks = [
  ["Armed Detainment","Take a player hostage","",1],
  ["Defunding the Cartel","Rob the federal reserve successfully and strip the cartel of their money flow","",1],
  ["Breaking and Entering","Successfully break into 20 houses around metropolis","AnzusLife_HousesRobbed",20],
  ["Wired","Gather and process 400 heroin","AnzusLife_HeroinProcessed",400],
  ["Boosting the Blue","Successfully chopshop 10 vehicles","AnzusLife_ChoppedVehicles",10],
  ["Breaking Free","Get put in jail, and manage to escape successfully","",1]
];

AnzusLife_CartelTasks = [
  ["Ganja Gathering","Gather and process 400 marijuana","AnzusLife_MarijuanaProcessed",400],
  ["Kings of Cocaine","Gather and process 500 cocaine","AnzusLife_CocaineProcessed",500],
  ["Defunding the Mafia","Rob the bank of metropolis and strip the mafia of their funding","",1],
  ["High Voltage","Successfully take a police officer hostage and obtain a tazer, then use it on them","",1],
  ["Armed Robbery","Successfully rob 20 gas stations around metropolis","AnzusLife_GasRobberys",20],
  ["Breaking Free","Get put in jail, and manage to escape successfully","",1]
];

_funcs = [
  "\AnzusLife_Backend\Functions\Anticheat.sqf",
  "\AnzusLife_Backend\Functions\Init.sqf",
  "\AnzusLife_Backend\Functions\Civilian.sqf",
  "\AnzusLife_Backend\Functions\Gangs.sqf",
  "\AnzusLife_Backend\Functions\Misc.sqf",
  "\AnzusLife_Backend\Functions\Interaction.sqf",
  "\AnzusLife_Backend\Functions\Mining.sqf",
  "\AnzusLife_Backend\Functions\Housing.sqf",
  "\AnzusLife_Backend\Functions\Jobs.sqf",
  "\AnzusLife_Backend\Functions\Libary.sqf",
  "\AnzusLife_Backend\Functions\VIP.sqf",
  "\AnzusLife_Backend\Functions\EmergencyFactions.sqf",
  "\AnzusLife_Backend\Functions\EventHandlers.sqf",
  "\AnzusLife_Backend\Functions\Jail.sqf",
  "\AnzusLife_Backend\Functions\Police.sqf",
  "\AnzusLife_Backend\Functions\Transport.sqf"
];

{
  call compileFinal preprocessfile _x;
} foreach _funcs;

["AnzusLife_Nil",{
  AnzusLife_CString = nil;
  AnzusLife_CFunction = nil;
  AnzusLife_ClientCompile = nil;
  AnzusLife_ServerCompile = nil;
  AnzusLife_Nil = nil;
},false] call AnzusLife_ServerCompile;

["itemAdd", ["SpawnRocks_Loop", {[] call AnzusLife_SpawnRocks;}, 900, "seconds"]] call BIS_fnc_loop;
["itemAdd", ["LottoTickets_Loop", {[] call AnzusLife_LottoTickets;}, 1800, "seconds"]] call BIS_fnc_loop;

_weaponTransport = MAIN_SETTINGS("Events","WeaponTransport");
if (getNumber(_weaponTransport >> "enable_weaponTransport") isEqualTo 1) then {
  ["itemAdd", ["TransportTruck_Loop", {[] call AnzusLife_SpawnTransport;}, 5400, "seconds"]] call BIS_fnc_loop;
};

[] call AnzusLife_SpawnRocks;
call AnzusLife_InitServer;