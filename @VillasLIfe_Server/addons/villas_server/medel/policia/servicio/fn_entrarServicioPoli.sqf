_copLvl = (__GETC__(life_coplevel));

// ------- Checks -----
if !(_copLvl > 0) exitWith {"No eres poli"};
if (player getVariable "PoliON") exitWith {"Ya estás de servicio."};

// ----- Asigna variables -----
player setVariable ["PoliON", true]; //Está de servicio
player setVariable ["copWhLvl", _lvl];//Para la tienda
player setVariable ["copLevel",1,true]; //Abrir puertas

// --------- fn_inicio.sqf ----------------

player setVariable ["rank", (__GETC__(life_coplevel)), true];
[] spawn life_fnc_copMarkers;
[] call life_fnc_setupActions;