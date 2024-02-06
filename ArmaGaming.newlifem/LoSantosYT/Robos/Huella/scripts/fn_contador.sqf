/*
    File: fn_contador.sqf
    Author: LoSantosYT
    Description:
	Timer
*/
_hackeo  = missionNamespace getVariable "Hackeando";

timer = 300; //5 min
while {0 <= timer } do {
    
    _min = floor (timer/60); // Calcular min
    _s = timer - (_min*60); //Calcular s

    _text = ""; //Formar el texto que se vera
    if (_s < 10) then {
        _text = "0" + (str (_min)) + ":" +"0" + (str(_s));
    } else {
        _text = "0" + (str (_min)) + ":" + (str(_s));
    }; 
    //Cambia el texto
    ctrlSetText [1000,_text]; 
    //Resta 1s
    timer = timer -1;
    sleep 1;
};
if (_hackeo != name player) then{
    closeDialog 0;
    createDialog "finalizar";
    [false,"codeCracker",1,"codeCracker"] call ANZUS_fnc_handleInv;
    ctrlSetText [1236,'\ArmaGamingCore\LoSantosYT\huella\failed.jpg'];

    sleep 1;
    closeDialog 0;

    missionNamespace setVariable ["Hackeando", "Vacio", true];
};