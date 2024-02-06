/*
    File: initServer.sqf
    Author:

    Description:
    Starts the initialization of the server.
*/
if (!(_this select 0)) exitWith {}; //Not server

[] call compile preprocessFile "\AnzusLife_Server\init.sqf";
missionNamespace setVariable ["AnzusLife_MajorCrime",time,true];
missionNamespace setVariable ["AnzusLife_StartTime",time,true];

missionNamespace setVariable ["RobosEnCurso", 0, true];
missionNamespace setVariable ["Hackeando", "Vacio", true];