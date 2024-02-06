private _display = uiNamespace getVariable["AnzusLife_Phone", displayNull];

if (isNull _display) exitWith {};

private _contactBackgroundControls = [];
private _allContactControls = [];
private _controlsGroup = _display displayCtrl 170002;
private _tag = getText(missionConfigFile >> "AnzusLife_Core_Settings" >> "ServerTag");
private _contacts = [AnzusLife_Phone_profileSettings];
{
    _contacts pushBack _x;
} forEach(profileNamespace getVariable[format["%1_contacts", _tag], []]);

private _idcStart = 9991;

{

    private _contactBackground = _display ctrlCreate["AnzusLife_PhoneRscPicture", _idcStart, _controlsGroup];
    _idcStart = _idcStart + 1;
    private _textCtrl = _display ctrlCreate["Life_RscStructuredText", _idcStart, _controlsGroup];
    _idcStart = _idcStart + 1;
    private _contactButton = _display ctrlCreate["AnzusLife_PhoneIconControlButton", _idcStart, _controlsGroup];

    {
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
        _x ctrlSetFade 0;
        _x ctrlCommit 0.5;
    } forEach [_contactBackground, _textCtrl, _contactButton];

    _idcStart = _idcStart + 1;

    private _config = (missionconfigfile >> "AnzusLife_Core_Settings");
    private _numberPrefix = getText(_config >> "phoneNumberPrefix");
    private _struct = "";
    if (((_x select 0) isEqualTo(AnzusLife_Phone_profileSettings select 0)) && ((_x select 1) isEqualTo(AnzusLife_Phone_profileSettings select 1)) && ((_x select 2) isEqualTo(AnzusLife_Phone_profileSettings select 2))) then {
        _struct = _struct + format["<t align='left' font='puristaMedium' shadow='0' size='%1'>My Number</t>", (((pixelH * 5) * ((getResolution select 1) / 1080)) * 110)];
        _struct = _struct + "<br/>";
        _struct = _struct + format["<t align='left' font='puristaMedium' color='#a8a8a8' shadow='0' size='%3'>(%2%1)</t>", (_x select 2), _numberPrefix, (((pixelH * 5) * ((getResolution select 1) / 1080)) * 90)];
    } else {
        _struct = _struct + format["<t align='left' font='puristaMedium' shadow='0' size='%3'>%1 %2</t>", (_x select 0), (_x select 1), (((pixelH * 5) * ((getResolution select 1) / 1080)) * 110)];
        _struct = _struct + "<br/>";
        _struct = _struct + format["<t align='left' font='puristaMedium' color='#a8a8a8' shadow='0' size='%3'>(%2%1)</t>", (_x select 2), _numberPrefix, (((pixelH * 5) * ((getResolution select 1) / 1080)) * 90)];
    };


    _textCtrl ctrlSetStructuredText parseText format["<t>%1</t>", _struct];
    _textCtrl ctrlSetTextColor[0, 0, 0, 1];
    _contactBackground ctrlSetText format["\ArmaGamingCore\images\phone\ui\ContactBackground1.paa"];
    if (_forEachIndex isEqualTo 0) then {
        _contactBackground ctrlSetText format["\ArmaGamingCore\images\phone\ui\mynumberbackground.paa"];
    };
    private _ctrlPos = [-0.0186 * safezoneH, 0, 0.180464 * safezoneW, 0.0418 * safezoneH];
    private _btnPos = [0.17 * safezoneH, 0, 0.025 * safezoneW, 0.0418 * safezoneH];

    if ((count _contactBackgroundControls) > 0) then {
        private _lastControl = _contactBackgroundControls select ((count _contactBackgroundControls) - 1);
        private _lastControlPos = ctrlPosition _lastControl;
        _ctrlPos set[
            1,
            (_lastControlPos select 1) + (_lastControlPos select 3)
        ];
        _btnPos set[
            1,
            (_lastControlPos select 1) + (_lastControlPos select 3)
        ];
    };

    _textPos = [
        (_ctrlPos select 0) + ((_ctrlPos select 3) / 2),
        (_ctrlPos select 1) + ((ctrlTextHeight _textCtrl) / 30),
        (ctrlTextWidth _textCtrl) + ((ctrlTextWidth _textCtrl) / 20),
        (ctrlTextHeight _textCtrl)
    ];


    _textCtrl ctrlSetPosition _textPos;
    _textCtrl ctrlCommit 0;
    _contactButton ctrlSetPosition _btnPos;
    _contactButton ctrlCommit 0;
    _contactBackground ctrlSetPosition _ctrlPos;
    _contactBackground ctrlCommit 0;
    private _backgroundCtrlPos = ctrlPosition _contactBackground;
    private _ctrlGroupPos = ctrlPosition _controlsGroup;
    _ctrlGroupPos set[2, _backgroundCtrlPos select 2];
    _controlsGroup ctrlSetPosition _ctrlGroupPos;
    _controlsGroup ctrlCommit 0;

    {
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
        _x ctrlSetFade 0;
        _x ctrlCommit 0.5;
    } forEach[_contactBackground, _textCtrl, _contactButton];
    _idcStart = _idcStart + 1;

    _contactBackgroundControls pushBack _contactBackground;

    {
        _allContactControls pushBack _x;
    } forEach[_contactBackground, _textCtrl, _contactButton];
    if (_forEachIndex > 0) then {
        private _format = format["[%1] spawn ANZUS_fnc_LoadContact", _forEachIndex];
        _contactButton ctrlSetEventHandler["buttonClick", _format];
    };
} forEach _contacts;

[_allContactControls] spawn {
    params[
        ["_allControls", [],[[]]]
    ];

    waitUntil {
        AnzusLife_Phone_CurrentlyOpen != "AnzusLife_ContactsMain"
    };
    {
        ctrlDelete _x;
    } forEach _allControls;
};
