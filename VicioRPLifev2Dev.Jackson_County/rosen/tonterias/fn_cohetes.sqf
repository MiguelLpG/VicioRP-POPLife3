/* Rosen init fuegos artificiales */

_param = param[0];
{nul = [_param,300] execvm "ALfireworks\alias_fireworks.sqf"} remoteExec ["BIS_fnc_spawn",-2,true];
sleep 2;
{nul = [_param,300] execvm "ALfireworks\alias_fireworks.sqf"} remoteExec ["BIS_fnc_spawn",-2,true];
sleep 2;
{nul = [_param,300] execvm "ALfireworks\alias_fireworks.sqf"} remoteExec ["BIS_fnc_spawn",-2,true];