// By FuRixX Lamborghini \\

waitUntil {!isNil "life_adminlevel"};
waitUntil {!isNull findDisplay 46};

// Map Teleport
_admin = call life_adminlevel;

if (_admin <= 0) exitWith {player setVariable ["FuRixX_Registro_EsAdmin", 0, true];};

player setVariable ["FuRixX_Registro_EsAdmin", _admin, true];

FuRixX_Funciones_AdminMenu = [

    ["Salir de Admin", 1, "FuRixX_Admin_SistemaLogin", false], // v0.8
    ["Modo sigilo", 1, "FuRixX_Admin_ModoSigilo", false], // v0.1
    ["Curar", 1, "FuRixX_Admin_Curar", true], // v0.1
    ["Comida y bebida", 1, "FuRixX_Admin_ComidaBebida", true], // v0.2
    ["Invisible", 1, "FuRixX_Admin_FuncionesLocales", false], // v0.1
    ["Espectar", 1, "FuRixX_Admin_Espectear", true], // v0.1
    ["Inmortal", 1, "FuRixX_Admin_Inmortal", false], // v0.1
    ["Marcadores", 1, "FuRixX_Admin_Marcadores", false], // v0.1
    ["Ir a él", 1, "FuRixX_Admin_VoyATi", true], // v0.1
    ["Traerlo", 1, "FuRixX_Admin_VenAMi", true], // v0.1
    ["Ver Fondos", 1, "FuRixX_Admin_ObtenerVariablesUsuario", true], // v0.2
    ["Ver Propietarios", 1, "FuRixX_Admin_FuncionesLocales", false], // v0.3

    ["Esposar/Desesposar", 2, "FuRixX_Admin_Esposas", true], // v0.6
    ["Ver Garaje", 2, "FuRixX_Admin_ObtenerVehiculosUsuario", true], // v0.4 - v0.6 (Recuperar coches destruidos)
    ["Reparar vehículo", 2, "FuRixX_Admin_RepararVeh", true], // v0.3
    ["Cachear", 2, "FuRixX_Admin_Cachear", true], // v0.1 - v0.6 (No funcionaba bien)
    ["Nombres 3D", 2, "FuRixX_Admin_Nombres3D", false], // v0.3
    ["Revivir", 2, "FuRixX_Admin_RevivirUsuario", true], // v0.1
    ["Whitelist IC", 2, "FuRixX_fnc_SistemaWhitelistCompleto", false], // v0.1
    ["Congelar", 2, "FuRixX_Admin_Congelar", true], // v0.2
    ["Matar", 2, "FuRixX_Admin_Matar", true], // v0.2
    ["Reparar Cercano", 2, "FuRixX_Admin_RepararCercano", false], // v0.5
    ["Kickear", 2, "FuRixX_Admin_Kickear", true], // v0.4
    ["Dar Items", 2, "FuRixX_Admin_MenuObjetos", true], // v0.4
    ["Objetos Borrados", 2, "FuRixX_Admin_Reconstruir_Menu", false], // v0.5
    
    ["Arsenal", 10, "FuRixX_Admin_FuncionesLocales", false], // v0.2
    ["Vehículos", 10, "FuRixX_Admin_SpawnCoches", false], // v0.3
    ["Quitar Incosciente", 3, "FuRixX_Admin_QuitarInco", true], // v0.5
    ["Ver Casas", 3, "FuRixX_Admin_ObtenerCasas", true], // v0.6
    ["Devolver Muerte", 3, "FuRixX_Admin_MenuMuertes", true], // v0.7

    ["Ejecutar en cliente", 2, "FuRixX_Admin_EjecutarEnCliente", true], // v0.1


    ["Zeus", 10, "FuRixX_Admin_Zeus", false], // v0.1
    ["Lobby", 10, "FuRixX_Admin_FuncionesLocales", false] // v0.2

];

FuRixX_Admin_Fundadores = ["76561198975543222", "76561198424187813", "76561198155575661"];

FuRixX_Admin_SesionIniciada = {

    _ropa = [[],[],[],["U_B_Soldier_VR",[]],[],[],"","",[],["ItemMap","","ItemRadio","ItemCompass","Itemwatch",""]];
    
    _antes = getUnitLoadout player;

    while {player getVariable "FuRixX_Admin_Iniciado"} do {

        if (!(isNull findDisplay 602)) then {

            {
                _x ctrlEnable false;
            } forEach (allControls findDisplay 602);
        };
        
        player allowDamage false;
        player setUnitLoadout _ropa;
        sleep 0.5;

    };

    player setUnitLoadout _antes;
    player allowDamage true;

};

FuRixX_Admin_SistemaLogin = {

    if (getPlayerUID player in FuRixX_Admin_Fundadores) exitWith {hint "Los fundadores no pueden cerrar sesión"};
    _iniciado = player getVariable ["FuRixX_Admin_Iniciado", false];
    _mensaje = "";

    if (_iniciado) then {
        player setVariable ["FuRixX_Admin_Iniciado", false, true];
        _mensaje = "deshabilitado";
    } else {
        player setVariable ["FuRixX_Admin_Iniciado", true, true];
        _mensaje = "habilitado";
        [] spawn FuRixX_Admin_SesionIniciada;
    };

    hint format ["Modo admin %1", _mensaje];
    closeDialog 0;

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **%3** el modo admin.", name player, getPlayerUID player, _mensaje];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_DevolverMuerte = {

    _victima = _this select 0;
    _dialogo = findDisplay 6723;
    _lista = _dialogo displayCtrl 2302;
    _seleccion = lbCurSel _lista;
    _seleccionado = FuRixX_Admin_MuertesVictima select _seleccion;
    _id = _seleccionado select 0;
    _equip = _seleccionado select 2;
    _dinero = _seleccionado select 3;

    _resultado = [format ["¿Seguro que quieres devolver las pérdidas a %1? Saldrá en los logs", name _victima], "Confirmar", true, true] call BIS_fnc_guiMessage;
    if (!_resultado) exitWith {};

    _texto = format ['
    
        hint "El administrador %1 te ha devuelto la muerte %2";
        player setUnitLoadout %3;
        vicio_din = vicio_din + %4;
    
    ', name player, _id, _equip, _dinero];

    _codigoFinal = compile _texto;
    FuRixX_EjecutarEnClienteSV = [getPlayerUID _victima, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **devuelto** la muerte %3 al usuario __%4__ `(%5)`.", name player, getPlayerUID player, _id, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";


};

FuRixX_Admin_MenuMuertes = {

    _victima = _this select 0;
    FuRixX_Admin_MuertesVictima = _victima getVariable ["FuRixX_Muertes_Logs", []];
    _test = FuRixX_Admin_MuertesVictima select 0;

    if (isNil "_test") exitWith {hint "Este usuario no ha muerto o se ha salido del server después de morir"};

    createDialog "FuRixX_MenuVehiculos";
    _dialogo = findDisplay 6723;
    _titulo = _dialogo displayCtrl 2301;
    _titulo2 = _dialogo displayCtrl 7612;
    _lista = _dialogo displayCtrl 2302;
    _boton = _dialogo displayCtrl 2309;

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText format ["Muertes de %1", name _victima];

    _boton ctrlSetText "Devolver";

    {

        _id = _x select 0;
        _tiempo = _x select 1;
        _lista lbAdd format ['Muerte %1', _id, _tiempo];
        
    } forEach FuRixX_Admin_MuertesVictima;

    _boton buttonSetAction format ["[%1] spawn FuRixX_Admin_DevolverMuerte", _victima];
    

};

FuRixX_Admin_ResetearVehiculosUser = {

    _victima = _this select 0;
    _dialogo = findDisplay 6723;
    _lista = _dialogo displayCtrl 2302;
    _seleccion = (lbCurSel _lista) - 1;
    _seleccionado = FuRixX_Admin_VehiculosObtenidos select _seleccion;

    if (isNil "_seleccionado") exitWith {hint "ERROR DESCONOCIDO"};

    _vivo = _seleccionado select 5;

    if (_vivo == 1) exitWith {hint "No se ha podido recuperar este vehículo porque no está destruido"};    

    _id = _seleccionado select 0;
    if (isNil "_id") exitWith {hint "ID NO ENCONTRADA"};
    
    FuRixX_Admin_ActualizarAliveVehiculos  = _id;
    publicVariableServer "FuRixX_Admin_ActualizarAliveVehiculos";

    hint "Vehículo recuperado";
    closeDialog 0;
    [_victima] spawn FuRixX_Admin_ObtenerVehiculosUsuario;

};

FuRixX_Admin_EnviarMSJ = {

    _entrada = _this select 0;
    _modos = ["Todos", "Policia", "EMS"];

    if (isNil "_entrada") then {_entrada = ""};

    if (_entrada == "Enviar") exitWith {

        _dialogo = findDisplay 6723; 
        _lista = _dialogo displayCtrl 2302;
        _control = _dialogo displayCtrl 3422;

        _seleccion = lbCurSel _lista;
        _seleccionado = _modos select _seleccion;

        _mensaje = ctrlText _control;

        if (_mensaje == "") exitWith {hint "Debes escribir algo"};
        if (_mensaje == "Mensaje...") exitWith {hint "Debes escribir algo"};

        _aquien = switch (_seleccionado) do {

            case "Policia": {WEST};
            case "EMS": {Independent};
            default {Civilian};

        };

        if (_aquien == Civilian) then {
            [10,"Administración:",[1,0,0,1],2,_mensaje,[1,1,1,1],1.5] remoteExec ["ica_fnc_anuncio"];
        } else {
            [10,"Administración:",[1,0,0,1],2,_mensaje,[1,1,1,1],1.5] remoteExec ["ica_fnc_anuncio", _aquien];
        };

        hint format ["Mensaje enviado a %1", _seleccionado];
        FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha enviado un mensaje a %3: ```%4```", name player, getPlayerUID player, _seleccionado, _mensaje];
        publicVariableServer "FuRixX_EnviarLogAdmin";

    };

    _mensaje = "";

    createDialog "FuRixX_MenuVehiculos";  
    _dialogo = findDisplay 6723;  
    _titulo = _dialogo displayCtrl 2301;  
    _titulo2 = _dialogo displayCtrl 7612;  
    _lista = _dialogo displayCtrl 2302;  
    _boton = _dialogo displayCtrl 2309;  

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText "Enviar Mensaje A:";
    _boton ctrlSetText "Enviar";

    {

        _lista lbAdd _x;

    } forEach _modos;

    _control = _dialogo ctrlCreate ["RscEdit",3422];  
    _control ctrlSetPosition  [-0.66,0.91,0.36,0.05];  
    _control ctrlSetFont "PuristaBold";  
    _control ctrlSetBackgroundColor [0,0,0,0.5];    
    _control ctrlCommit 0;  
    _control ctrlSetText 'Mensaje...';

    _boton buttonSetAction '["Enviar"] spawn FuRixX_Admin_EnviarMSJ';

};

"FuRixX_Admin_ObtenerCasasCL" addPublicVariableEventHandler {

    FuRixX_Admin_CasasRecibidas = _this select 1;
};

FuRixX_Admin_ObtenerCasas = {

    _victima = _this select 0;
    _entrada = _this select 1;

    if (isNil "_entrada") then {_entrada = ""};

    if (_entrada == "Ir") exitWith {

        _dialogo = findDisplay 6723;
        _lista = _dialogo displayCtrl 2302; 

        _seleccion = lbCurSel _lista;
        _seleccionado = FuRixX_Admin_CasasDelUser select _seleccion;
        _Codigo = format ["player setPos %1", _seleccionado select 2];

        [] call (compile _Codigo);
        hint "Te has teletransportado";

    };

    FuRixX_Admin_CasasRecibidas = [];
    FuRixX_Admin_ObtenerCasasSV = clientOwner;
    publicVariableServer "FuRixX_Admin_ObtenerCasasSV";

    waitUntil{!isNil "FuRixX_Admin_CasasRecibidas"};
    sleep 0.1;
    hint "Información Recibida";
    FuRixX_Admin_CasasDelUser = [];

    _uid = getPlayerUID _victima;
    {

        _uids = _x select 1;
        if (_uid == _uids) then {
            FuRixX_Admin_CasasDelUser pushBack _x;
        };


    } forEach FuRixX_Admin_CasasRecibidas;

    _prueba = FuRixX_Admin_CasasDelUser select 0;

    if (isNil "_prueba") exitWith {hint "Este usuario no tiene casa"};

    createDialog "FuRixX_MenuVehiculos";  
    _dialogo = findDisplay 6723;  
    _titulo = _dialogo displayCtrl 2301;  
    _titulo2 = _dialogo displayCtrl 7612;  
    _lista = _dialogo displayCtrl 2302;  
    _boton = _dialogo displayCtrl 2309;  

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText format ["Casas de %1", name _victima];
    _boton ctrlSetText "Visitar";

    {
        _index = (FuRixX_Admin_CasasDelUser find _x) + 1;
        _format = format ["Casa %1", _index];
        _lista lbAdd _format;

    } forEach FuRixX_Admin_CasasDelUser;

    _boton buttonSetAction format ['[%1, "Ir"] spawn FuRixX_Admin_ObtenerCasas', _victima];

};

FuRixX_Admin_Esposas = {

    _victima = _this select 0;
    _esposado = _victima getVariable["restrained",false];
    _msg = "";

    if (_esposado) then {
        _victima setVariable["restrained",false,true];
        _msg = "desesposado";
        hint format ["Has %2 a %1", name _victima, _msg];
    } else {
        _victima setVariable["restrained",true,true];
        _msg = "esposado";
        hint format ["Has %2 a %1", name _victima, _msg];
        [player] remoteExec ["life_fnc_civRestrain", _victima];
    };


    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **%3** al usuario __%4__ `(%5)`.", name player, getPlayerUID player, _msg, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_QuitarInco = {

    _victima = _this select 0;
    _victima setUnconscious false; 
    _victima switchMove "FXStandDip"; 
    _victima setVariable ["reanimado",false,true]; 
    detach _victima;

    hint format ["Has levantado a %1", name _victima];

    _texto = format ['
    
        hint "El administrador %1 te ha levantado";
    
    ', name player];

    _codigoFinal = compile _texto;
    FuRixX_EjecutarEnClienteSV = [getPlayerUID _victima, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";


    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **levantado** al usuario __%3__ `(%4)` del suelo.", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};


FuRixX_Admin_TodosItems = [
    "pop_coca_b",
    "pop_efedrina_b",
    "pop_opio_b",
    "pop_cannabis_i",
    "pop_cocaina_f",
    "pop_metanfetamina_f",
    "pop_heroina_f",
    "pop_marihuana_f",
    "ToolKit",
    "ItemGPS",
    "Binocular",
    "pop_note",
    "pop_iphone",
    "pop_nokia",
    "pop_armariog",
    "pop_vendas_c",
    "ItemMap",
    "pop_armariop",
    "pop_portatil",
    "cl_axe",
    "cl_pick_axeweap",
    "pop_Ganzua",
    "pop_linterna",
    "cl_picket_rtp",
    "cl_picket_mlnw",
    "cl_picket_ftp",
    "cl_shovel"
];

FuRixX_Admin_MenuObjetos = {

    _victima = _this select 0;
    createDialog "FuRixX_MenuVehiculos";  
    _dialogo = findDisplay 6723;  
    _titulo = _dialogo displayCtrl 2301;  
    _titulo2 = _dialogo displayCtrl 7612;  
    _lista = _dialogo displayCtrl 2302;  
    _boton = _dialogo displayCtrl 2309;  

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText format ["Dar items a %1", name _victima];

    _control = _dialogo ctrlCreate ["RscEdit",3422];  
    _control ctrlSetPosition  [-0.66,0.91,0.36,0.05];  
    _control ctrlSetFont "PuristaBold";  
    _control ctrlSetBackgroundColor [0,0,0,0.5];    
    _control ctrlCommit 0;  
    _control ctrlSetText '1';

    {

        _nombre = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
        if (_nombre == "") then {_nombre = _x};
        _lista lbAdd _nombre;

    } forEach FuRixX_Admin_TodosItems;

    _boton buttonSetAction format ['[%1] spawn FuRixX_Admin_DarObjeto', _victima];

};

FuRixX_Admin_RepararCercano = {

    _cercano = nearestObjects [player, [], 20];
    _reparado = [];

    {

        if (!isPlayer _x) then {

            if (damage _x > 0) then {
                _x setDamage 0;
                _reparado pushBack _x;
            };
        };

    } forEach _cercano;

    hint format ["Has reparado %1 objetos", count _reparado];

};

FuRixX_Admin_DarObjeto = {

    _victima = _this select 0;
    _dialogo = findDisplay 6723;  
    _lista = _dialogo displayCtrl 2302;  

    _cantidad = _dialogo displayCtrl 3422;  
    _puesto = parseNumber (ctrlText _cantidad);

    if (isNil "_puesto") then {_puesto = 1};
    if (_puesto == 0) then {_puesto = 1};

    _seleccion = lbCurSel _lista;
    _seleccionado = FuRixX_Admin_TodosItems select _seleccion;

    for "_i" from 1 to _puesto step 1 do {
        _victima addItem _seleccionado;
    };

    _nombre = getText(configFile >> "CfgMagazines" >> _seleccionado >> "displayName");
    if (_nombre == "") then {_nombre = _seleccionado};

    hint format ["Has dado %1 de %2 a %3", _puesto, _nombre, name _victima];

    _uid = getPlayerUID _victima;

    _texto = format ['
    
        hint "El administrador %1 te ha dado %2 de %3";
    
    ', name player, _puesto, _nombre];

    _codigoFinal = compile _texto;

    FuRixX_EjecutarEnClienteSV = [_uid, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha dado **%3 de %4** al usuario __%5__ `(%6)`", name player, getPlayerUID player, _puesto, _nombre, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_ObtenerVariablesUsuario = {

    _victima = _this select 0;
    FuRixX_Admin_VariablesRecibidas = nil;
    FuRixX_Admin_SolicitarVarCliente_SV = ["Pedir", clientOwner, _victima]; 
    publicVariableServer "FuRixX_Admin_SolicitarVarCliente_SV";
    waitUntil {!isNil "FuRixX_Admin_VariablesRecibidas"};

    _cartera = [FuRixX_Admin_VariablesRecibidas select 0] call FuRixX_Admin_NumeroGrande;
    _banco = [FuRixX_Admin_VariablesRecibidas select 1] call FuRixX_Admin_NumeroGrande;
    hint format ["Fondos de %1:\nCartera: %2€\nBanco: %3€", name _victima, _cartera, _banco];

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **resvisado los fondos** del usuario __%3__ `(%4)`: ```Cartera: %5€``` ```Banco: %6€```", name player, getPlayerUID player, name _victima, getPlayerUID _victima, _cartera, _banco];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_NumeroGrande = {


    _number = [_this,0,0,[0]] call bis_fnc_param;
    _mod = [_this,1,3,[0]] call bis_fnc_param;

    _digits = _number call bis_fnc_numberDigits;
    _digitsCount = count _digits - 1;

    _modBase = _digitsCount % _mod;
    _numberText = "";
    {
        _numberText = _numberText + str _x;
        if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ".";};
    } foreach _digits;
    _numberText

};

FuRixX_Admin_ObtenerVehiculosUsuario = {

    _victima = _this select 0;
    FuRixX_Admin_VehiculosObtenidos = nil;

    FuRixX_AdminObtenerCochesServidor = [_victima, clientOwner];
    publicVariableServer "FuRixX_AdminObtenerCochesServidor";

    waitUntil {!isNil "FuRixX_Admin_VehiculosObtenidos"};

    createDialog "FuRixX_MenuVehiculos";
    _dialogo = findDisplay 6723;
    _titulo = _dialogo displayCtrl 2301;
    _titulo2 = _dialogo displayCtrl 7612;
    _lista = _dialogo displayCtrl 2302;
    _boton = _dialogo displayCtrl 2309;

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText format ["Garaje de %1", name _victima];

    _boton ctrlSetText "Recuperar";
    _boton buttonSetAction format ["[%1] spawn FuRixX_Admin_ResetearVehiculosUser", _victima];

    _lista lbAdd "Nombre - Vivo - Fuera";
    _lista lbSetColor [(lbsize _lista)-1,[1,0.9,0,1]];

    {

        if (count _x > 0) then {
            _classname = _x select 2;

            _vivo = _x select 5;
            _color = [1,1,1,1];
            if (_vivo == 1) then {
                _vivo = "Sí";
                _color = [0,1,0,1];
            } else {
                _vivo = "No";
                _color = [1,0,0,1];
            };

            _fuera = _x select 6;
            if (_fuera == 1) then {
                _fuera = "Sí";
            } else {
                _fuera = "No";
            };

            _nombre = getText(configFile >> "CfgVehicles" >> _classname >> "displayName");
            _lista lbAdd format ["%1 - %2 - %3", _nombre, _vivo, _fuera];
            _lista lbSetColor [(lbsize _lista)-1,_color];

        };


    } forEach FuRixX_Admin_VehiculosObtenidos;

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **resvisado el garaje** del usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";
    
};

"FuRixX_AdminObtenerCochesCliente" addPublicVariableEventHandler {

    FuRixX_Admin_VehiculosObtenidos = _this select 1;

};

FuRixX_Admin_Kickear = {

    _victima = _this select 0;
    FuRixX_Admin_Kickear = [player, _victima];
    publicVariableServer "FuRixX_Admin_Kickear";

};

FuRixX_Admin_SpawnearCoche = {
    
    _dialogo = findDisplay 6723;
    _lista = _dialogo displayCtrl 2302;
    _seleccion = lbCurSel _lista;

    _seleccionado = FuRixX_Admin_CochesMetidos select _seleccion;
    
    _classname = _seleccionado select 0;
    _posicion = getPosATL player;
    hint str _posicion;
    _nombre = getText(configFile >> "CfgVehicles" >> _classname >> "displayName");


    _vehiculo = _classname createVehicle _posicion;
    clearWeaponCargoGlobal _vehiculo;
    clearMagazineCargoGlobal _vehiculo;
    clearBackpackCargoGlobal _vehiculo;
    clearWeaponCargoGlobal _vehiculo;
    clearItemCargoGlobal _vehiculo;

    player moveInDriver _vehiculo;

    hint format ["Has sacado un %1", _nombre];
    closeDialog 0;

    life_vehicles pushBack _vehiculo;

    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` ha **spawneado** un %3', name player, getPlayerUID player, _nombre];
    publicVariableServer "FuRixX_EnviarLogAdmin";
    

};

FuRixX_Admin_SpawnCoches = {


    closeDialog 0;
    createDialog "FuRixX_MenuVehiculos";
    _dialogo = findDisplay 6723;
    _titulo = _dialogo displayCtrl 2301;
    _titulo2 = _dialogo displayCtrl 7612;
    _lista = _dialogo displayCtrl 2302;
    _boton = _dialogo displayCtrl 2309;

    _titulo ctrlSetText "By FuRixX Lamborghini";
    _titulo2 ctrlSetText "Spawn de Vehículos";

    //_TodosLosCoches = "getNumber (_x >> 'scope') >= 2 && configName _x isKindOf 'Car' " configClasses (configFile >> "CfgVehicles") apply {configName _x};
    _TodosLosCoches = [] call FuRixX_Admin_ObtenerCoches;

    FuRixX_Admin_CochesMetidos = [];

    _FuRixX_Admin_NombreCoches = [];

    {

        _tienda = _x;

        {
        
            _nombre = getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
            if (_nombre != "") then {
                _FuRixX_Admin_NombreCoches pushBack [_nombre, _x];
            };
            
        } forEach _tienda;


    } forEach _TodosLosCoches;

    _FuRixX_Admin_NombreCoches = _FuRixX_Admin_NombreCoches call BIS_fnc_sortAlphabetically;
    _TodosLosCoches = [];

    {

        _TodosLosCoches pushBack (_x select 1);

    } forEach _FuRixX_Admin_NombreCoches;

    {
        
        _nombre = getText(configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
        if (_nombre != "") then {
            _lista lbAdd _nombre;
            FuRixX_Admin_CochesMetidos pushBack _x;
        };
            
    } forEach _TodosLosCoches;

    _lista lbSetCurSel 0;
    _boton buttonSetAction "[] spawn FuRixX_Admin_SpawnearCoche";

};

FuRixX_Admin_ObtenerCoches = {

    _tiendas = [
        "dezzie_car",
        "kart_shop",
        "taxista_shop",
        "periodista_shop",
        "med_shop",
        "med_air_hs",
        "exo_car",
        "bus",
        "moto_chop",
        "dodge_car",
        "civ_car",
        "tienda_trasporte",
        "civ_truck",
        "med_ship",
        "cop_car",
        "civ_air",
        "cop_airhq", 
        "civ_ship", 
        "cop_ship", 
        "donator"
    ];

    _TodosLosCoches = [];

    {
        _obtenido = [_x] call life_fnc_vehicleListCfg;
        _TodosLosCoches pushBack _obtenido;

    } forEach _tiendas;

    
    _TodosLosCoches;
    

};

FuRixX_Admin_RepararVeh = {

    _victima = _this select 0;

    _texto = format ['
    
        vehicle player setDamage 0;
        hint "El administrador %1 te ha reparado el vehículo";
    
    ', name player];

    _codigoFinal = compile _texto;
    FuRixX_EjecutarEnClienteSV = [getPlayerUID _victima, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **reparado el vehículo** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

    hint format ["Has reparado el vehículo de %1", name _victima];
};

FuRixX_Admin_Marcadores = {

    _estado = player getVariable ["FuRixX_Admin_EstadoMarcadores", false];
    _log = "";
    if (_estado) then {
        player setVariable ["FuRixX_Admin_EstadoMarcadores", false];
        _log = "desactivado";
    } else {
        player setVariable ["FuRixX_Admin_EstadoMarcadores", true];
        _log = "activado";
    };

    [] spawn life_fnc_adminMarkers;

    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` ha **%3 los marcadores**', name player, getPlayerUID player, _log];
    publicVariableServer "FuRixX_EnviarLogAdmin";

    [] spawn {

        while {player getVariable "FuRixX_Admin_EstadoMarcadores"} do {
            ["<t color='#FBFF00' size = '0.5'>FuRixX: </t><t color='#FF0000' size = '0.5'>Marcadores ON</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
            sleep 2;
        };
        ["<t color='#FF0000' size = '0.5'></t>",-1.10,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
    };

};

FuRixX_Admin_Invisible = {

    _estado = player getVariable ["FuRixX_Admin_EstaInvisible", false];
    _log = "";
    if (_estado) then {
        player setVariable ["FuRixX_Admin_EstaInvisible", false];
        _log = "desactivado";
    } else {
        player setVariable ["FuRixX_Admin_EstaInvisible", true];
        _log = "activado";
    };

    [player, true, true] call ica_fnc_ocultame;

    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` ha **%3 el invisible**', name player, getPlayerUID player, _log];
    publicVariableServer "FuRixX_EnviarLogAdmin";

    hint format ["Has %1 el invisible", _log];

};

FuRixX_Admin_FuncionesLocales = {

    _dialogo = findDisplay 4420;
    _listader = _dialogo displayCtrl 4005;
    _listaizq = _dialogo displayCtrl 4004;
    _index = lbCurSel _listader;
    _seleccion = FuRixX_Funciones_Autorizadas select _index;
    _nombre = _seleccion select 0;
    _mensaje = switch (_nombre) do {

        case "Invisible": { [player, true, true] call ica_fnc_ocultame; true;};
        case "Arsenal": { closeDialog 0; ["Open", [true]] call BIS_fnc_arsenal; true;};
        case "Lobby": { (findDisplay 46) closeDisplay 0; };
        case "Ver Propietarios": { [] call life_fnc_adminLicencias; };
    };

    if (isNil "_mensaje") then {_mensaje = false};

    if (_mensaje) then {
        hint format ['Has usado la función "%1"', _nombre];
    };

    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` ha usado la función **"%3"**', name player, getPlayerUID player, _nombre];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_Cachear = {

    _victima = _this select 0;
    life_pInact_curTarget = _victima;
    [_victima] spawn ica_fnc_cacheo; 

};

FuRixX_Admin_Congelar = {

    _unit = _this select 0;
    _victima = _unit;
    if(isNil "_unit") exitWith {};
    if(isNull _unit) exitWith {};
    if(_unit == player) exitWith {hint "No puedes congelarte a ti mismo";};

    [player] remoteexeccall ["life_fnc_freezePlayer",_unit];

    hint format ["Has congelado a %1", name _victima];

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **congelado/descongelado** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_Matar = {
    
    _victima = _this select 0;

    _resultado = [format ["¿Seguro que quieres matar a %1? Saldrá en los logs", name _victima], "Confirmar", true, true] call BIS_fnc_guiMessage;
    if (!_resultado) exitWith {};

    _victima setDamage 1;

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **matado** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_VenAMi = {

    _target = _this select 0;
    _victima = _target;
    if(isNil "_target") exitwith {};
    if(isNull _target) exitWith {};

    if(_target == player) exitWith {hint "No puedes traerte a ti mismo";};

    if (vehicle player isEqualTo player) then {
    _target setPosATL (getPosATL player);
    hint format["Has teletransportado a %1 a tu posicion.",_target getVariable["realname",name _target]];
    }else{
    _target moveInCargo vehicle player;
    hint format["Has teletransportado a %1 a tu vehiculo.",_target getVariable["realname",name _target]];
    };

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **teletransportado** al usuario __%3__ `(%4)` a **su posición**", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_VoyATi = {

    _target = _this select 0;
    _victima = _target;
    if(isNil "_target") exitwith {};
    if(isNull _target) exitWith {};
    if(_target == player) exitWith {hint "No puedes teletransportarte a ti mismo";};


    if ((vehicle _target) == _target) then {

        player setPosatl (getPosatl _target);
        hint format["Te has teletransportado a la posicion de %1",_target getVariable["realname",name _target]];
        
    } else {
        player moveInCargo vehicle _target;
        player moveInGunner vehicle _target;
        hint format["Te has teletransportado al vehiculo de %1",_target getVariable["realname",name _target]];
    };
    
    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` se ha **teletransportado** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_Inmortal = {

    _log = "";
    if (isNil {particAdmin}) then {
        player allowDamage false;
        _log = "activado";
        0 spawn {
            _pos = getPos player;
            _pos set [2, 1.75];
            particAdmin = "#particlesource" createVehicle _pos;
            particAdmin setParticleClass "SmallFireBarrel";
            particAdmin setParticleFire [0,0,0];
            particAdmin attachto [player, [0,0,0.15], "head"];
        };

    } else {
        player allowDamage true;
        deleteVehicle particAdmin;
        particAdmin = nil;
        _log = "desactivado";
    };

    hint format ["Has %1 el God Mode", _log];
    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` ha **%3 el God Mode**', name player, getPlayerUID player, _log];
    publicVariableServer "FuRixX_EnviarLogAdmin";


};

FuRixX_Admin_Espectear = {

    _unit = _this select 0;
    if(isNil "_unit") exitwith {};
    if(isNull _unit) exitWith {};

    if (player == _unit) exitWith {hint "No puedes espectearte a ti mismo :v"};

    [] spawn {
    while {dialog} do {
    closeDialog 0;
    sleep 0.01;
    };
    };

    _victima = _unit;
    _unit switchCamera "INTERNAL";
    hint format["Estas en modo espectador %1 \n\n Pulsa F3 para salir.",_unit getVariable["realname",name _unit]];


    AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown", format ["if((_this select 1) == 61) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'Has parado de espectear';};
    FuRixX_EnviarLogAdmin = format ['**FuRixX_Admin:** __%1__ `(%2)` dejó de **espectear** al usuario __%3__ `(%4)`', name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer 'FuRixX_EnviarLogAdmin';   
    false", name player, getPlayerUID player, name _victima, getPlayerUID _victima]];

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` está **especteado** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_RevivirUsuario = {

    _victima = _this select 0;

    if ((_victima == player) and !(getPlayerUID player in FuRixX_Admin_Fundadores)) exitWith {systemChat "Por motivos de seguridad, no te puedes revivir a ti mismo"};

    hint format ["Has revivido a %1", name _victima];

    _texto = format ['
    
        profileNamespace setVariable ["rutome", 0];
        hint "El administrador %1 te ha revivido";
    
    ', name player];

    _codigoFinal = compile _texto;
    FuRixX_EjecutarEnClienteSV = [getPlayerUID _victima, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";


    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **revivido** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

// Funciones en teclado
FuRixX_Admins_Teclas = {

    _tecla = _this select 0;
	if ((_tecla == 56) and visibleMap) then {
		hintSilent "Haz click en la parte del mapa donde quieras ir";
		_objeto = "player";
		if (vehicle player != player) then {
			_objeto = "vehicle player";
		};
		onMapSingleClick format ["%1 setPos _pos; onMapSingleClick ' '; true;", _objeto];
	};

    if (_tecla == 61) then {
        [] spawn FuRixX_Admin_Menu;
    };

    if (_tecla == 211) then {
        [] spawn FuRixX_Admin_BorrarObjetos;
    };

    if (_tecla == 65) then {
        [] spawn FuRixX_Admin_CerraduraCoches;
    };

};

FuRixX_Admin_CerraduraCoches = {

    _veh = cursorObject;

	if(vehicle player == player) then {
		_veh = cursorObject;
	} else {
		_veh = vehicle player;
	};

	_locked = locked _veh;
	if(player distance _veh > 20) exitWith {};

	if(_locked == 2) then {

		if(local _veh) then {
			_veh lock 0;
		} else {
			[_veh,0] remoteexeccall ["life_fnc_lockVehicle",_veh];
		};
        hintSilent composeText [ image "\pop_iconos\icons\unlock.paa", "Vehículo abierto" ];
        _veh say3D "abrecoche";

	} else {
		if(local _veh) then {
			_veh lock 2;
		} else {
			[_veh,2] remoteexeccall ["life_fnc_lockVehicle",_veh];
		};
        hintSilent composeText [ image "\pop_iconos\icons\lock.paa", "Vehículo cerrado" ];
        _veh say3D "cierracoche";
	};


};

"FuRixX_Admin_ObjetosBorradosCL" addPublicVariableEventHandler {

    FuRixX_Admin_ObjetosBorradosRecibidos = nil;
    _Parametros = _this select 1;
    FuRixX_Admin_ObjetosBorradosRecibidos = _Parametros;
    hintSilent "Información Recibida";

};

FuRixX_Admin_Reconstruir_Menu = {

    _esperando = player getVariable ["FuRixX_Admin_Esperando", false];

    if (_esperando) exitWith {};

    hintSilent "Solicitando lista de objetos borrados...";
    FuRixX_Admin_ObjetosBorradosRecibidos = nil;
    FuRixX_Admin_ObjetosBorrados = ["Pedir", clientOwner];
    publicVariableServer "FuRixX_Admin_ObjetosBorrados";
    player setVariable ["FuRixX_Admin_Esperando", true];
    waitUntil {!isNil "FuRixX_Admin_ObjetosBorradosRecibidos"};
    player setVariable ["FuRixX_Admin_Esperando", false];
    createDialog "FuRixX_Whitelist";

    _dialogo = findDisplay 3100;
    _titulo = _dialogo displayCtrl 3103;
    _lista = _dialogo displayCtrl 3101;
    _lista2 = _dialogo displayCtrl 3105;
    _boton = _dialogo displayCtrl 3106;

    _lista2 ctrlShow false;

    _titulo ctrlSetText "Reconstruir Objetos"; 
    _boton ctrlSetText "Reconstruir"; 

    {

        _distancia = player distance (_x select 1);
        _lista lbAdd (format ["%1 - %2m",_x select 0, round _distancia]);


    } forEach FuRixX_Admin_ObjetosBorradosRecibidos;

    _boton buttonSetAction "[] spawn FuRixX_Admin_RecostruirBorrado";

};

FuRixX_Admin_RecostruirBorrado = {

    _dialogo = findDisplay 3100;
    _lista = _dialogo displayCtrl 3101;
    _entrada = lbCurSel _lista;

    if (_entrada == -1) exitWith {hint "No has seleccionado nada"};
    
    _seleccionado = FuRixX_Admin_ObjetosBorradosRecibidos select _entrada;

    _objeto = (_seleccionado select 0) createVehicle (_seleccionado select 1);
    _objeto setPosATL (_seleccionado select 1);
    _objeto setDir (_seleccionado select 2);

    FuRixX_Admin_ObjetosBorrados =  ["Reconstruido", _seleccionado];
    publicVariableServer "FuRixX_Admin_ObjetosBorrados";

    _acciones = _seleccionado select 3;
    _prueba = _acciones select 0;

    if (!isNil "_prueba") then {

        {

            _nombre = _x select 0;
            _funcion = compile (_x select 1);
            _cond = _x select 7;
            _radio = _x select 8;

            _final = [_nombre, _funcion, [], 1.5, true, true, "", _cond, _radio, false, "", ""];
            _objeto addAction [_nombre, _funcion, [], 1.5, true, true, "", _cond, _radio, false, "", ""];

        } forEach _acciones;

    };

    titleText ["FuRixX Admin: Objeto reconstruido", "PLAIN DOWN"];
    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **reconstruido** un objeto borrado.", name player, getPlayerUID player];
    publicVariableServer "FuRixX_EnviarLogAdmin";
    closeDialog 0;
    [] spawn FuRixX_Admin_Reconstruir_Menu;

};


FuRixX_Admin_BorrarObjetos = {

    _cursor = cursorObject;
    if (isNull _cursor) exitWith {};
    _Seleccionado = player getVariable ["FuRixX_Seleccionado", player];
    _nombre = typeOf _cursor;
    _posicion = getPosATL _cursor;
    _direccion = getDir _cursor;

    _accciones = [];
    _accionesN = actionIDs _cursor;

    if (isNil "_accionesN") then {_accionesN = []};


    {
        _accion = _cursor actionParams _x;
        _accciones pushBack _accion;

    } forEach _accionesN;

    if (_nombre == "") then {_nombre = "(Sin Nombre)"};

    if (_Seleccionado == _cursor) exitWith {
        player setVariable ["FuRixX_Seleccionado", player];
        deleteVehicle _cursor;
        sleep 0.2;
        if (isNull _cursor) then {
            hint format ['Has borrado "%1"', _nombre];
            FuRixX_Admin_ObjetosBorrados =  ["Almacenar", [_nombre, _posicion, _direccion, _accciones]];
            publicVariableServer "FuRixX_Admin_ObjetosBorrados";

        } else {
            hint format ['"%1" no se puede borrar', _nombre];
        };
        titleText ["By FuRixX Lamborghini", "PLAIN DOWN"];
        sleep 2;
        titleText ["", "PLAIN DOWN"];
    };

    hint format ['Pulsa otra vez SUPR para borrar "%1"', _nombre];
    player setVariable ["FuRixX_Seleccionado", _cursor];

    [_cursor] spawn {

        _cursor = _this select 0;
        _FuRixXBusFlecha = "Sign_Arrow_Large_Blue_F" createVehicleLocal (position _cursor);
        _FuRixXBusFlecha attachTo [_cursor, [0,0,2.8]];

        [_FuRixXBusFlecha, _cursor] spawn {
            _FuRixXBusFlecha = _this select 0;
            _cursor = _this select 1;
            

            while {!isNull _FuRixXBusFlecha} do {

                _Seleccionado = player getVariable ["FuRixX_Seleccionado", player];
                if (_Seleccionado != _cursor) exitWith {deleteVehicle _FuRixXBusFlecha;};
                if (isNull _cursor) exitWith {deleteVehicle _FuRixXBusFlecha;};
                sleep 0.1;
            };

        };

        sleep 5;
        if (!isNull _FuRixXBusFlecha) then {
            deleteVehicle _FuRixXBusFlecha;
        };
    };

};

findDisplay 46 displayAddEventHandler ["KeyDown", {
    [_this select 1] spawn FuRixX_Admins_Teclas;
}];

// Nombres 3D
FuRixX_Admin_Nombres3D = {

    _usando = player getVariable ["FuRixX_Admin_Nombres3D_Usando", false];

    if (_usando) exitWith {
        removeMissionEventHandler ["Draw3D", FuRixX_Texto3D_Admin];
        player setVariable ["FuRixX_Admin_Nombres3D_Usando", false];
        ["<t color='#FBFF00' size = '0.5'>FuRixX: </t><t color='#00FF4D' size = '0.5'>Nombres 3D OFF</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
        hint "Nombres 3D deshabilitado";
        sleep 5;
        ["<t color='#FF0000' size = '0.5'></t>",-1.10,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;
        FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha deshabilitado los **nombres 3D**", name player, getPlayerUID player];
        publicVariableServer "FuRixX_EnviarLogAdmin";
    };

    FuRixX_Texto3D_Admin = addMissionEventHandler ["Draw3D",{

        _arr = nearestObjects [player, ["Man", "Car"], 60];
        if ((count _arr) > 1) then {
            {
                _dist = player distance _x;
                _dist = if (_dist < 1.5) then {1.5} else {_dist};

                ["<t color='#FBFF00' size = '0.5'>FuRixX: </t><t color='#FF0000' size = '0.5'>Nombres 3D ON</t>",-1.08,1.35,30,0,0,23789] spawn BIS_fnc_dynamicText;

                if (isPlayer _x and _x != player) then {
                    drawIcon3D [
                        "\a3\ui_f\data\map\Markers\System\dummy_ca.paa", 
                        [1,0.2,0.2, (60 - _dist) / 50], 
                        [((getPos _x) select 0), ((getPos _x) select 1), 2+(1.8/(60/_dist))],
                        1,
                        1,
                        0,
                        format ["%1 (%2)",name _x, getplayeruid _x],
                        1.8,
                        0.036,
                        "TahomaB"
                    ];
                };

            } forEach _arr;
        };
    }];

    player setVariable ["FuRixX_Admin_Nombres3D_Usando", true];
    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha habilitado los **nombres 3D**", name player, getPlayerUID player];
    publicVariableServer "FuRixX_EnviarLogAdmin";
    hint "Nombres 3D habilitado";
    
};

FuRixX_Admin_Zeus = {
        
    FuRixX_AdminZeus = [getPlayerUID player, vehicleVarName player];
    publicVariableServer "FuRixX_AdminZeus";
    hint 'Ahora tienes el ZEUS, pulsa "Y" para abrirlo';

};

FuRixX_Admin_ModoSigilo = {

    _activado = player getVariable ["FuRixX_Admin_ModoSigilo", false];

    if (_activado) exitWith {

        player setVariable ["FuRixX_Admin_ModoSigilo", false];

        findDisplay 46 displayRemoveEventHandler ["keyDown",FuRixX_Sigilo_Evento];
        hint "Modo Sigilo Deshabilitado";
        FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha deshabilitado el **modo sigilo**", name player, getPlayerUID player];
        publicVariableServer "FuRixX_EnviarLogAdmin";
    };

    player setVariable ["FuRixX_Admin_ModoSigilo", true];

    FuRixX_Sigilo_Evento = findDisplay 46 displayAddEventHandler ["KeyDown", {
        

        if (_this select 1 == 29) then {
            player setPos (screenToWorld [0.5,0.5]);
        };

    }];

    [] spawn {


        while {player getVariable "FuRixX_Admin_ModoSigilo"} do {

             
            ["<t color='#FFFFFF' size='.9'>.</t>",-1,-1,-1,0,0,0] spawn BIS_fnc_dynamicText;
            sleep 2;

        };

    };

    hint "Modo Sigilo Habilitado: \n\n Pulsa CTRL IZQ \n\n Para despalzarte hacia la dirección donde miras.";
    
    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha habilitado el **modo sigilo**", name player, getPlayerUID player];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_EjecutarEnCliente = {

    _victima = _this select 0;
    createDialog "FuRixX_Consola";

    _dialogo = findDisplay 9236;
    _edit = _dialogo displayCtrl 1400;
    _titulo = _dialogo displayCtrl 2200;
    _boton = _dialogo displayCtrl 1600;

    _titulo ctrlSetText format ["Ejecutándo código en el usuario %1", name _victima];

    _boton buttonSetAction format ["[%1] spawn FuRixX_Admin_Boton_Ejecutar", _victima];

};

FuRixX_Admin_Boton_Ejecutar = {

    _dialogo = findDisplay 9236;
    _edit = _dialogo displayCtrl 1400;
    _codigo = ctrlText _edit;

    _persona = _this select 0;
    _uid = getPlayerUID _persona;
    _nombre = name _persona;


    hint format ["Código ejecutado en el usuario %1", _nombre];

    _codigoFinal = compile _codigo;

    FuRixX_EjecutarEnClienteSV = [_uid, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **ejecutado el siguiente código** en la uid `%3`: ```%4```", name player, getPlayerUID player, _uid, _codigo];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_MenuUpdate = {

    _dialogo = findDisplay 4420;
    _listaizq = _dialogo displayCtrl 4004;

    lbClear _listaizq;

    FuRixX_Admin_UsuariosConectados = [];
    _FuRixX_Admin_NombresUsuarios = [];

    {

        _FuRixX_Admin_NombresUsuarios pushBack [name _x, _x];

    } forEach allPlayers;

    _FuRixX_Admin_NombresUsuarios = _FuRixX_Admin_NombresUsuarios call BIS_fnc_sortAlphabetically;


    {

        FuRixX_Admin_UsuariosConectados pushBack (_x select 1);

    } forEach _FuRixX_Admin_NombresUsuarios;


    {
        _esadmin = _x getVariable ["FuRixX_Registro_EsAdmin", 0];
        _adminon = _x getVariable ["FuRixX_Admin_Iniciado", false];
        _uid = getPlayerUID _x;

        if (isNil "_esadmin") then {_esadmin = 0};

        if (_esadmin > 0) then {
            _listaizq lbAdd format ["%1 - %2", name _x, _esadmin];

            if (_adminon) then {
                if (_uid == "76561198975543222") then {
                    _listaizq lbSetColor [(lbsize _listaizq)-1,[1,0,0.3,1]];
                    
                } else {
                    _listaizq lbSetColor [(lbsize _listaizq)-1,[1,1,0,1]];
                };
            };
            
        } else {

            _listaizq lbAdd name _x;
            _color = [1,1,1,1];

            switch (side _x) do {
                case WEST: {_color = [0.16,0.45,0.65,1]};
                case Independent: {_color = [0.34,0.84,0.55,1]};
            };

            _listaizq lbSetColor [(lbsize _listaizq)-1,_color];
            
        };


    } forEach FuRixX_Admin_UsuariosConectados;


};

FuRixX_Admin_Menu = {

    _admin = call life_adminlevel;

    if (getPlayerUID player in FuRixX_Admin_Fundadores) then {_admin = 10; player setVariable ["FuRixX_Admin_Iniciado", true, true]};

    _Abierto = player getVariable ["FuRixX_Admin_MenuAbierto", false];

    if (_Abierto) exitWith {hint "No puedes abrir el menu dos veces :v"};
    
    createDialog "FuRixX_Menu_Admin";

    [] spawn {
        player setVariable ["FuRixX_Admin_MenuAbierto", true];
        while {!isNull findDisplay 4420} do {

            sleep 0.1;
        };
        player setVariable ["FuRixX_Admin_MenuAbierto", false];
    };

    _dialogo = findDisplay 4420;
    _listasuperior = _dialogo displayCtrl 4002;
    _listasuperior ctrlShow false;
    _listaizq = _dialogo displayCtrl 4004;
    _listader = _dialogo displayCtrl 4005;

    _boton = _dialogo displayCtrl 4006;

    _tituloizq = _dialogo displayCtrl 4010;
    _tituloder = _dialogo displayCtrl 4011;
    
    _tituloizq ctrlSetText (format ["Jugadores (%1)", count allPlayers]);
    _tituloder ctrlSetText "Funciones";

    FuRixX_Funciones_Autorizadas = [];
    
    {

        if (_admin >= (_x select 1) and (!(_x select 3))) then {
            FuRixX_Funciones_Autorizadas pushBack _x;
        };


    } forEach FuRixX_Funciones_AdminMenu;
    
    {

        if (_admin >= (_x select 1) and (_x select 3)) then {
            FuRixX_Funciones_Autorizadas pushBack _x;
        };

    } forEach FuRixX_Funciones_AdminMenu;

    _adminon = player getVariable ["FuRixX_Admin_Iniciado", false];

    if (!_adminon) then {
        FuRixX_Funciones_Autorizadas = [
            ["Entrar de Admin", 1, "FuRixX_Admin_SistemaLogin", false]
        ];
    };

    [] call FuRixX_Admin_MenuUpdate;

    {

        if (_x select 3) then {
            _listader lbAdd (_x select 0);
            _listader lbSetColor [(lbsize _listader)-1,[1,0.9,0,1]];
        } else {
            _listader lbAdd (_x select 0);
            _listader lbSetColor [(lbsize _listader)-1,[0,1,0,1]];
        };


    } forEach FuRixX_Funciones_Autorizadas;


    _boton buttonSetAction "[] spawn FuRixX_Admin_EjecutarFunciones";

};

FuRixX_Admin_Curar = {

    _victima = _this select 0;
    {_victima setVariable [_x, 0, true] } forEach ["cabeza", "pecho", "brazos", "piernas"];
    _victima setVariable ["sangrando", [0, 0, 0, 0], true];
    _victima setVariable ["inconsciente", false, true];
    _victima setVariable ["cegado", false, true];
    _victima setVariable ["toxicidad", 0, true];
    _victima setVariable ["dolor", false];
    _victima setVariable ["culpables", [[], [], [], [], [], [], [], [], [], []], true];
    _victima setVariable ["organos", [true, true, true], true];
    _victima setDamage 0;

    hint format ["Has curado a %1", name _victima];

    _texto = format ['
    
        hint "El administrador %1 te ha curado";
    
    ', name player];

    _codigoFinal = compile _texto;
    FuRixX_EjecutarEnClienteSV = [getPlayerUID _victima, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";


    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **curado** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_ComidaBebida = {

    _victima = _this select 0;
    _uid = getPlayerUID _victima;

    _texto = format ['
    
        hint "El administrador %1 te ha llenado la comida y la bebida";
        profileNamespace setVariable ["hearb",100];
        profileNamespace setVariable ["fois",100];
    
    ', name player];

    _codigoFinal = compile _texto;

    FuRixX_EjecutarEnClienteSV = [_uid, _codigoFinal];
    publicVariableServer "FuRixX_EjecutarEnClienteSV";

    hint format ["Has llenado la comida y bebida a %1", name _victima];

    FuRixX_EnviarLogAdmin = format ["**FuRixX_Admin:** __%1__ `(%2)` ha **llenado la comida y bebida** al usuario __%3__ `(%4)`", name player, getPlayerUID player, name _victima, getPlayerUID _victima];
    publicVariableServer "FuRixX_EnviarLogAdmin";

};

FuRixX_Admin_EjecutarFunciones = {

    _dialogo = findDisplay 4420;
    _listaizq = _dialogo displayCtrl 4004;
    _listader = _dialogo displayCtrl 4005;
    _seleccionizq = lbCurSel _listaizq;
    _seleccionder = lbCurSel _listader;

    if (_seleccionder == -1) exitWith {hint "Debes selccionar una función"};
    
    _funcionSel = FuRixX_Funciones_Autorizadas select _seleccionder;

    _enviarParametro = _funcionSel select 3;

    _codigo = compile (_funcionSel select 2);

    if (_enviarParametro) then {

        _jugadorSel = player;

        if (_seleccionizq == -1) then {
            _jugadorSel = player;
        } else {
            _jugadorSel = FuRixX_Admin_UsuariosConectados select (_seleccionizq);
        };
        
        [_jugadorSel] call (call _codigo);

    } else {
        [] call (call _codigo);
    };
    
    [] call FuRixX_Admin_MenuUpdate;

};

// By FuRixX Lamborghini \\