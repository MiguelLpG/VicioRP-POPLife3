private ["_ChannelName","_ServerName","_isTeamSpeakPluginEnabled","_radios","_channel","_wtflol","_curfreqlr"];
[] spawn {
    while {true} do {
            _ChannelName = call TFAR_fnc_getTeamSpeakChannelName;
            _ServerName = call TFAR_fnc_getTeamSpeakServerName;
            _isTeamSpeakPluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;

            _notOn = false;
            _IsAdmin = ((call life_adminlevel) > 0);
            _WhiteListedChannels = ["TFAR"];
            _SupportChannels = ["Sala de Ayuda #1","Sala de Ayuda #2","Sala de Ayuda #3","Sala de Ayuda #4","Sala de Ayuda #5","Solicitando Staff"];

            private "_text";

            if(_ServerName != "ARMAGaming Comunidad | Official Teamspeak") then {
                _notOn = true;
                _text ="Parece que estás en el TeamSpeak incorrecto! TS: ARMAGamingTS3";
            };
            if(!(_ChannelName in _WhiteListedChannels)) then {
                _notOn = true;
                _text = "Parece que no estás en el canal correcto!";
            };
            if(!_isTeamSpeakPluginEnabled) then {
                _notOn = true;
                _text = "Parece que no tienes el plugin del TaskForce activado!";
            };

            if(_notOn) then {
                player setVariable ["inRPR",false,true];
                if !(_IsAdmin) then {
                    cutText[_text,"BLACK FADED"];
                };        
            } else {
                cutText ["","PLAIN"];
                player setVariable ["inRPR",true,true];
            };

            _radios = player call TFAR_fnc_radiosList;
            if(count _radios > 1) then {
                ["Tus radios se están interfiriendo entre si mismas, tira una para solucionarlo.",true,"slow"] call ANZUS_fnc_notificationSystem;
                {
                    if(_x != "RoleplayRadio") then
                    {
                        player unassignItem _x;
                        player removeItem _x;
                    };
                    _wtfno = call TFAR_fnc_haveSWRadio;
                    if(_Wtfno) then {
                        _channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
                        _channel = _channel + 1;
                        _curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
                        if(!isNil "_curfreqsr") then {
                            [(call TFAR_fnc_activeSwRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
                        };
                    };
                } forEach _radios;
            };
        sleep 2;
    };
};
