if !(playerSide isEqualTo civilian) exitWith {};
if (dialog) then {closeDialog 0};

createDialog "AnzusLife_GangMenu";
_display = findDisplay 8999320;

private _ctrlButtonExit = _display displayCtrl 8999322;
_ctrlButtonExit ctrlSetTooltip "Close Gang Menu";
_ctrlButtonExit ctrlAddEventHandler ["ButtonClick", {
	closeDialog 0;
}];

private _gangfreq = ctrlText 8999342;
private _gangid = group player getVariable ["gang_id",-1];
private _freqs = missionNamespace getVariable ["AnzusLife_GangFreqs",[]];

_index = [_gangid,_freqs] call TON_fnc_index;
if (_index != -1) then {ctrlSetText [8999342,str(_freqs select _index select 1)];};

private _ctrlTreeGangs = _display displayCtrl 8999321;
_ctrlTreeGangs ctrlAddEventHandler ["TreeSelChanged", {
    params [
        ["_ctrlTree", controlNull, [controlNull]],
        ["_selPath", [], [[]]]
    ];
    private _display = ctrlParent _ctrlTree;

    private _buttonLeaveGang = _display displayCtrl 8999336;
    _buttonLeaveGang ctrlEnable true;

    private _buttonDisbandGang = _display displayCtrl 8999337;
    _buttonDisbandGang ctrlEnable true;

    private _tvData = _ctrlTree tvData _selPath;
    if (_tvData isEqualTo "") exitWith {};

    private _dataArray = parseSimpleArray _tvData;
    _dataArray params [
        ["_type", 0, [0]],
        ["_id", "", [""]]
    ];

    private _ctrlPlayersList = _display displayCtrl 8999334;
    private _ctrlButtonInvitePlayer = _display displayCtrl 8999335;
    private _freqEdit = _display displayCtrl 8999342;
    private _buttonSetFreq = _display displayCtrl 8999343;

    if (_type isEqualTo 0) then {
        private _groupArray = allGroups select {(_x getVariable ["gang_id", ""]) isEqualTo (group player getVariable ["gang_id", ""])};
        _groupArray params [["_group", grpNull, [grpNull]]];

        private _id = _group getVariable ["gang_id", ""];
        private _name = _group getVariable ["gang_name", ""];
        private _bank = _group getVariable ["gang_bank", 0];
        private _members = _group getVariable ["gang_members", []];
        private _owner = _group getVariable ["gang_owner", ""];

        private _ctrlGangName = _display displayCtrl 8999323;
        _ctrlGangName ctrlSetText (_name);

        private _ctrlGangCreated = _display displayCtrl 8999328;
        _ctrlGangCreated ctrlSetText "N/A";

        private _ctrlGangRole = _display displayCtrl 8999326;
        private _tasks = _group getVariable ["gang_role", []];
        private _role = _tasks select 0;

        switch (_role) do { 
            case 0: {_ctrlGangRole ctrlSetText "None";}; 
            case 1: {_ctrlGangRole ctrlSetText "Mafia";}; 
            case 2: {_ctrlGangRole ctrlSetText "Cartel";}; 
        };        

        private _ctrlGangMaxMembers = _display displayCtrl 8999327;
        private _maxMembers = _group getVariable ["gang_maxmembers", 50];
        _ctrlGangMaxMembers ctrlSetText str(_maxMembers);

        private _ctrlGangBank = _display displayCtrl 8999325;
        _ctrlGangBank ctrlSetText ("$" + ([_bank] call ANZUS_fnc_numberText));

        private _ctrlTextOwner = _display displayCtrl 8999324;
        private _player = [_owner] call AnzusLife_Lib_GetPlayerByUID;
        _ctrlTextOwner ctrlSetText (name _player);

        private _requiredInviteRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_Invites");
        private _requiredFreqRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_Freq");
        private _playerRank = [player] call ANZUS_fnc_gangGetRank;
        private _isInvitiationAllowed = _playerRank >= _requiredInviteRank;
        private _isFreqAllowed = _playerRank >= _requiredFreqRank;

        _ctrlPlayersList ctrlEnable _isInvitiationAllowed;
        _ctrlButtonInvitePlayer ctrlEnable _isInvitiationAllowed;
        _freqEdit ctrlEnable _isFreqAllowed;
        _buttonSetFreq ctrlEnable _isFreqAllowed;
        _buttonDisbandGang ctrlEnable (_owner isEqualTo getPlayerUID player);
        _buttonLeaveGang ctrlEnable (_owner != getPlayerUID player);
    } else {
        if (_type isEqualTo 1) then {
            private _ctrlPromoteButton = _display displayCtrl 8999340;
            _ctrlPromoteButton ctrlEnable true;

            private _ctrlDemoteButton = _display displayCtrl 8999341;
            _ctrlDemoteButton ctrlEnable true;

            private _ctrlKickButton = _display displayCtrl 8999339;
            _ctrlKickButton ctrlEnable true;

            private _members = group player getVariable ["gang_members", []];
            private _index = [_id,_members] call TON_fnc_index;
            if (_index isEqualTo -1) exitWith {};

            private _selection = _members select _index;
            private _playername = _selection select 0;
            private _playerrank = _selection select 2;

            private _ctrlTextName = _display displayCtrl 8999329;
            _ctrlTextName ctrlSetText _playername;

            private _ctrlTextRank = _display displayCtrl 8999330;
            private _ranks = getArray (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Rank_Array");
			private _rank = _ranks select _playerrank;

			if (isNil "_rank") then {
			    _ctrlTextRank ctrlSetText "";
			} else {
			    _ctrlTextRank ctrlSetText _rank;
			};
            
            private _ctrlTextStatus = _display displayCtrl 8999331;
            private _isOnline = _id call AnzusLife_Lib_GetPlayerStatus;
            private _status = [
                "Offline",
                "Online"
            ] select _isOnline;
            _ctrlTextStatus ctrlSetText _status;

            _ctrlPlayersList ctrlEnable false;
            _ctrlButtonInvitePlayer ctrlEnable false;
            _buttonDisbandGang ctrlEnable false;
            _buttonLeaveGang ctrlEnable false;
            _freqEdit ctrlEnable false;
            _buttonSetFreq ctrlEnable false;

            private _requiredPromoteRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_Promote");
            private _requiredDemoteRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_Demote");
            private _requiredKickRank = getNumber (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Needed_Rank_Kick");

            private _ctrlPromoteButton = _display displayCtrl 8999340;
            private _ctrlDemoteButton = _display displayCtrl 8999341;
            private _checkrank = [player] call ANZUS_fnc_gangGetRank;
            
            if (_checkrank < _requiredPromoteRank) then {_ctrlPromoteButton ctrlEnable false};
            if (_checkrank < _requiredDemoteRank) then {_ctrlDemoteButton ctrlEnable false};
            if (_checkrank < _requiredKickRank) then {_ctrlKickButton ctrlEnable false};
            if (_id isEqualTo getPlayerUID player) then {_ctrlPromoteButton ctrlEnable false; _ctrlDemoteButton ctrlEnable false; _ctrlKickButton ctrlEnable false;};

            _ctrlDemoteButton ctrlRemoveAllEventHandlers "ButtonClick";
            _ctrlPromoteButton ctrlRemoveAllEventHandlers "ButtonClick";
            _ctrlKickButton ctrlRemoveAllEventHandlers "ButtonClick";

            _ctrlPromoteButton ctrlAddEventHandler ["ButtonClick", {
                private _display = findDisplay 8999320;
                private _ctrlTree =  _display displayCtrl 8999321;
                private _selPath = tvCurSel _ctrlTree;

                private _tvData = _ctrlTree tvData _selPath;
                if (_tvData isEqualTo "") exitWith {};

                private _dataArray = parseSimpleArray _tvData;
                _dataArray params [
                    ["_type", 0, [0]],
                    ["_id", "", [""]]
                ];

                if (_type isEqualTo 1) then {
                    private _members = group player getVariable ["gang_members", []];
                    if (isNil "_members") exitWith {};
                    if (!(_members isEqualType [])) exitWith {};

                    private _index = [_id,_members] call TON_fnc_index;
                    if (_index isEqualTo -1) exitWith {};

                    private _selection = _members select _index;
                    private _playername = _selection select 0;
                    private _playerrank = _selection select 2;

                    _playersrank = [player] call ANZUS_fnc_gangGetRank;

                    private _newRank = _playerrank + 1;
                    private _maxRank = count(_ranks)-1;
                    if (_newRank isEqualTo _maxRank) exitWith {[format["%1 is the max rank they can be.",_playername],false,"slow"] call ANZUS_fnc_notificationSystem};
                    if (_newRank isEqualTo _playersrank && _playersRank < 3) exitWith {["You can not promote to your level.",true,"slow"] call ANZUS_fnc_notificationSystem;};
                    if (_newRank > _playersrank) exitWith {["You can not promote higher then your rank",true,"slow"] call ANZUS_fnc_notificationSystem};

                    private _ranks = getArray (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Rank_Array");
                    private _rank = _ranks select _newRank;

                    private _updated = _selection set [2, _newRank]; 
                    private _newgang = group player getVariable ["gang_members", []];
                    group player setVariable ["gang_members",_newgang,true]; 
                    [4,group player] remoteExec ["TON_fnc_updateGang",2];
                    
                    _ctrlTree tvSetCurSel _selPath;
                    [format["%1 has been promoted to %2", _playername, _rank],false,"slow"] call ANZUS_fnc_notificationSystem;
                };
            }];

            _ctrlDemoteButton ctrlAddEventHandler ["ButtonClick", {
                private _display = findDisplay 8999320;
                private _ctrlTree =  _display displayCtrl 8999321;
                private _selPath = tvCurSel _ctrlTree;

                private _tvData = _ctrlTree tvData _selPath;
                if (_tvData isEqualTo "") exitWith {};

                private _dataArray = parseSimpleArray _tvData;
                _dataArray params [
                    ["_type", 0, [0]],
                    ["_id", "", [""]]
                ];

                if (_type isEqualTo 1) then {
                    private _members = group player getVariable ["gang_members", []];
                    if (isNil "_members") exitWith {};
                    if (!(_members isEqualType [])) exitWith {};

                    private _index = [_id,_members] call TON_fnc_index;
                    if (_index isEqualTo -1) exitWith {};

                    private _selection = _members select _index;
                    private _playername = _selection select 0;
                    private _playerrank = _selection select 2;

                    _rank = [player] call ANZUS_fnc_gangGetRank;
                    if (_playerrank isEqualTo _rank) exitWith {["You can not demote a player with same rank as you.",true,"slow"] call ANZUS_fnc_notificationSystem;};
                    if (_playerrank > _rank) exitWith {["You cannot demote people higher then you.",true,"slow"] call ANZUS_fnc_notificationSystem;};

                    private _newRank = _playerrank - 1;
                    if (_newRank < 0) exitWith {[format["%1 is the lowest rank they can be.",_playername],false,"slow"] call ANZUS_fnc_notificationSystem};

                    private _ranks = getArray (missionConfigFile >> "CfgGangs" >> "Member_Management" >> "Rank_Array");
                    private _newRankDisplay = _ranks select _newRank;
                    private _oldRankDisplay = _ranks select _playerrank;

                    private _updated = _selection set [2, _newRank]; 
                    private _newgang = group player getVariable ["gang_members", []];
                    group player setVariable ["gang_members",_newgang,true]; 
                    [4,group player] remoteExec ["TON_fnc_updateGang",2];

                    _ctrlTree tvSetCurSel _selPath;
                    [format["%1 has been demoted from %2 to %3", _playername, _oldRankDisplay, _newRankDisplay],false,"slow"] call ANZUS_fnc_notificationSystem;
                };
            }];

            _ctrlKickButton ctrlAddEventHandler ["ButtonClick", {
                private _display = findDisplay 8999320;
                private _ctrlTree =  _display displayCtrl 8999321;
                private _selPath = tvCurSel _ctrlTree;

                private _tvData = _ctrlTree tvData _selPath;
                if (_tvData isEqualTo "") exitWith {};

                private _dataArray = parseSimpleArray _tvData;
                _dataArray params [
                    ["_type", 0, [0]],
                    ["_id", "", [""]]
                ];

                if (_type isEqualTo 1) then {
                    private _members = group player getVariable ["gang_members", []];
                    if (isNil "_members") exitWith {};
                    if (!(_members isEqualType [])) exitWith {};

                    private _index = [_id,_members] call TON_fnc_index;
                    if (_index isEqualTo -1) exitWith {};

                    private _selection = _members select _index;
                    private _playername = _selection select 0;
                    private _playerrank = _selection select 2;

                    _rank = [player] call ANZUS_fnc_gangGetRank;
                    if (_playerrank isEqualTo _rank) exitWith {["You can not kick a player with same rank as you.",true,"slow"] call ANZUS_fnc_notificationSystem;};
                    if (_playerrank > _rank) exitWith {["You cannot kick people higher then you.",true,"slow"] call ANZUS_fnc_notificationSystem;};

                    private _updated = _members - [_members select _index];
                    group player setVariable ["gang_members",_updated,true];

                    private _player = [_id] call AnzusLife_Lib_GetPlayerByUID;
                    if (!isNull _player) then {[_player,group player] remoteExec ["TON_fnc_clientGangKick",_player];};
                    
                    [4,group player] remoteExec ["TON_fnc_updateGang",2];
                    _ctrlTree tvDelete _selPath;
                    _ctrlTree tvSetCurSel [0,0];
                    [format["%1 has been kicked from the gang by %2", _playername, name player],false,"slow"] remoteExec ["ANZUS_fnc_notificationSystem", group player];
                };
            }];
        }
    };
}];

{
    private _ctrl = _display displayCtrl _x;
    _ctrl ctrlEnable false;
    true
} count [
    8999334,
    8999335
];

{
    private _ctrl = _display displayCtrl _x;
    _ctrl ctrlEnable false
} count [
    8999335,
    8999336,
    8999337,
    8999339,
    8999340,
    8999341,
    8999342,
    8999343
];

private _ctrlTreeOrganizations = _display displayCtrl 8999321;
tvClear _ctrlTreeOrganizations;

private _id = group player getVariable ["gang_id", -1];
private _name = group player getVariable ["gang_name", ""];
private _bank = group player getVariable ["gang_bank", 0];
private _members = group player getVariable ["gang_members", []];
private _maxmembers = group player getVariable ["gang_maxmembers",50];

private _membersOnline = _members select {
    _x params ["", "_uid"];
    [_uid] call AnzusLife_Lib_GetPlayerStatus;
};

private _statusColour = [
    [0.9, 0.1, 0, 1],
    [0.16, 0.72, 0, 1]
] select (!(_membersOnline isEqualTo []));

_formatted = format ["%1 - %2 Members",_name,count(_members)];
private _organizationEntry = _ctrlTreeOrganizations tvAdd [[], _formatted];
_ctrlTreeOrganizations tvSetData [[_organizationEntry], format ["[0,""%1""]", _id]];
_ctrlTreeOrganizations tvSetPicture [[_organizationEntry], "\a3\3DEN\Data\Cfg3DEN\Group\iconCustomComposition_ca.paa"];
_ctrlTreeOrganizations tvSetPictureColor [[_organizationEntry], _statusColour];

_gangMembers = [_members, [], { _x select 2 }, "DESCEND"] call BIS_fnc_sortBy;
{
    _x params [
        ["_name", "", [""]],
        ["_uid", "", [""]],
        ["_rank", 0, [0]]
    ];

    private _picture = [
        "\A3\ui_f\data\map\vehicleicons\iconManVirtual_ca.paa",
        "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa",
        "\A3\ui_f\data\map\vehicleicons\iconManOfficer_ca.paa",
        "\A3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa",
        "\A3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa"
    ] select _rank;

    private _isOnline = _uid call AnzusLife_Lib_GetPlayerStatus;
    private _colour = if _isOnline then {
        [0.16, 0.72, 0, 1]
    } else {
        [0.9, 0.1, 0, 1]
    };

    private _rank = [_uid] call AnzusLife_Lib_GetPlayerStatus;
    private _entryName = format ["%1", _name, _rank];
    private _memberEntry = _ctrlTreeOrganizations tvAdd [[_organizationEntry], _entryName];

    _ctrlTreeOrganizations tvSetData [[_organizationEntry, _memberEntry], format ["[1,""%1""]", _uid]];
    _ctrlTreeOrganizations tvSetPicture [[_organizationEntry, _memberEntry], _picture];
    _ctrlTreeOrganizations tvSetPictureColor [[_organizationEntry, _memberEntry], _colour];
    true
} count _gangMembers;

_ctrlTreeOrganizations tvSort [[], false];
tvExpandAll _ctrlTreeOrganizations;
_ctrlTreeOrganizations tvSetcurSel [0];

private _playersToCount = (allPlayers select {side _x isEqualTo civilian}) - [player];
_playersToCount = [_playersToCount, [], { name _x }, "ASCEND"] call BIS_fnc_sortBy;
private _ctrlPlayerList = _display displayCtrl 8999334;
{
    private _gangarray = group player getVariable ["gang_members", []];
    private _index = [getPlayerUID _x,_gangarray] call TON_fnc_index;

    if (_index isEqualTo -1) then {
        private _num = _ctrlPlayerList lbAdd name _x;
        _ctrlPlayerList lbSetData [_num, getPlayerUID _x];
        true
    };
} forEach _playersToCount;
_ctrlPlayerList lbSetCurSel 0;

_ctrlPlayerList ctrlAddEventHandler ["LBSelChanged", {
    params [
        ["_ctrl", controlNull, [controlNull]],
        ["_selectedIndex", 0, [0]]
    ];

    private _display = ctrlParent _ctrl;
    private _ctrlPlayersList = _display displayCtrl 8999334;
    private _ctrlButtonInvitePlayer = _display displayCtrl 8999335;

    private _data = _ctrl lbData _selectedIndex;
    {
        _x ctrlEnable !(_data isEqualTo "");
        true
    } count [_ctrlPlayersList, _ctrlButtonInvitePlayer];
}];

private _ctrlButtonInvitePlayer = _display displayCtrl 8999335;
_ctrlButtonInvitePlayer ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = findDisplay 8999320;
    private _ctrlPlayerList = _display displayCtrl 8999334;

    _ctrl ctrlEnable false;
    [_ctrlPlayerList] spawn ANZUS_fnc_gangInvitePlayer;
}];

private _ctrlButtonDisbandOrganization = _display displayCtrl 8999337;
_ctrlButtonDisbandOrganization ctrlAddEventHandler ["ButtonClick", {
    if (group player getVariable ["gang_owner",""] != getPlayerUID player) exitWith {};

    [] spawn {
        private _accepted = [
            "Are you sure?",
            "Are you sure you want to delete your gang? This is a permanent action and will remove all data from database.",
            "ACCEPT",
            "DENY",
            findDisplay 46
        ] call ANZUS_fnc_guiPrompt;

        if !_accepted exitWith {};

        [] remoteExec ["TON_fnc_removeGang",2];
        closeDialog 0;
    };
}];

private _ctrlButtonLeaveGang = _display displayCtrl 8999336;
_ctrlButtonLeaveGang ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = ctrlParent _ctrl;

    _ctrl ctrlEnable false;

    closeDialog 0;
    private _accepted = [
        "Are you sure?",
        "Are you sure you want to leave your gang?",
        "ACCEPT",
        "DENY",
        _display
    ] call ANZUS_fnc_guiPrompt;

    if (!_accepted) exitWith {};

    [] call ANZUS_fnc_gangLeave;
    closeDialog 0;
}];

private _buttonSetFreq = _display displayCtrl 8999343;
_buttonSetFreq ctrlAddEventHandler ["ButtonClick", {
    params [["_ctrl", controlNull, [controlNull]]];
    private _display = ctrlParent _ctrl;

    private _gangfreq = parseNumber(ctrlText 8999342);
    private _gangid = group player getVariable ["gang_id",-1];
    private _freqs = missionNamespace getVariable ["AnzusLife_GangFreqs",[]];
    
    if(_gangfreq > 30 && _gangfreq < 35 || _gangfreq isEqualTo 40 || _gangfreq isEqualTo 60.3) exitWith {["30.1 - 34.9, 40, and 60.3 are blocked frequencies.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if(_gangfreq isEqualTo 0) exitWith {["Frequency can not contain text.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    if(_gangfreq < 30 || _gangfreq > 512) exitWith {["Frequency range is 30-512.",true,"slow"] call ANZUS_fnc_notificationSystem;};
    
    _checkfreq = [_gangfreq,_freqs] call TON_fnc_index;
    if (_checkfreq != -1) exitWith {["Frequency is already taken, please choose another one.",true,"slow"] call ANZUS_fnc_notificationSystem;};

    _index = [_gangid,_freqs] call TON_fnc_index;
    if (_index isEqualTo -1) then {
        _freqs pushBack [_gangid,_gangfreq]; 
    } else {
        (_freqs select _index) set [1,_gangfreq];
    };

    closeDialog 0;
    missionNamespace setVariable ["AnzusLife_GangFreqs",_freqs,true];
    [format["You have set your new gang freq to %1", _gangfreq],false,"slow"] call ANZUS_fnc_notificationSystem;
}];