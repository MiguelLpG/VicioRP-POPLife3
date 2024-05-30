// ["hudini"] spawn ica_fnc_hudini;

/* POR QUICK*/

if (("for" call ica_fnc_expToLevel) <= 6) exitWith {
            titleText["No sabes quitarte las esposas ...", "PLAIN"];
};

_param = _this select 0;
_unit = player;
_esposado = _unit getVariable "restrained";


if !(_esposado)exitWith{
hint "No estás esposado";
};

if (!isNil {hudini}) exitWith {hint "Solo puedes quitarte las esposas cada 5 minutos." };
["menu", 0.9, "houdini"] spawn ica_fnc_ganzua;
