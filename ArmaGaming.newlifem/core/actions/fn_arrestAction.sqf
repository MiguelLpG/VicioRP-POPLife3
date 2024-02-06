#include "..\..\script_macros.hpp"
    
private["_unit","_id","_time"]; 
params[["_unit", objNull], ["_time", 30], ["_parole", false]];
 
if (isNull _unit) exitWith {};  
if (isNil "_unit") exitWith {}; 
if (!(_unit isKindOf "Man")) exitWith {};   
if (!isPlayer _unit) exitWith {};   
if (!(_unit getVariable "restrained")) exitWith {}; 
if (!((side _unit) in [civilian,independent,east])) exitWith {};    
if (isNull _unit) exitWith {};  

if(_time < 1) exitwith {}; 
if (isNull _unit) exitWith {};  
detach _unit;
    
[_unit,false,_time,player,_parole] remoteExec ["ANZUS_fnc_jail",_unit]; 
["playerJailed"] spawn mav_ttm_fnc_addExp;