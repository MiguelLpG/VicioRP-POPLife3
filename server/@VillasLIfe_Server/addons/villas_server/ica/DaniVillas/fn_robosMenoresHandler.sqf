/*
por: quickskill

robos menores

Robo tienda de Ropa

Robo farmacia

Robo Narco

Robo Casa de Ricos

*/

_param = _this select 0;



if (_param isEqualTo "generarRobosMenores") exitWith {

    //robo ropas mochilas mascaras etc

    //sleep 600;

    [
        [NPC_ROBOS_MENORES_ROPA_1, ["Robar tienda de ropa.", {
            ["robarTiendaRopa"] spawn ica_fnc_robosMenoresHandler;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;

    NPC_ROBOS_MENORES_ROPA_1 setvariable["robable", true, true];

    NPC_ROBOS_MENORES_ROPA_1 setvariable["robandolo", false, true];

    [
        [NPC_ROBOS_MENORES_ROPA_1, ["PROTEGER ZONA - SEGURIDAD PRIVADA", {
            ["protegerZonaSeguridadPrivada", NPC_ROBOS_MENORES_ROPA_1] spawn ica_fnc_seguridadPrivada;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;




    //Farmacia
    [
        [NPC_FARMACIA_1, ["Robar farmacia", {
            ["robarFarmacia"] spawn ica_fnc_robosMenoresHandler;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;

    NPC_FARMACIA_1 setvariable["robable", true, true];

    NPC_FARMACIA_1 setvariable["robandolo", false, true];

    [
        [NPC_FARMACIA_1, ["PROTEGER ZONA - SEGURIDAD PRIVADA", {
            ["protegerZonaSeguridadPrivada", NPC_FARMACIA_1] spawn ica_fnc_seguridadPrivada;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;


    //Narco
    [
        [NPC_ROBOS_MENORES_NARCO_1, ["Robar al narco", {
            ["robarNarco"] spawn ica_fnc_robosMenoresHandler;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;

    NPC_ROBOS_MENORES_NARCO_1 setvariable["robable", true, true];

    NPC_ROBOS_MENORES_NARCO_1 setvariable["robandolo", false, true];

    [
        [NPC_ROBOS_MENORES_NARCO_1, ["PROTEGER ZONA - SEGURIDAD PRIVADA", {
            ["protegerZonaSeguridadPrivada", NPC_ROBOS_MENORES_NARCO_1] spawn ica_fnc_seguridadPrivada;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;



    //casa de ricos
    [
        [NPC_ROBOS_MENORES_RICOS_1, ["Robar casa de ricos", {
            ["robarRicos"] spawn ica_fnc_robosMenoresHandler;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;

    NPC_ROBOS_MENORES_RICOS_1 setvariable["robable", true, true];

    NPC_ROBOS_MENORES_RICOS_1 setvariable["robandolo", false, true];

    [
        [NPC_ROBOS_MENORES_RICOS_1, ["PROTEGER ZONA - SEGURIDAD PRIVADA", {
            ["protegerZonaSeguridadPrivada", NPC_ROBOS_MENORES_RICOS_1] spawn ica_fnc_seguridadPrivada;
        }]], "addAction", true, true
    ] call BIS_fnc_MP;


};

//no robar sin nivel
if (("baj"
        call ica_fnc_expToLevel) < 2) exitWith {
    titleText["No sabes robar...", "PLAIN"];
};


//TIENDA DE ROPA BB


if (_param isEqualTo "robarTiendaRopa") exitWith {


    if (!isNil "robos_bloqueados") exitWith {
        hint "Ya hay otro ROBO en progreso, debes esperar a que termine";
    };

    _sp = player getVariable["trabajo_seguridad_privada", false];

    if (_sp) exitWith {

        hint "Estás para proteger, no para robar.";

    };

    _aQuien = NPC_ROBOS_MENORES_ROPA_1;

    _sePuedeRobar = _aQuien getVariable["robable", false];
    _loEstanRobando = _aQuien getVariable["robandolo", false];

    if !(_sePuedeRobar) exitWith {
        hint "Ya han robado hace poco.";
    };
    if (_loEstanRobando) exitWith {
        hint "Ya están robando! Ayuda a tu amigo!";
    };

    if ((handgunWeapon player isEqualTo "")) exitWith {
        hint "¿Qué quieres tú? ¡Largo de aqui Pobretón!"
    };


    if ({side _x  isEqualTo  WEST} count playableUnits < 4) exitWith {hint "Tienen que estar al menos 4 policias conectados, sinó, no es divertido."};
    [10, "¡ALARMA!", [1, 0, 0], 1.5, "Están robando la tienda de ropa!", [1, 1, 1], 1] remoteExec["ica_fnc_anuncio", WEST];

    _darLoot = true;
    _time = 120;

    //pner delito
    [
        [getPlayerUID player, profileName, "211"], "life_fnc_wantedAdd", false, false
    ] call life_fnc_MP;




    //robandolo
    _aQuien setvariable["robandolo", true, true];
    //loop cuenta atras
    while {
        _time > 0
    }
    do {
        [
            [_aQuien, "alarmcar"], "life_fnc_say3D", true, false, false
        ] call BIS_fnc_MP;

        sleep 2;




        //distancia

        _metros = _aQuien distance player;


        _time = _time - 2;

        hintSilent format["Robando tienda de Ropa \n Tiempo : %1 \n Distancia: %2m \ 50m", [((_time) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round(_metros)];

        /// si muere paramos el contador
        if !(alive player) then {
            _time = 0;
            _darLoot = false;
        };



        if (_metros > 50) then {

            hint "Buen intento pero te has alejado demasiado de la zona.";

            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];
            _darLoot = false;

            _time = 0;

        };


        // a robado

        if (_time <= 0) then {


            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];


            _time = 0;

        };







    }; //end while


    //generar Loot
    if (_darLoot) then {

        hint "Coge el botín y lárgate!";

        // add caja
        _cajaLoot = "Box_NATO_Wps_F"
        createVehicle[0, 0, 0];
        _cajaLoot allowDamage false;
        _cajaLoot setPosATL[8193.32, 6424.23, 0.00143814];

        clearMagazineCargoGlobal _cajaLoot;
        clearItemCargoGlobal _cajaLoot;
        clearWeaponCargoGlobal _cajaLoot;

        //add loot
        _randomItem = ["TRYK_U_B_BLK_OD_Tshirt", "A3LJumperCIDBlack", "H_BobaMask", "mochila_grande"] call BIS_fnc_selectRandom;
        _cajaLoot addItemCargoGlobal[_randomItem, 1];


        _randomItem = ["TRYK_U_B_BLK_OD_Tshirt", "A3LJumperCIDBlack", "H_BobaMask", "mochila_mediana"] call BIS_fnc_selectRandom;
        _cajaLoot addItemCargoGlobal[_randomItem, 1];

        _randomItem = ["TRYK_U_B_BLK_OD_Tshirt", "A3LJumperCIDBlack", "H_BobaMask", "mochila_mediana"] call BIS_fnc_selectRandom;
        _cajaLoot addItemCargoGlobal[_randomItem, 1];

        _randomItem = ["TRYK_U_B_BLK_OD_Tshirt", "A3LJumperCIDBlack", "H_BobaMask", "mochila_mediana"] call BIS_fnc_selectRandom;
        _cajaLoot addItemCargoGlobal[_randomItem, 1];

        _polisOn = {
            side _x isEqualTo WEST
        }
        count playableUnits;
        _pasta = _polisOn * 1000;
        vicio_din = vicio_din + 62000 + round random 1000 + _pasta;

        [_cajaLoot, 120] spawn ica_fnc_borrame;


    };

    //reset robo cada 30 minutos

    [_aQuien] spawn {

        _aQuien = _this select 0;
        sleep(60 * 25);
        _aQuien setvariable["robable", true, true];
    };
};



//////ROBO FARMACIA //////////////////////////////

if (_param isEqualTo "robarFarmacia") exitWith {

    if (!isNil "robos_bloqueados") exitWith {
        hint "Ya hay otro ROBO en progreso, debes esperar a que termine";
    };

    _sp = player getVariable["trabajo_seguridad_privada", false];

    if (_sp) exitWith {

        hint "Estás para proteger, no para robar.";

    };

    _aQuien = NPC_FARMACIA_1;

    _sePuedeRobar = _aQuien getVariable["robable", false];
    _loEstanRobando = _aQuien getVariable["robandolo", false];

    if ((handgunWeapon player isEqualTo "")) exitWith {
        hint "¿Qué quieres tú? ¡Largo de aqui Pobretón!"
    };
    if ({side _x  isEqualTo  WEST} count playableUnits < 5) exitWith {hint "Tienen que estar al menos 5 policias conectados, sinó, no es divertido."};
    if !(_sePuedeRobar) exitWith {
        hint "Ya han robado hace poco.";
    };
    if (_loEstanRobando) exitWith {
        hint "Ya están robando! Ayuda a tu amigo!";
    };

    [10, "¡ALARMA!", [1, 0, 0], 1.5, "Están robando la farmacia!", [1, 1, 1], 1] remoteExec["ica_fnc_anuncio", WEST];

    _darLoot = true;
    _time = 180;

    //pner delito
    [
        [getPlayerUID player, profileName, "211"], "life_fnc_wantedAdd", false, false
    ] call life_fnc_MP;


    //robandolo
    _aQuien setvariable["robandolo", true, true];
    //loop cuenta atras
    while {
        _time > 0
    }
    do {

        //distancia

        _metros = _aQuien distance player;
        [
            [_aQuien, "alarmcar"], "life_fnc_say3D", true, false, false
        ] call BIS_fnc_MP;



        //tiempo
        sleep 2;
        _time = _time - 2;

        hintSilent format["Robando farmacia \n Tiempo : %1 \n Distancia: %2m \ 50m ", [((_time) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round(_metros)];



        /// si muere paramos el contador
        if !(alive player) then {
            _time = 0;
            _darLoot = false;
        };



        if (_metros > 50) then {

            hint "Buen intento pero te has alejado demasiado de la zona.";

            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];
            _darLoot = false;

            _time = 0;

        };


        // a robado

        if (_time <= 0) then {


            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];


            _time = 0;

        };







    }; //end while


    //generar Loot
    if (_darLoot) then {

        hint "Coge el botín y lárgate o te tiro un diazepam a la cabeza!";

        // add caja
        _cajaLoot = "Box_NATO_Wps_F"
        createVehicle[0, 0, 0];
        _cajaLoot allowDamage false;
        _cajaLoot setPosATL[8282.43, 6293.28, 0.00143623];

        clearMagazineCargoGlobal _cajaLoot;
        clearItemCargoGlobal _cajaLoot;
        clearWeaponCargoGlobal _cajaLoot;

        //add loot
        _randomItem = ["POP_CHAW2_D", "rds_uniform_assistant"] call BIS_fnc_selectRandom;
        _cajaLoot addItemCargoGlobal[_randomItem, 1];


		_randomItem2 = ["pop_muriatico", "pop_sosa", "pop_hci", "pop_neodimio"] call BIS_fnc_selectRandom;
		_cajaLoot addItemCargoGlobal[_randomItem2, 1];


        _cajaLoot addItemCargoGlobal["pop_efedrina_meta_b", 5];


        _polisOn = {
            side _x isEqualTo WEST
        }
        count playableUnits;
        _pasta = _polisOn * 1000;
        vicio_din = vicio_din + 90000 + round random 1000 + _pasta;

        [_cajaLoot, 120] spawn ica_fnc_borrame;


    };


    [_aQuien] spawn {

        _aQuien = _this select 0;
        sleep(60 * 25);
        _aQuien setvariable["robable", true, true];
    };


};





//////ROBO Narco //////////////////////////////

if (_param isEqualTo "robarNarco") exitWith {

    if (!isNil "robos_bloqueados") exitWith {
        hint "Ya hay otro ROBO en progreso, debes esperar a que termine";
    };

    _sp = player getVariable["trabajo_seguridad_privada", false];

    if (_sp) exitWith {

        hint "Estás para proteger, no para robar.";

    };

    _aQuien = NPC_ROBOS_MENORES_NARCO_1;

    _sePuedeRobar = _aQuien getVariable["robable", false];
    _loEstanRobando = _aQuien getVariable["robandolo", false];

    if !(_sePuedeRobar) exitWith {
        hint "Ya han robado hace poco.";
    };
    if (_loEstanRobando) exitWith {
        hint "Ya están robando! Ayuda a tu amigo!";
    };
    if ((handgunWeapon player isEqualTo "")) exitWith {
        hint "¿Qué quieres tú? ¡Largo de aqui Pobretón!"
    };
    if ({side _x  isEqualTo  WEST} count playableUnits < 5) exitWith {hint "Tienen que estar al menos 5 policias conectados, sinó, no es divertido."};
    [10, "¡ALARMA!", [1, 0, 0], 1.5, "Están robando la casa del narco!", [1, 1, 1], 1] remoteExec["ica_fnc_anuncio", WEST];

    _darLoot = true;
    _time = 180;

    //pner delito
    [
        [getPlayerUID player, profileName, "211"], "life_fnc_wantedAdd", false, false
    ] call life_fnc_MP;

    //robandolo
    _aQuien setvariable["robandolo", true, true];
    //loop cuenta atras
    while {
        _time > 0
    }
    do {

        //distancia

        _metros = _aQuien distance player;

        [
            [_aQuien, "alarmcar"], "life_fnc_say3D", true, false, false
        ] call BIS_fnc_MP;

        //tiempo
        sleep 2;
        _time = _time - 2;

        hintSilent format["Robando al narco \n Tiempo : %1 \n Distancia: %2m \ 50m", [((_time) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round(_metros)];

        /// si muere paramos el contador
        if !(alive player) then {
            _time = 0;
            _darLoot = false;
        };



        if (_metros > 50) then {

            hint "Buen intento pero te has alejado demasiado de la zona.";

            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];
            _darLoot = false;

            _time = 0;

        };


        // a robado

        if (_time <= 0) then {


            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];


            _time = 0;

        };







    }; //end while


    //generar Loot
    if (_darLoot) then {

        hint "Coge el botín y lárgate no me seas un Corleone y no me robes tambien los Diazepanes!";

        // add caja
        _cajaLoot = "Box_NATO_Wps_F"
        createVehicle[0, 0, 0];
        _cajaLoot allowDamage false;
        _cajaLoot setPosATL[4836.71,2746.84,1.79697];

        clearMagazineCargoGlobal _cajaLoot;
        clearItemCargoGlobal _cajaLoot;
        clearWeaponCargoGlobal _cajaLoot;

        //add loot
        _cajaLoot addItemCargoGlobal["pop_efedrina_b", 5 + round random 12];
        _cajaLoot addItemCargoGlobal["pop_cannabis_i", 5 + round random 12];
        _cajaLoot addItemCargoGlobal["pop_efedrina_meta_b", 5 + round random 12];
        _cajaLoot addItemCargoGlobal["pop_coca_b", 5 + round random 12];


        _polisOn = {
            side _x isEqualTo WEST
        }
        count playableUnits;
        _pasta = _polisOn * 1000;
        vicio_din = vicio_din + 37000 + round random 2000 + _pasta;

        [_cajaLoot, 120] spawn ica_fnc_borrame;


    };

    //reset robo cada 30 minutos

    [_aQuien] spawn {

        _aQuien = _this select 0;
        sleep(60 * 25);
        _aQuien setvariable["robable", true, true];
    };
};





//////ROBO Ricos//////////////////////////////

if (_param isEqualTo "robarRicos") exitWith {

    if (!isNil "robos_bloqueados") exitWith {
        hint "Ya hay otro ROBO en progreso, debes esperar a que termine";
    };

    _sp = player getVariable["trabajo_seguridad_privada", false];

    if (_sp) exitWith {

        hint "Estás para proteger, no para robar.";

    };

    _aQuien = NPC_ROBOS_MENORES_RICOS_1;

    _sePuedeRobar = _aQuien getVariable["robable", false];
    _loEstanRobando = _aQuien getVariable["robandolo", false];

    if !(_sePuedeRobar) exitWith {
        hint "Ya han robado hace poco.";
    };
    if (_loEstanRobando) exitWith {
        hint "Ya están robando! Ayuda a tu amigo!";
    };

    if ((handgunWeapon player isEqualTo "")) exitWith {
        hint "¿Qué quieres tú? ¡Largo de aqui Pobretón!"
    };

    if ({side _x  isEqualTo  WEST} count playableUnits < 6) exitWith {hint "Tienen que estar al menos 6 policias conectados, sinó, no es divertido."};
    [10, "¡ALARMA!", [1, 0, 0], 1.5, "Están robando una casa de la zona de ricos!", [1, 1, 1], 1] remoteExec["ica_fnc_anuncio", WEST];

    _darLoot = true;
    _time = 180;

    //pner delito
    [
        [getPlayerUID player, profileName, "211"], "life_fnc_wantedAdd", false, false
    ] call life_fnc_MP;

    //robandolo
    _aQuien setvariable["robandolo", true, true];
    //loop cuenta atras
    while {
        _time > 0
    }
    do {

        //distancia

        _metros = _aQuien distance player;

        [
            [_aQuien, "alarmcar"], "life_fnc_say3D", true, false, false
        ] call BIS_fnc_MP;
        //tiempo
        sleep 2;
        _time = _time - 2;
        hintSilent format["Robando casa \n Tiempo : %1 \n Distancia: %2m \ 50m", [((_time) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round(_metros)];



        /// si muere paramos el contador
        if !(alive player) then {
            _time = 0;
            _darLoot = false;
        };



        if (_metros > 50) then {

            hint "Buen intento pero te has alejado demasiado de la zona.";

            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];
            _darLoot = false;

            _time = 0;

        };


        // a robado

        if (_time <= 0) then {


            _aQuien setvariable["robable", false, true];
            _aQuien setvariable["robandolo", false, true];


            _time = 0;

        };







    }; //end while


    //generar Loot
    if (_darLoot) then {

        hint "El botín esta arriba cogela y lárgate!";

        // add caja
        _cajaLoot = "Box_NATO_Wps_F"
        createVehicle[0, 0, 0];
        _cajaLoot allowDamage false;
        _cajaLoot setPosATL[5405.35,3138.58,4.06079];

        clearMagazineCargoGlobal _cajaLoot;
        clearItemCargoGlobal _cajaLoot;
        clearWeaponCargoGlobal _cajaLoot;

        //add loot
        _cajaLoot addItemCargoGlobal["pop_diamante", 2 + round random 3];

        _polisOn = {
            side _x isEqualTo WEST
        }
        count playableUnits;
        _pasta = _polisOn * 1000;
        vicio_din = vicio_din + 43000 + round random 1000 + _pasta;


        [_cajaLoot, 120] spawn ica_fnc_borrame;


    };

    //reset robo cada 30 minutos

    [_aQuien] spawn {

        _aQuien = _this select 0;
        sleep(60 * 25);
        _aQuien setvariable["robable", true, true];
    };
};
