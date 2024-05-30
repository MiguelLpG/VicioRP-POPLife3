/*0 = [] spawn { 
    while{true} do { 
        { 
            if(_x distance (getMarkerPos "civ_gar_1_3") < 60) then {_x allowDamage false} else {_x allowDamage true}; 
        } forEach allUnits + vehicles; 
        sleep 1; 
    }; 
};

/*hint "Has entrado en una zona segura";
player allowdamage false;
*/
//inSafezone = true;nul = [] execVM "Climent\funciones\ezonasec.sqf";*/