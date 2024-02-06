#include "\life_server\script_macros.hpp"
["AnzusLife_JobMenu",{
  if (!(playerSide isEqualTo civilian)) exitWith {};
  createdialog "AnzusLife_JobMenu";

  {
    _fade = ((findDisplay 7145) displayCtrl _x);
    _fade ctrlSetFade 1; 
    _fade ctrlCommit 0; 
  } forEach [1004,1005,1006,1007,1008,1009,1010];
  
  if(playerSide isEqualTo civilian ) then {
  {
      private _data = [_x select 0,_x select 1,_x select 2];
      private _index = lbAdd [1500,_x select 0];
      lbSetData [1500, _index, str(_data)];
    } foreach AnzusLife_Jobs;
  } else {
    closeDialog 0;
    ["You are on duty, which means you can not get a job from here.",true,"slow"] call ANZUS_fnc_notificationSystem;
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_jobChanged",{
  {
    _fade = ((findDisplay 7145) displayCtrl _x);
    _fade ctrlSetFade 0; 
    _fade ctrlCommit 1.3; 
  } forEach [1004,1005,1006,1007,1008,1009,1010];
  
  _job = AnzusLife_Jobs select (lbCurSel 1500);
  _jobname = _job select 0;
  _description = _job select 1;
  _paycheck = _job select 2;
  
  CONTROL(7145,1005) ctrlSetText format["Paycheck: $%1",_paycheck];
  CONTROL(7145,1010) ctrlSetStructuredText parseText format["<t size='0.9'>%1</t>",_description];
  if (_jobname isEqualTo (player getVariable ["AL_Job","Unemployed"])) then {
	CONTROL(7145,1006) ctrlSetText "Quit Job";
	CONTROL(7145,1006) buttonSetAction "[] call AnzusLife_QuitJob";
  } else {
  	CONTROL(7145,1006) ctrlSetText "Take Job";
  	CONTROL(7145,1006) buttonSetAction "[] call AnzusLife_SetJob";
  };
}] call AnzusLife_ClientCompile;

["AnzusLife_SetJob",{
  if(player getVariable "AL_Job" != "Unemployed") exitWith {["You already have a job. Please quit or sign off your job before getting a new job.",true,"slow"] call ANZUS_fnc_notificationSystem;};
  private _data = call compile format["%1",lbData [1500,(lbCurSel 1500)]];
  player setvariable ["AL_Job",_data select 0,true];
  closeDialog 0;
  AnzusLife_PaycheckAmount = _data select 2;
  [format["You have chosen to be a %1",_data select 0],true,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;

["AnzusLife_QuitJob",{
  player setvariable ["AL_Job","Unemployed",true];
  closeDialog 0;
  AnzusLife_PaycheckAmount = 520;
  ["You have now quit your job!",true,"slow"] call ANZUS_fnc_notificationSystem;
}] call AnzusLife_ClientCompile;