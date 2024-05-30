/*
By: Villas
Para VicioRP

Farmeo de Fumigador.

Se encargan trabajos aleatorios con avionetas.

Trabajo 1 = Fumigar un PH.
Trabajo 2 = Apagar un incendio. Obigatorio cuando hay incendio hacer este trabajo.
Trabajo 3 = Transporte de Correos.
Trabajo 4 = Paquete aereo en rosario.


*/
_param = _this select 0;
_veh = _this select 1;



if (_param isEqualTo "trabajo") exitWith {

    if (!isNil "pos_incendio") exitWith {
        ["incendio"] spawn ica_fnc_fumigador;
    };

    _trabajoIniciado = player getvariable["trabajo_fumigador_activo", 0];

    if (_trabajoIniciado > 0) exitwith {

        [
            player,
            format["%1, debes terminar primero el encargo anterior", name player],
            "Dep AntiDrogas de Lakeside",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

    };

    player setvariable["trabajo_fumigador_activo", 1, true];

    _time = 60 * 20;

    //Selecciono tipo de trabajo:

    _tipo = round(random 2);

    if (_tipo isEqualto 0) then { //Dados = Apagar incendio si lo hay, sino ... Fumigar.

        _ruta_random = round(random 2);
        _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"];
        _finTrayecto = 0;
        _zonaFumigar = "TPHacido3";
        _solo1Vez = 0;


        if (_ruta_random == 0) then {
            _zonaFumigar = "TPHacido3";
        };

        if (_ruta_random == 1) then {
            _zonaFumigar = "TPHbasico3";
        };

        if (_ruta_random == 2) then {
            _zonaFumigar = "TPHneutro1";
        };

        _posDestino = getMarkerPos _zonaFumigar;

        _rdm = round(random 9999);
        _marker_id = format["MarkerFumiga_%1", _rdm];
        _markerText = createMarkerLocal[_marker_id, _posDestino];
        _markerText setMarkerColorLocal "ColorGreen";
        _markerText setMarkerTextLocal "Zona de Fumigacion Asignada, Acercate a la Zona para Fumigarla.";
        _markerText setMarkerTypeLocal "mil_warning";


        sleep 1;
        [
            player,
            format["Todo en orden %1, Ya estas listo para ir a fumigar y salvar a nuestros hijos de esta terrible adición, recuerda utilizar la frecuencia de radio 600 para coordinar con la torre de radar. (Windows para subirse a la avioneta)", name player],
            "Dep AntiDrogas de Lakeside",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;
        sleep 1;

        //loop cuenta atras
        while {
            _time > 0
        }
        do {

            //distancia

            _metros = _veh distance _posDestino;

            //tiempo
            sleep 1;
            _time = _time - 1;

            hintSilent parseText format["<img image='%4' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Destino: %3 </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Tiempo : %1</t><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Distancia: %2m</t> ", [((_time) / 60) + .01, "HH:MM"] call BIS_fnc_timetostring, round(_metros), _zonaFumigar, ["C_Plane_Civil_01_racing_F"] call ica_fnc_classToPic];


            /// si muere paramos el contador
            if !(alive player) then {
                _time = 0;
            };


            //empezamos a fumigar
            if (_metros < 1200) then {

                if (_solo1Vez == 0) then {

                    _humo = "SmokeShellYellow"
                    createVehicle position _veh;
                    _humo attachTo[_veh, [-1, -0.8, 0]];

                    _solo1Vez = 1;
                }

            };




            // el tio se toca los huevos pues no cobras

            if (_time <= 0) then {
                [
                    player,
                    format["Muy mal %1, has Tardado mucho y ya han cosechado la droga ... muy mal.", name player],
                    "Dep AntiDrogas de Lakeside",
                    "C_Plane_Civil_01_racing_F"
                ] call ica_fnc_axeMsg;

                player setvariable["trabajo_fumigador_activo", 0, true];

                _time = 0;

            };


            //llegamos al destino

            if (_metros < 300) then {

                [
                    player,
                    format["Gracias !! Un excelente trabajo ... justo en la zona ... ya puedes ir a cobrar !.", name player],
                    "Dep AntiDrogas de Lakeside",
                    "C_Plane_Civil_01_racing_F"
                ] call ica_fnc_axeMsg;

                player setvariable["pagar_fumigador", 1, true];
                deleteMarkerlocal _marker_id;
                _time = 0;

            };



        };

    };



    if (_tipo isEqualto 1) then {


        [
            player,
            "Rosario Express nos ha contratado para despacharle un paquete encima de su isla ... el trabajo debe ser discreto acercate y deja caer el paquete, recuerda utilizar la frecuencia de radio 600 para coordinar con la torre de radar.(Windows para subirse a la avioneta)",
            "Rosario INC express.",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

        _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"];

        _posr = getPos NPC_AXE_ROSARIO;

        _rdm = round(random 9999);
        _marker_id = format["MarkerRosario_%1", _rdm];
        _markerText = createMarkerLocal[_marker_id, _posr];
        _markerText setMarkerColorLocal "ColorBlack";
        _markerText setMarkerTextLocal "Aqui deja caer el paquete de Rosario.";
        _markerText setMarkerTypeLocal "mil_warning";

        waituntil {
            typeof vehicle player isEqualTo "C_Plane_Civil_01_racing_F" && (getposATL vehicle player) select 2 > 4
        };
        deleteMarkerlocal _marker_id;
        _containerdummy = createVehicle["Land_Cargo20_blue_F", [999, 0, 0], [], 0, "CAN_COLLIDE"];
        _containerdummy attachTo[_veh, [0, 0, -3.5]];
        _containerdummy setDir 90;

        while {
            player distance _posr > 700 && alive player
        }
        do {
            _metros = player distance _posr;
            hintSilent parseText format["<img image='%2' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Destino: Isla del Rosario </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Distancia: %1m</t> ", round(_metros), ["C_Plane_Civil_01_racing_F"] call ica_fnc_classToPic];
            sleep 2;

        };
        player setvariable["pagar_fumigador", 1, true];
        deleteVehicle _containerdummy;
        sleep 0.1;
        _container = createVehicle["Land_Cargo20_blue_F", [999, 0, 0], [], 0, "CAN_COLLIDE"];
        _para = createVehicle["O_Parachute_02_F", [getPos _veh select 0, getPos _veh select 1, getPos _veh select 2], [], 0, ""];
        _para setPosATL(_veh modelToWorld[0, 0, 100]);
        _para attachTo[_veh, [0, 0, -10]];
        detach _para;
        _container attachTo[_para, [0, 0, -2]];
        _container setDir 90;
        playSound3D["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
        _smoke = "SmokeShellGreen"
        createVehicle[getpos _container select 0, getpos _container select 1, 0];
        _smoke attachTo[_container, [0, 0, 0]];
        _light = "Chemlight_green"
        createVehicle getPos _container;
        _light attachTo[_container, [0, 0, 0]];
        _flare = "F_40mm_Green"
        createVehicle getPos _container;
        _flare attachTo[_container, [0, 0, 0]];
        sleep 0.1;
        while {
            (getPos _container select 2) > 2
        }
        do {
            "marcador_paquete"
            setMarkerPos getPos _container;
            sleep 1;
        };
        detach _container;
        _container setPos[getPos _container select 0, getPos _container select 1, (getPos _container select 2) + 0.5];

        deleteMarkerlocal _markerText;



        [
            player,
            format["Bien hecho %1, Ya es trabajo de otros el recoger la mercancía y distribuirla !!", name player],
            "Rosario Enterprise te lo agradec",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;
		
		sleep(20);
		deleteMarker "marcador_paquete";
		deleteVehicle _container;

    };




    if (_tipo isEqualto 2) then {


        [
            player,
            "La oficina de correos de Lakeside nos ha solicitado un envío express a Diablos, ya he cargado tu avioneta y esperan por ti para descargar en el aeropuerto de Diablos, recuerda utilizar la frecuencia de radio 600 para coordinar con la torre de radar.(Windows para subirse a la avioneta)",
            "Correos Aereos",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

        _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"];

        _posr = [2576.08,7576.52,0.00141907];

        waituntil {
            typeof vehicle player isEqualTo "C_Plane_Civil_01_racing_F" && (getposATL vehicle player) select 2 > 4
        };


        while {
            player distance _posr > 800 && alive player
        }
        do {

            _metros = player distance _posr;
            hintSilent parseText format["<img image='%2' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Destino: Aeropuerto de Diablos </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Distancia: %1m</t> ", round(_metros), ["C_Plane_Civil_01_racing_F"] call ica_fnc_classToPic];
            sleep 2;

        };

        sleep 0.1;

        [
            player,
            "Bien hecho ! ahora debes aterrizar al frente de la torre de control para que descarguen los correos.",
            "Correos Aereos",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

        sleep 0.1;
        waituntil {
            (getposATL vehicle player) select 2 < 3 && player distance _posr < 100
        };


        player setvariable["pagar_fumigador", 1, true];

        [
            player,
            format["Bien hecho %1, Paquete entregado ... vuelve a el aeropuerto de Lakeside y reclama tu paga.!!", name player],
            "Entrega Finalizada",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;



    };




};









// En caso de que haya un incendio es reenviado aqui:
if (_param isEqualTo "incendio") then {

    [
        player,
        "La aeronautica civil de Lakeside ha ordenado que todas las aeronaves disponibles de la zona ayuden a sofocar un incendio activo, Hemos cargado tu aeronave con espuma especial para el trabajo ... en Tu mapa y GPS hemos marcado la posicion del Incendio, recuerda utilizar la frecuencia de radio 600 para coordinar con la torre de radar.(Windows para subirse a la avioneta)",
        "Incendio !! Trabajo Urgente !!",
        "C_Plane_Civil_01_racing_F"
    ] call ica_fnc_axeMsg;


    _rdm = round(random 9999);
    _marker_id = format["MarkerIncendio_%1", _rdm];
    _markerText = createMarkerLocal[_marker_id, pos_incendio];
    _markerText setMarkerColorLocal "ColorBlack";
    _markerText setMarkerTextLocal "Aqui Incendio, deja caer la espmuma para apagarle";
    _markerText setMarkerTypeLocal "mil_warning";


    while {
        player distance pos_incendio > 400 && alive player
    }
    do {
        sleep 2
    };

    deleteMarkerlocal _markerText;

    _espumas = round(random 9);

    while {
        _espumas > 0
    }
    do {

        [] spawn {

            _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"];

            _pos = [getPos _veh select 0, getPos _veh select 1, getPos _veh select 2];

            _fuente2 = "#particlesource"
            createVehicle _pos;
            _fuente2 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 48, 1], "cl_water", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.5], 0, 8.277, 0.2, 0.025, [0.5, 0.5, 0.5, 0.5], [
                [0, 255, 255, 0.7],
                [0, 255, 255, 0.5],
                [0, 255, 255, 0.25],
                [0, 255, 255, 0]
            ], [0.2], 1, 0.04, "", "", _target];
            _fuente2 setParticleRandom[2, [3.3, 3.3, 3.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
            _fuente2 setDropInterval 0.015;
            _fuente2 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente2 attachTo[_veh, [0, 0, -10]];

            _fuente4 = "#particlesource"
            createVehicle _pos;
            _fuente4 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.8, 0.8, 0.8, 0.8], [
                [0, 195, 255, 0.7],
                [0, 255, 195, 0.5],
                [0, 255, 255, 0.25],
                [0, 255, 195, 0]
            ], [0.2], 1, 0.04, "", "", _target];
            _fuente4 setParticleRandom[2, [4.3, 4.3, 4.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
            _fuente4 setDropInterval 0.015;
            _fuente4 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente4 attachTo[_veh, [0, 0, -10]];

            _fuente5 = "#particlesource"
            createVehicle _pos;
            _fuente5 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [1.2, 0.9, 0.7, 0.1], [
                [0, 245, 245, 0.7],
                [0, 245, 245, 0.5],
                [0, 245, 245, 0.25],
                [0, 245, 245, 0]
            ], [0.2], 1, 0.04, "", "", _target];
            _fuente5 setParticleRandom[2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
            _fuente5 setDropInterval 0.015;
            _fuente5 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente5 attachTo[_veh, [0, 0, -10]];

            _escala = 0.1;

            _fuente3 = "#particlesource"
            createvehicle _pos;
            _fuente3 setParticleCircle[0, [0, 0, 0]];
            _fuente3 setParticleRandom[0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
            _fuente3 setDropInterval 0.04;
            _fuente3 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente3 attachTo[_veh, [0, 0, -10]];

            _fuente11 = "#particlesource"
            createVehicle _pos;
            _fuente11 setParticleParams[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 15, 20, 1], "cl_water", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.5], 0, 1.277, 0.2, 0.025, [0.4, 0.7, 0.5, 0.6], [
                [224, 255, 255, 0.7],
                [224, 255, 255, 0.5],
                [224, 255, 255, 0.25],
                [224, 255, 255, 0]
            ], [0.2], 1, 0.04, "", "", _target];
            _fuente11 setParticleRandom[2, [0.8, 0, 0.9], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
            _fuente11 setDropInterval 0.015;
            _fuente11 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente11 attachTo[_veh, [0, 0, -10]];

            _escala = 0.1;

            _fuente12 = "#particlesource"
            createvehicle _pos;
            _fuente12 setParticleCircle[0, [0, 0, 0]];
            _fuente12 setParticleRandom[0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
            _fuente12 setDropInterval 0.04;
            _fuente12 setPosATL(_veh modelToWorld[0, 0, 100]);
            _fuente12 attachTo[_veh, [0, 0, -10]];

            sleep 30;

            deleteVehicle _fuente2;
            deleteVehicle _fuente3;
            deleteVehicle _fuente11;
            deleteVehicle _fuente12;


        };

        _espumas = _espumas - 1;
        sleep 1;
    }; {
        if (str _x find ": <no shape>" > -1) then {
            deleteVehicle _x;
            sleep 1;
        };

    }
    forEach nearestObjects[pos_incendio, [], 60];

    player setvariable["pagar_fumigador", 1, true];

    [
        player,
        format["Eres un heroe %1, has ayudado a extingir este fuego, Muchas Gracias !!", name player],
        "Lakeside te lo Agradece",
        "C_Plane_Civil_01_racing_F"
    ] call ica_fnc_axeMsg;

};





if (_param isEqualTo "cobrarTrabajo") exitWith {

    if ((count(nearestObjects[player, ["man"], 10])) > 1) exitwith {
        [
            player,
            "De uno en uno porfavor",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg
    };

    player setvariable["trabajo_fumigador_activo", 0, true];

    if ((player getvariable "pagar_fumigador") == 0) exitwith {

        [
            player,
            "No has realizado tu turno aún ... que pretendes ? un adelanto ? ",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

    };

    if ((player getvariable "pagar_fumigador") > 0) exitwith {

        //borramos flecha 
        _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"]; {
            detach _x;
            deletevehicle _x;
        }
        forEach attachedObjects _veh;

        [
            player,
            "Que buen trabajo ! Gracias ! Aqui tienes tu paga.",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

        _exp = round(random[4, 6, 8]);
        _pago = round(random[20000, 25000, 30000]);

        //pagamos y damos exp

        vicio_dim = vicio_dim + _pago;
        _organizacion = cursorObject getVariable["controlado_por", grpNull];
        if (!isNull _organizacion) then {
            [(round(_pago * 0.01)), _organizacion] call life_fnc_gangExtorsion;
        };
        ["exp", _exp] call ica_fnc_arrayexp;
        [format["+ %1exp", _exp]] call ica_fnc_infolog;
        [format["+ %1€", _pago]] call ica_fnc_infolog;

        player setvariable["pagar_fumigador", 0, true];
        player setvariable["trabajo_fumigador_activo", 0, true];

    };



};

if (_param isEqualTo "solicito") exitWith {

    //_piloto = "tl" call ica_fnc_expToLevel;

    if !(license_civ_piloto) exitWith {

        [
            player,
            format["Sr %1, no registra usted en nuestra base de datos como piloto ... porque sera? (Vaya a la universidad)", name player],
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg

    };


    if ((count(nearestObjects[player, ["man"], 10])) > 1) exitwith {
        [
            player,
            "De uno en uno porfavor",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg
    };



    if (vicio_dim < 10000) exitwith {
        [
            player,
            "La fianza son 10000 euros pobfabo",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg
    };
    vicio_dim = vicio_dim - 10000;
    _pos = selectRandom[[9223.95, 8714.07, 0.00143814], [9199.54, 8704.66, 0.00143814], [9218.38, 8700.26, 0.00143814]];
    _veh = "C_Plane_Civil_01_racing_F"
    createvehicle _pos;
    clearMagazineCargoGlobal _veh;
    clearWeaponCargoGlobal _veh;
    clearItemCargoGlobal _veh;
    _veh setDir 48;

    player setvariable["pagar_fumigador", 0, true];
    player setvariable["trabajo_fumigador_activo", 0, true];
    _veh setvariable["propietario", name player, true];

    _veh addAction["Empezar trabajo Aeronautico.", {
        ["trabajo"] spawn ica_fnc_fumigador
    }];
    _veh addAction["Subir a la avioneta", {
        player moveindriver(_this select 0)
    }];


    player addHeadgear "H_PilotHelmetHeli_O";


};


if (_param isEqualTo "fianza") exitWith {




    if ((count(nearestObjects[player, ["man"], 10])) > 1) exitwith {
        [
            player,
            "De uno en uno porfavor",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;
    };
    _veh = nearestObject[player, "C_Plane_Civil_01_racing_F"];
    if (isnil "_veh") exitwith {

        [
            player,
            "Donde esta la nave ? donde ?",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg

    };
    if ((player distance _veh) > 10) exitwith {

        [
            player,
            "Acerca la avioneta papu",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

    };
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {

        [
            player,
            "Esta avioneta no esta a tu nombre capo ... la pregunta es .. donde esta la avioneta ?",
            "AeroNautica Civil",
            "C_Plane_Civil_01_racing_F"
        ] call ica_fnc_axeMsg;

    };
    deletevehicle _veh;
    //_uniforme = player getvariable "uniforme";
    //player adduniform _uniforme;
    removeHeadgear player;
    vicio_dim = vicio_dim + 10000;
    [
        player,
        "Todo en orden Doctor ... vuelva cuando necesite mas trabajo",
        "AeroNautica Civil",
        "C_Plane_Civil_01_racing_F"
    ] call ica_fnc_axeMsg;

};