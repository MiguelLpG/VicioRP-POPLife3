params [
	["_control", "", [""]]
];

if (_control isEqualTo "") exitWith {};

private _display = uiNamespace getVariable ["AnzusLife_Phone", displayNull];

private _arr = switch (_control) do {
	case ("messagebox") : {[230005, ["Message Sent!", "Enter Message.."]]};
	case ("moneyamount") : {[120003, ["1"]]};
	case ("invamount") : {[130003, ["1"]]};
	case ("gangcreate") : {[160003, ["Enter Gang Name"]]};
	case ("contacteditfirst") : {[200002, [""]]};
	case ("contacteditlast") : {[200003, [""]]};
	case ("contacteditcompany") : {[200004, [""]]};
	case ("contacteditnumber") : {[200005, [""]]};
	case ("contacteditemail") : {[200006, [""]]};
	case ("contactaddfirst") : {[190002, [""]]};
	case ("contactaddlast") : {[190003, [""]]};
	case ("contactaddcompany") : {[190004, [""]]};
	case ("contactaddnumber") : {[190005, [""]]};
	case ("contactaddemail") : {[190006, [""]]};
};

private _control = _display displayCtrl (_arr select 0);
private _ctrlText = ctrlText _control;

{
	if (_ctrlText == _x) exitWith {
		_control ctrlSetText "";
	};
} forEach (_arr select 1);
