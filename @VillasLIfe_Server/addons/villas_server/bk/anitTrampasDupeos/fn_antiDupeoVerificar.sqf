
// ***********************************************************
// Anti Dupeo guardar gear matriz por Blakord
// xx = [true] call fn_antiDupeoGuardarGear ; // parametro true significa guardar (retorna array de equipo) -- false significa leer (retorna la variable del equipo)
// ***********************************************************

private ["_return","_myGear","_mySavedGear","_tempChk","_tempSavedChk","_UniformArray","_UniformSavedArray","_tempItem","_tempSavedItem","_counter","_follatelo"]

_modo	= param[0];

_myGear = getUnitLoadout player ;
_mySavedGear = [false] call ica_fnc_antiDupeoGuardarGear ;

If ( _myGear != _mySavedGear ) Then {

	_remplaceComent = "											************************** VERIFICAMOS ARMAS EQUIPADAS";
	for "_i" from 1 to 3 do {
		_tempChk 		= _myGear deleteAt 0;
		_tempSavedChk 	= _mySavedGear deleteAt 0;
		if ( _tempChk != _tempSavedChk ) Then {
			if ( count _tempSavedChk == 0 and count _tempChk > 0 ) Then {
				_remplaceComent = "								************************** TIENE ARMA EN LA MANO Y NO TENIA AL GRABAR, SE LE QUITA";
				player removeWeapon _tempChk select 0;
			};
		};
	};

	_remplaceComent = "											************************** VERIFICAMOS INVENTARIOS";
	for "_i" from 1 to 3 do {
		_tempChk 		= _myGear deleteAt 0;
		_tempSavedChk 	= _mySavedGear deleteAt 0;
		if ( _tempChk select 0 != _tempSavedChk select 0 ) Then {
			_remplaceComent = "									************************** EL UNIFORME CHALECO O MOCHILA NO CONCUERDA SE LE QUITA CON TODO EL INVENTARIO";
			switch (_i) do {
				case 1: { removeUniform player };
				case 2: { removeVest player };
				case 3: { removeBackpack player };
			};
		
		} else {
			_remplaceComent = "									************************** UNIFORMES ESTAN BIEN VAMOS CON LOS OBJETOS DENTRO";
			_UniformArray = _tempChk select 1;
			_UniformSavedArray = _tempSavedChk select 1;
			_counter = 0;
			_follatelo = false;
			while { count _UniformArray > 0 } do {
				_tempItem = _UniformArray deleteAt 0;
				If ( count _UniformSavedArray > 0 ) Then {
					_remplaceComent = "hay menos items guardados que en el inventario, se borran";
        _			_tempSavedItem = _UniformSavedArray deleteAt 0;
					_follatelo = true;
				} else {
					_tempSavedItem = _UniformSavedArray deleteAt 0;
					
				};
			};
		
			if ( count _tempSavedChk == 0 and count _tempChk > 0 ) Then {
				_remplaceComent = "								************************** EL UNIFORME CHALECO O MOCHILA NO CONCUERDA SE LE QUITA CON TODO EL INVENTARIO";
				player removeWeapon _tempChk select 0;
			};
		};
	};
};


unit removeItemFromUniform item
unit removeItemFromVest item
unit removeItemFromBackpack item

[[],
[],
[],
["GC3_Pop",[["pop_vendas_c",15,1],["pop_llaves",1,1],["pop_note",1,1],[["CSW_M26C","","","",[],[],""],1]]],
["S_VHO_PB_2",[["CUP_17Rnd_9x19_glock17",3,17],["hlc_30rnd_556x45_EPR_G36",3,30]]],
["mochila_grande",[]],
"GORRA_GC","",[],["ItemMap","ItemGPS","","ItemCompass","Itemwatch",""]]

comment "Exported from Arsenal by Blakord Crusader";

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add containers";
this forceAddUniform "GRS_Pop";
for "_i" from 1 to 3 do {this addItemToUniform "RH_15Rnd_9x19_M9";};
for "_i" from 1 to 3 do {this addItemToUniform "50Rnd_570x28_SMG_03";};
this addGoggles "G_Tactical_Clear";

comment "Add weapons";
this addWeapon "SMG_03_black";
this addWeapon "RH_m9c";

comment "Add items";

comment "Set identity";
this setFace "WhiteHead_17";
this setSpeaker "Male02ENG";




If ( _modo ) Then {
	_myGear = getUnitLoadout player ;
	_encripted = [true,_myGear] call ica_fnc_antiDupeoEncriptador ;
	profileNamespace setVariable ["condigpxpbakup",_encripted];
	_return = _myGear ;
} else {
};

_return

player addEventHandler ["InventoryClosed", {
	[true] call ica_fnc_antiDupeoGuardarGear ;
}];

/*
player addEventHandler ["InventoryClosed", {
	[true] call ica_fnc_antiDupeoGuardarGear ;
}];


testEnc = ["item1","item1,2",["pak1",["p11","p12"]]]

str testEnc = 
"[""item1"",""item1,2"",[""pak1"",[""p11"",""p12""]]]"

toArray (str testEnc)  =
[91,34,105,116,101,109,49,34,44,34,105,116,101,109,49,44,50,34,44,91,34,112,97,107,49,34,44,91,34,112,49,49,34,44,34,112,49,50,34,93,93,93]

toString (toArray (str testEnc)) =
"[""item1"",""item1,2"",[""pak1"",[""p11"",""p12""]]]"


call compilefinal (toString (toArray (str testEnc))) =
["item1","item1,2",["pak1",["p11","p12"]]]


************************************************

bktest = [true,["a1","a2"]] call ica_fnc_antiDupeoEncriptador ;

bktest3 = [false,bktest] call ica_fnc_antiDupeoEncriptador ;

bktest =
[108,51,114,66,51,61,51,114,67,51,110]

bktest2 =
[91,34,97,49,34,44,34,97,50,34,93]

bktest3 = 
["a1","a2"]

xx == "" =
true
/*