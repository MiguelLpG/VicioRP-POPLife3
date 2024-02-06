private ['_code', '_function', '_file', '_fileContent'];
if !(isNil "allFunctions") exitWith {};

diag_log "------------------------------- Cargando funciones de Villas ----------------------------";
diag_log "------------- Funciones descentralizadas en life_server por Villas (vitro.) -------------";

allFunctions = [];
{
	_code = '';
	_function = _x select 0;
	_file = _x select 1;

	_fileContent = preprocessFileLineNumbers _file;
	_code = compileFinal _fileContent;
	_pushme = [_function,_code];
	allFunctions pushBack _pushme;

	diag_log format ["Cargada la función %1 con exito.", _function];
}
forEach
[
//-------------------------------- core/functions ----------------------------------------
	['ANZUS_fnc_keyHandler', '\life_server\Client\core\functions\fn_keyHandler.sqf'],
	['ANZUS_fnc_hudSetup', '\life_server\Client\core\functions\fn_hudSetup.sqf'],
	['ANZUS_fnc_AANBank', '\life_server\Client\core\functions\fn_AANBank.sqf'],
	['ANZUS_fnc_aacType', '\life_server\Client\core\functions\fn_accType.sqf'],
	['ANZUS_fnc_actionKeyHandler', '\life_server\Client\core\functions\fn_actionKeyHandler.sqf'],
	['ANZUS_fnc_animSync', '\life_server\Client\core\functions\fn_animSync.sqf'],
	['ANZUS_fnc_calWeightDiff', '\life_server\Client\core\functions\fn_calWeightDiff.sqf'],
	['ANZUS_fnc_dropItems', '\life_server\Client\core\functions\fn_dropItems.sqf'],
	['ANZUS_fnc_dropCash', '\life_server\Client\core\functions\fn_dropCash.sqf'],
	['ANZUS_fnc_escInterupt', '\life_server\Client\core\functions\fn_escInterupt.sqf'],
	['ANZUS_fnc_fetchCfgDetails', '\life_server\Client\core\functions\fn_fetchCfgDetails.sqf'],
	['ANZUS_fnc_fetchVehInfo', '\life_server\Client\core\functions\fn_fetchVehInfo.sqf'],
	['ANZUS_fnc_giveDiff', '\life_server\Client\core\functions\fn_giveDiff.sqf'],
	['ANZUS_fnc_isDamaged', '\life_server\Client\core\functions\fn_isDamaged.sqf'],
	['ANZUS_fnc_clearVehicleAmmo', '\life_server\Client\core\functions\fn_clearVehicleAmmo.sqf'],
	['ANZUS_fnc_getIndex', '\life_server\Client\core\functions\fn_getIndex.sqf'],
	['ANZUS_fnc_handleDamage', '\life_server\Client\core\functions\fn_handleDamage.sqf'],
	['ANZUS_fnc_handleInv', '\life_server\Client\core\functions\fn_handleInv.sqf'],
	['ANZUS_fnc_handleItem', '\life_server\Client\core\functions\fn_handleItem.sqf'],
	['ANZUS_fnc_hideObj', '\life_server\Client\core\functions\fn_hideObj.sqf'],
	['ANZUS_fnc_hudUpdate', '\life_server\Client\core\functions\fn_hudUpdate.sqf'],
	['ANZUS_fnc_inventoryClosed', '\life_server\Client\core\functions\fn_inventoryClosed.sqf'],
	['ANZUS_fnc_inventoryOpened', '\life_server\Client\core\functions\fn_inventoryOpened.sqf'],
	['ANZUS_fnc_inString', '\life_server\Client\core\functions\fn_inString.sqf'],
	['ANZUS_fnc_isNumber', '\life_server\Client\core\functions\fn_isNumber.sqf'],
	['ANZUS_fnc_isUIDActive', '\life_server\Client\core\functions\fn_isUIDActive.sqf'],
	['ANZUS_fnc_loadDeadGear', '\life_server\Client\core\functions\fn_loadDeadGear.sqf'],
	['ANZUS_fnc_loadGear', '\life_server\Client\core\functions\fn_loadGear.sqf'],
	['ANZUS_fnc_majorGold', '\life_server\Client\core\functions\fn_majorGold.sqf'],
	['ANZUS_fnc_nearATM', '\life_server\Client\core\functions\fn_nearATM.sqf'],
	['ANZUS_fnc_nearestDoor', '\life_server\Client\core\functions\fn_nearestDoor.sqf'],
	['ANZUS_fnc_nearUnits', '\life_server\Client\core\functions\fn_nearUnits.sqf'],
	['ANZUS_fnc_numberText', '\life_server\Client\core\functions\fn_numberText.sqf'],
	['ANZUS_fnc_onMapOpen', '\life_server\Client\core\functions\fn_onMapOpen.sqf'],
	['ANZUS_fnc_pullOutVeh', '\life_server\Client\core\functions\fn_pullOutVeh.sqf'],
	['ANZUS_fnc_pushObject', '\life_server\Client\core\functions\fn_pushObject.sqf'],
	['ANZUS_fnc_mapMarkers', '\life_server\Client\core\functions\fn_mapMarkers.sqf'],
	['ANZUS_fnc_markerMenu', '\life_server\Client\core\functions\fn_markerMenu.sqf'],
	['ANZUS_fnc_nameTags', '\life_server\Client\core\functions\fn_nameTags.sqf'],
	['ANZUS_fnc_notificationSystem', '\life_server\Client\core\functions\fn_notificationSystem.sqf'],
	['ANZUS_fnc_pickupItems', '\life_server\Client\core\functions\fn_pickupItems.sqf'],
	['ANZUS_fnc_pickupItemsUpdate', '\life_server\Client\core\functions\fn_pickupItemsUpdate.sqf'],
	['ANZUS_fnc_pushVehicle', '\life_server\Client\core\functions\fn_pushVehicle.sqf'],
	['ANZUS_fnc_radArea', '\life_server\Client\core\functions\fn_radArea.sqf'],
	['ANZUS_fnc_randomRound', '\life_server\Client\core\functions\fn_randomRound.sqf'],
	['ANZUS_fnc_removeItems', '\life_server\Client\core\functions\fn_removeItems.sqf'],
	['ANZUS_fnc_revealObjects', '\life_server\Client\core\functions\fn_revealObjects.sqf'],
	['ANZUS_fnc_rpr', '\life_server\Client\core\functions\fn_rpr.sqf'],
	['ANZUS_fnc_saveGear', '\life_server\Client\core\functions\fn_saveGear.sqf'],
	['ANZUS_fnc_searchPosEmpty', '\life_server\Client\core\functions\fn_searchPosEmpty.sqf'],
	['ANZUS_fnc_setEngineHit', '\life_server\Client\core\functions\fn_setEngineHit.sqf'],
	['ANZUS_fnc_simDisable', '\life_server\Client\core\functions\fn_simDisable.sqf'],
	['ANZUS_fnc_stripDownPlayer', '\life_server\Client\core\functions\fn_stripDownPlayer.sqf'],
	['ANZUS_fnc_writeDeathScreen', '\life_server\Client\core\functions\fn_writeDeathScreen.sqf'],
	['ANZUS_fnc_vehicleTags', '\life_server\Client\core\functions\fn_vehicleTags.sqf'],
	['ANZUS_fnc_whereAmI', '\life_server\Client\core\functions\fn_whereAmI.sqf'],
//-------------------------------- core/functions/network ----------------------------------------
	['ANZUS_fnc_broadcast', '\life_server\Client\core\functions\network\fn_broadcast.sqf'],
	['ANZUS_fnc_setFuel', '\life_server\Client\core\functions\network\fn_setFuel.sqf'],
//-------------------------------- core/config ----------------------------------------
	['ANZUS_fnc_houseConfig', '\life_server\Client\core\config\fn_houseConfig.sqf'],
	['ANZUS_fnc_itemWeight', '\life_server\Client\core\config\fn_itemWeight.sqf'],
	['ANZUS_fnc_vehicleAnimate', '\life_server\Client\core\config\fn_vehicleAnimate.sqf'],
	['ANZUS_fnc_vehicleWeightCfg', '\life_server\Client\core\config\fn_vehicleWeightCfg.sqf'],
//-------------------------------- core/session ----------------------------------------	
	['ANZUS_fnc_dataQuery', '\life_server\Client\core\session\fn_dataQuery.sqf'],
	['ANZUS_fnc_insertPlayerInfo', '\life_server\Client\core\session\fn_insertPlayerInfo.sqf'],
	['ANZUS_fnc_requestReceived', '\life_server\Client\core\session\fn_requestReceived.sqf'],
	['ANZUS_fnc_syncData', '\life_server\Client\core\session\fn_syncData.sqf'],
	['ANZUS_fnc_updatePartial', '\life_server\Client\core\session\fn_updatePartial.sqf'],
	['ANZUS_fnc_updateRequest', '\life_server\Client\core\session\fn_updateRequest.sqf'],
//-------------------------------- core (Master_Directory) ----------------------------------------	
	['ANZUS_fnc_initCiv', '\life_server\Client\core\fn_initCiv.sqf'],
	['ANZUS_fnc_initCop', '\life_server\Client\core\fn_initCop.sqf'],
	['ANZUS_fnc_initMedic', '\life_server\Client\core\fn_initMedic.sqf'],
	['ANZUS_fnc_survival', '\life_server\Client\core\fn_survival.sqf']
//-------------------------------- core (Master_Directory) ----------------------------------------	
];
publicVariable "allFunctions";
[allFunctions] remoteExec ["TON_fnc_receiveFunctions",2];
diag_log "------------------------ Carga de las funciones finalizada con éxito --------------------";