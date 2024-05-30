
#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	hint parsetext
	"<t color='#DE2828'><t size='3.4'><t align='center'>AVISO
	<br/><t color='#21618C'><t size='1.2'><t align='center'>No tienes suficiente nivel de admin</t>";
};

adminprivi = ["DEVELOPERID"];

 
if ( !(getplayerUID player in adminprivi) AND (deServicio == 0)) exitWith { hint "No estás de servicio"};

if (isnil "uniforme") then {
	_result = [format ["¿Seguro que quieres vestirte?"], "Vestirse de Admin","Aceptar","Cancelar"] call BIS_fnc_guiMessage;
	if (_result) then {
		uniforme = getunitloadout player;
		removeuniform player;
		removebackpack player;
		removeVest player;
		player forceAddUniform "TRYK_U_B_BLKBLK_R_CombatUniform";
		//player linkItem "EF_OPTIC_GGL";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "Itemwatch";
		player linkItem "ItemGPS";
		player addVest "A3L_fbivest1";
		player addHeadgear "mgsr_beret";
		player addGoggles "G_Aviator";
		["Admin Log",format ["%1 - (%2) se ha vestido de admin",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
	};
} else {
	removeuniform player;
	player setunitloadout uniforme;
	uniforme = nil;
	["Admin Log",format ["%1 - (%2) se ha desvestido de admin",profileName,(getPlayerUID player)]] remoteexeccall ["ica_fnc_customlog",2];
};
