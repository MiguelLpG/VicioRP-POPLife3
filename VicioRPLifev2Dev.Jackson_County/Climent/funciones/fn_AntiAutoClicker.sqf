/*sleep 1;
ClicksPerSecond = 0; 
lastlogging = 0;  
clickingstarted = false;  
 
(findDisplay 46) displayAddEventHandler ["MouseButtonDown",{ 
_this spawn { 
ClicksPerSecond = ClicksPerSecond + 1; clickingstarted = true;  
if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;};  
uisleep 1; ClicksPerSecond = ClicksPerSecond - 1;  
if(ClicksPerSecond >= 13 && clickingstarted) then {  
  clickingstarted = false; 
      parseText format ["<t size = ""2"" color=""#FF0000"">ATENCIÓN <br/><t size = ""3"" color=""#FFFFFF"">%1<br/><t size = ""1.2"" color=""#0448FF"">Esta usando macros descaradas,<br/> reporta con esto y se aceptará al instante
", name player] remoteExec ["hintSilent",0];  

sleep 0.1;
titleText ["Se te han desactivado los controles","PLAIN"];  
 ClicksPerSecond = 0; 
 disableUserInput true; 
 sleep 10; 
 disableUserInput false; 
 sleep 0.1; 
 titleText ["Pronto te irás ban","PLAIN"]; 
 sleep 1;
 ["Dinero",format [
	"%1 - (%2) le ha saltado el sistema antimacros",
	 name player,
	(getPlayerUID player)
	]
	] remoteexeccall ["ica_fnc_customlog",2];
}; 
if(ClicksPerSecond < 0) then {ClicksPerSecond = 0;};  
}}];*/

/////// NUEVO ANTIMACROS //////

sleep 1;

_Entrada = _this select 0;

Climent_CPS = 0;
Climent_CporTiempo = time + 1;

if (isNil "_Entrada") then {
	_Entrada = "";
};

if (_Entrada == "Bloquear") exitWith {

	Climent_CPS = 0;
	disableUserInput true;
	sleep 10; 
	disableUserInput false;
	

};

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
	
	_controles = _this select 1;
	
	if (_controles == 0) then {
		
		if (Climent_CporTiempo > time) then {
		
			Climent_CPS = Climent_CPS + 1;
		
		};
		
		if (Climent_CporTiempo > time && Climent_CPS >= 15) exitWith {
			
			parseText format ["<t size = ""2"" color=""#FF0000"">ATENCIÓN <br/><t size = ""3"" color=""#FFFFFF"">%1<br/><t size = ""1.2"" color=""#0448FF"">Esta usando macros descaradas,<br/> reporta con esto y se aceptará al instante
			", name player] remoteExec ["hintSilent",0]; 
			["Bloquear"] spawn Climent_fnc_AntiAutoClicker;
			titleText ["Se te han bloqueado los controles","PLAIN"];
		};
		

		if (time >= Climent_CporTiempo) exitWith {
			Climent_CporTiempo = time + 1;
			Climent_CPS = 0;
		};
	
	};
	


}];