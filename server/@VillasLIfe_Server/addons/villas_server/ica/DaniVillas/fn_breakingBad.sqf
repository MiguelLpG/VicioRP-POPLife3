/*
as simple as ...

AxE...

......
*/

_param = _this select 0;


if (_param isEqualTo "init") exitWith {

_rdmPos = selectRandom [[4466.58,630.369,0.00143814],[4862.62,8689.33,0.00137329]]; 

breaking_bad_furgo = "mr_bounder_rv_v1" createVehicle _rdmPos;
breaking_bad_furgo lock true;
breaking_bad_furgo setDir -90;
breaking_bad_mesa = "land_pop_methlab" createVehicle _rdmPos;

breaking_bad_mesa setvariable ["meta",false,true];

[breaking_bad_mesa, ["<img  
        size='1'  
        color='#FF0000'  
        shadow='1'  
        image='\a3\Modules_F_Curator\Data\portraitLightning_ca.paa' 
    /> 
 <t size='1' color='#FF0000'>Cocinar Metanfetamina</t>
<img  
        size='1'  
        color='#FF0000'  
        shadow='2'  
        image='\a3\Modules_F_Curator\Data\portraitLightning_ca.paa' 
    /> 
 ", {["meta",_this select 0] spawn ica_fnc_robo}]] remoteExec ["addAction",0,false];

publicVariable "breaking_bad_mesa";
 
breaking_bad_mesa enableSimulation false;
breaking_bad_mesa attachTo[breaking_bad_furgo ,[0.6,-2,0]]; 
breaking_bad_mesa setDir -90;
breaking_bad_mesa setvariable ["meta",0 ,true];
breaking_bad_mesa setvariable ["cocinando",false,true];


	//[NPC_FARMACIA_1, ["Robar .::: Farmacia ", {["robarFarmacia"] spawn ica_fnc_robos}]] remoteExec ["addAction", 0,true];		
	
	[zona_1, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[zona_2, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[zona_3, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[zona_4, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[tienda_terro, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[tienda_bf, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[camello, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_NARCO_1, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];
	[NPC_ROBOS_MENORES_RICOS_1, [".:: Vender Meta de Alta Calidad ::.", {["venderMeta"] call ica_fnc_breakingBad},nil,6,true,true,"","[""pop_meta_b""] call ica_fnc_tengo > 0"]] remoteExec ["addAction", 0,true];	 
 
};




if (_param isEqualTo "venderMeta") exitWith {

if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};

_pWeap = primaryWeapon player;
_hgWeapon= handgunWeapon player; 

if( _pWeap != "" or _hgWeapon != "" ) exitWith{

titleText["Pon tus armas en la mochila, no te pagaremos mientras lleves armas equipadas.", "PLAIN"];
};

_objMeta = "pop_meta_b";

_metaCantidad = [_objMeta] call ica_fnc_tengo;
if (_metaCantidad > 10) then {
_metaCantidad = 10;
};


_yaVendido = cursorObject getVariable ["metavendida",false];

if (_yaVendido) exitWith {
[player,"Ya tengo suficiente meta por ahora ... vuelve mas tarde cuando haya podido vender la que me queda ..", 
		"Breaking Bad","pop_meta_b"] call ica_fnc_axeMsg;
};

cursorObject setVariable ["metavendida",true,true];
cursorObject spawn {
sleep 300;
_this setVariable ["metavendida",false,true];
};


if(_metaCantidad <= 0)then{

[player,"No tienes nada que venderme amigo ?...", 
		"Breaking Bad","pop_meta_b"] call ica_fnc_axeMsg;


}else{

[_objMeta , _metaCantidad * -1] call ica_fnc_item;


[player,format ["Gracias por las drogas amigo ... solo necesito %1 de meta por ahora ... cuando necesite mas te llamare .",_metaCantidad], 
		"Breaking Bad","pop_meta_b"] call ica_fnc_axeMsg;


_exp = ceil (_metaCantidad / 2);
_pago = _metaCantidad * 1000;

//pagamos y damos exp

vicio_din = vicio_din + _pago;
["exp",_exp] call ica_fnc_arrayexp;



};

};