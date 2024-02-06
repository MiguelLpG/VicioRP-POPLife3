params [ 
    ["_unit", objNull, [objNull]], 
    ["_crimeClass", "", [""]]
];

// Error checks
if (isNull _unit) exitWith {};
if (!alive _unit) exitWith {};
if (_unit in [independent, west]) exitWith {};

private _configClass = (missionConfigFile >> "CfgJail" >> "Crimes" >> _crimeClass); 
if !(isClass _configClass) exitWith {};

private _title = getText (_configClass >> "title");
private _penalty = getText (_configClass >> "penalty");
private _sentenceTime = getNumber (_configClass >> "prisonTime");
private _ticketValue = getNumber (_configClass >> "ticketValue");
private _crimeID = getNumber (_configClass >> "crimeID");

if (_crimeID < 0) exitWith {["No crime ID found.",true,"slow"] call ANZUS_fnc_notificationSystem;};
[_unit, _crimeID] remoteExec ["ANZUS_fnc_addWarrantsServ",2];

if (!local _unit) then
{
    [format["A warrant for the arrest of %1 has been added to the warrants database.",name _unit],false,"slow"] call ANZUS_fnc_notificationSystem;
    [format["A warrant has been issued for your arrest. This is due to suspicion of %1 and carries a penalty of %2 up to %3 minutes as well as a ticket of $%4.",_title,_penalty,_sentenceTime,[_ticketValue] call ANZUS_fnc_numberText],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem",_unit];
}
else
{
    [format["A warrant has been issued for your arrest. This is due to suspicion of %1 and carries a penalty of %2 up to %3 minutes as well as a ticket of $%4.",_title,_penalty,_sentenceTime,[_ticketValue] call ANZUS_fnc_numberText],false,"slow"] call ANZUS_fnc_notificationSystem;
};