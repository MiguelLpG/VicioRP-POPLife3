//BAI VARDI :CONSISTE EN FARMEAR RECOGIENDO HIERBA Y CUIDANDO ANIMALES.
//Se invoca con this addAction ["Recojer Residuos",' ["hierbas"] call ica_fnc_granja;', "", 9,false,true,"",""];


_param = _this select 0;




if (_param IsEqualto "hierbas") then {

player setvariable ["trabajo",1,true];

hint "Recoje todas los residuos para cobrar!";

sleep 1;

_hierba = "Land_WaterBottle_01_compressed_F" createVehicle position player;
sleep 0.5;
_hierba1 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
sleep 0.5;
_hierba2 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
sleep 0.5;
_hierba3 = "Land_WaterBottle_01_compressed_F" createVehicle position player;
sleep 0.5;
_hierba4 = "Land_WaterBottle_01_compressed_F" createVehicle position player;

_hierba   addAction["<t color='#FF0000'>Recojer</t>", {["recoger"] spawn ica_fnc_granja}];
_hierba1  addAction["<t color='#FF0000'>Recojer</t>", {["recoger"] spawn ica_fnc_granja}];
_hierba2  addAction["<t color='#FF0000'>Recojer</t>", {["recoger"] spawn ica_fnc_granja}];
_hierba3  addAction["<t color='#FF0000'>Recojer</t>", {["recoger"] spawn ica_fnc_granja}];
_hierba4  addAction["<t color='#FF0000'>Recojer</t>", {["recoger"] spawn ica_fnc_granja}];

}; 

if (_param IsEqualto "recoger") then {

_hierbas = nearestObject [player, "Land_WaterBottle_01_compressed_F"];//nos detecta las hierbas

player playmovenow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"; //accion de recojer

sleep 2.5;

hierbas = hierbas + 1;

hint format ["Has recogido %1/5 residuos",hierbas];

_hierbas = nearestObject [player, "Land_WaterBottle_01_compressed_F"];

deleteVehicle _hierbas;

//nos da la paga!
if (hierbas == 5) then {
//vicio_din = vicio_din + 1500;
player setvariable ["trabajo",0,true];
hierbas = 0;
hint "Buen trabajo!";
	};

}; 

