diag_log "ANTI-HAX: INIT DLL CALL";
//_authRes = "log" callExtension format["0~%1", serverName];
diag_log format["ANTI-HAX: AUTH RESULT: %1", _authRes];

[] execVM "\finiAH_A3\AH.sqf";