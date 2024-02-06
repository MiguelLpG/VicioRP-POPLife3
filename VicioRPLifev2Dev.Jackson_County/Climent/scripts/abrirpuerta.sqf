

if (side player != CIVILIAN) exitwith {hint "Tu ya tienes tus llaves";closeDialog 0;};
if (!abrir_puertas_temp) exitWith {hint "Como vas a abrir la puerta sin las claves , eres tonto o q ?"};

if (abrir_puertas_temp) exitWith {
{  
    if (_x animationPhase "GateDoor_3" == 0) then {  
    _x animate ["GateDoor_3", 5];  
	}  
    else  
    {  
    hint ""; 
	};  
} forEach (nearestObjects [player, ["Land_Gate_C"], 1000]); 

//abrir_puertas_temp = nil;
sleep 600;

{  
 if (_x animationPhase "GateDoor_3" == 5) then {  
  _x animate ["GateDoor_3", 0];  
 }  
 else  
 {  
  _x animate ["GateDoor_3", 5];  
 };  
 } forEach (nearestObjects [player, ["Land_Gate_C"], 100]);
};