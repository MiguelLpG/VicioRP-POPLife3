#include "script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 4) exitWith {
	
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

{  
    if (_x animationPhase "portail_anim" == 0) then {  
    _x animate ["portail_anim", 1];  									
	}  
    else  
    {  
    _x animate ["portail_anim", 0];   								
	};  
} forEach (nearestObjects [player, ["portail"], 100]);



this addAction ["Conejo",' [] call climent_fnc_conejo;', "", 9,false,true,"",""];