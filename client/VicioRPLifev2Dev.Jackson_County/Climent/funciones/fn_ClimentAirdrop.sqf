
/* Airdrop por Climent

Para ejecutarlo : [] spawn Climent_fnc_ClimentAirdrop;

*/


if (FETCH_CONST(life_adminlevel) < 4) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};



//_policias = (west countSide playableUnits);
//if(_policias < 6) exitWith{hintSilent "";};
/*if((call life_adminlevel) < 1) exitWith {hint "No eres Admin, toma Kill!";
sleep 2;
player setdamage 1;
};*/



//________________ Configuracion ________________
//________________ Pon true o false  ________________


_Random_Loot							= true;         //	Loot Aleatorio
_Number									= 1;			//	Numero de Airdrops
_next_drop_in_sec   					= 60;          	//	Siguiente drop en...
_height_of_drop      					= 75;       	//	Peso del airdrop (parachute xd)




//________________ Spawnear 1 drop ________________
//for "_x" from  1 to (1) do {

//________________ Lugar del drop ________________
	_Pos = [] call BIS_fnc_randomPos; 		//    Sitio Random



[10,"Aviso",[1,0,0,1],2,(format ["Un Airdrop caera en %1 en 1 minuto",mapGridPosition _pos]),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",0];


_markerID = format["%1",_Pos]; 
_marker = createMarker [ _markerID, _Pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!ATENCIÓN! Un AirDrop ha caido AQUÍ";
_marker setMarkerType "mil_warning";


sleep _next_drop_in_sec;



//________________ Tipo de paracaidas ________________
//    B_Parachute_02_F
_parachute = createVehicle ["B_Parachute_02_F",_Pos, [], 0, "FLY"];
_parachute setPosATL [getPosATL _parachute select 0, getPosATL _parachute select 1, _height_of_drop];




_Cargo_array =[
            "B_supplyCrate_F",
            "I_CargoNet_01_ammo_F"
            ];

_Create_Cargo = selectRandom _Cargo_array;
        
_Cargo = createVehicle [_Create_Cargo, position _parachute, [], 0, 'NONE'];    
_Cargo attachTo [_parachute,[0,0,0]];
_Cargo enableSimulation false;


//________________ Añade las armas aqui ________________

clearWeaponCargoGlobal _Cargo;
clearMagazineCargoGlobal _Cargo;
clearItemCargoGlobal _Cargo;
clearBackpackCargoGlobal _Cargo;


//________________ Añade el random loot ________________
if (_Random_Loot) then {

clearMagazineCargoGlobal _cargo;



//Tipo del loot
_armas = selectRandom [
	//LightMachineGuns
	"RH_SAMR",
	"R3F_Famas_F1",
	"RH_gsh18",
	"RH_m9",
	"RH_bull"			
	];

_armas2 = selectRandom [
	//LightMachineGuns
	"chakFNP90_57x28_B_skin1",
	"RH_g17",
	"RH_mak",
	"C1987_MP7"			
	];		
		
			

//	Armas
_Cargo addWeaponCargoGlobal [_armas, 1];	//	1 es la cantidad
_Cargo addWeaponCargoGlobal [_armas2, 1];	//	1 es la cantidad
_magazines_weapon = getArray (configFile / "CfgWeapons" / _armas / "magazines");
_magazineClass_weapon = selectRandom _magazines_weapon; 

_Cargo addMagazineCargoGlobal [_magazineClass_weapon, 10];		//	10 son los cargadores

_magazines_weapon2 = getArray (configFile / "CfgWeapons" / _armas2 / "magazines");
_magazineClass_weapon2 = selectRandom _magazines_weapon2; 

_Cargo addMagazineCargoGlobal [_magazineClass_weapon2, 10];		//	10 son los cargadores

};

 
	
//________________ Tipo de humo ________________

_Chemlight_1 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_1 attachTo [_Cargo, [0,0.5,-0.4]];
_Chemlight_2 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_2 attachTo [_Cargo, [0,-0.5,-0.4]];
_Smoke = "SmokeShellRed" createVehicle (position _Cargo);
_Smoke attachTo [_Cargo, [0,0,0]];


waitUntil {getPos _Cargo select 2 < 4};
_vel = velocity _Cargo;
_Cargo setVelocity _vel;

waitUntil {getPos _Cargo select 2 < 0};
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",_Cargo];
           
detach _Cargo;
_parachute disableCollisionWith _Cargo;   

_time = time + 6;
waitUntil {time > _time};       
if (!isNull _parachute) then {deleteVehicle _parachute};
_Cargo enableSimulation true;


        




[10,"Aviso",[1,0,0,1],2,(format ["Ha caido un AirDrop en %1",mapGridPosition _pos]),[1,1,1,1],1.5] remoteexec ["ica_fnc_anuncio",0];

sleep 300;
deleteMarker _marker;
[_cargo] spawn ica_fnc_borrame;

//________________	_Create_Markers	________________


if (_Create_Markers) then {

	_Marker_Number_Pos = format ["%1",_Pos];
	_Marker_Pos = createMarker [_Marker_Number_Pos,_Pos];		
	_Marker_Pos setMarkerShape "ICON"; 
	_Marker_Pos setMarkerType "mil_marker"; 
	_Marker_Pos setMarkerColor "ColorUNKNOWN"; 
	_Marker_Pos setMarkerText format ["Airdrop : %1",_a];	
	_Marker_Pos setMarkerSize [1,1]; 		
};	




