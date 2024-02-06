
/*
por: Medel
*/

_param = param [0];

_npc = Farmacia;
if (_param isEqualTo "Init") exitWith {
    
    _npc addAction
    [
        "<t color=""#DE2828"">" + "Robar Farmacia",
        {
            ["Robo"] spawn ica_fnc_robofarmacia;
        },
        [],
        1.5,
        true,
        true,
        "",
        "(playerside isEqualTo civilian)",
        5,
        false,
        "",
        ""
    ];
};

if (_param isEqualTo "Robo") exitWith {

    ["add",_npc] call ica_fnc_check;
    
    if !(Check) exitWith {};

    _npc switchMove "AmovPercMstpSsurWnonDnon";

    [10,"Alarma - Robo",[1,0,0,1],2,("Están robando la Farmacia"),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",west];

    _Pos = position player;
    _MarkerN = format ["%1_Marker",[_npc] call BIS_fnc_objectVar];
    _MarkerT = "!ATENCIÓN! Están Robando la Farmacia";
    _marker = createMarker [_MarkerN, _Pos];
    _MarkerN setMarkerColor "ColorRed";
    _MarkerN setMarkerText _MarkerT;
    _MarkerN setMarkerType "mil_warning";
 
    _tF = 60 * 3;
    _t = 0;
    _s = 0;
    _m = 0;
    _sF = 0;
    _mF = 3;
    _metros = 10;
    _fuera = false;
    while {!(_tF <= 0)} do {
       
        if (((player distance _npc) > _metros) or !(alive player)) exitWith {
        hint parseText  
 
        "<t size = ""2"" color=""#DE2828"" align='center'>AVISO <br/>
        <t size = ""1"" color=""#21618C"" align='left'>Buen intento pero te has alejado demasiado de la zona.</t></t>";

            _fuera = true;
        };
 
        if (_s isEqualTo 59) then {
            _s = 0;
            _m = _m + 1;
        } else{
            _s = _s + 1;
 
        };

    hintSilent parseText format ["<t size = ""2"" color=""#DE2828"" align='center' >Robo a Farmacia<br/>
        <t size = ""1.2"" color=""#21618C"" align='left'>          Tiempo: <t size = ""1.2"" color=""#17A589"" align='left'>%1:%2/%3:%4 <t size = ""1.2"" color=""#21618C"" align='left'>minutos <br/> 
        <t size = ""1.2"" color=""#21618C"" align='left'>     Distancia:<t size = ""1.2"" color=""#17A589"" align='left'> %5/%6 <t size = ""1.2"" color=""#21618C"" align='left'>metros</t></t></t></t></t></t></t>",_m,_s,_mF,_sF,round (player distance _npc),_metros];
        _tF = _tF - 1;
        sleep 1;
    };

    _npc switchMove "";
    deleteMarker _MarkerN;

    ["farmacia",_npc] remoteexec ["ica_fnc_check", 2];

    if (_fuera) exitWith {};

    _polisOn = {side _x == WEST} count playableUnits;

    _din = (80000 + (1000 * _polisOn));
    vicio_din = _din + vicio_din;
    hint format ["En el Robo a la Farmacia se ha obtenido %1€ ",_din];
};
