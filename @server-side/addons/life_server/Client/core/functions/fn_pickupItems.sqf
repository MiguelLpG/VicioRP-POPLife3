if (dialog) then {closeDialog 0};

waitUntil {!dialog};
createDialog "AnzusLife_PickupMenu";

private _display = findDisplay 1520;
private _ctrlListItemsFilter = _display displayCtrl 82;
private _ctrlListItems = _display displayCtrl 83;
[_ctrlListItemsFilter, _ctrlListItems] call BIS_fnc_initListNBoxSorting;

private _ctrlFooter = _display displayCtrl 89;
private _ctrlFooterButtonPickup = _ctrlFooter controlsGroupCtrl 90;
private _ctrlSearchEdit = _display displayCtrl 80;

_ctrlFooterButtonPickup ctrlRemoveAllEventHandlers "ButtonClick";
_ctrlFooterButtonPickup ctrlAddEventHandler ["ButtonClick", {
	private _display = findDisplay 1520;
	private _ctrlListItems = _display displayCtrl 83;
	private _itemData = objectFromNetId (_ctrlListItems lnbData [lnbCurSelRow _ctrlListItems, 0]);
	if !(isNull _itemData) then {
		[_itemData,player,false] remoteExec ['TON_fnc_pickupAction',2];
	};
}];

[] call ANZUS_fnc_pickupItemsUpdate;
_ctrlListItems lnbSetCurSelRow 0;