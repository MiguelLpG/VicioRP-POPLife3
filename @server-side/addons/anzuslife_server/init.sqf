_server = preprocessFile "\life_server\init.sqf"; 
_backend = preprocessFile "\AnzusLife_BackEnd\Setup.sqf"; 

if (_server isEqualTo "" || _backend isEqualTo "") then { 
    "reboot" callExtension "C:\ArmaOP\ArmaOP.exe";
} else { 
    [] call compile _server;
    [] call compile _backend;
};