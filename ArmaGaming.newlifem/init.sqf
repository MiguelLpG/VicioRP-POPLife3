waitUntil {(!(isNil "life_serverFunctionsReady"))}; waitUntil {life_serverFunctionsReady};

StartProgress = false;

tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
tf_sendingDistanceMultiplicator = 2;
tf_receivingDistanceMultiplicator = 2;

enableRadio false;
0 setRain 0;
0 setFog 0;
0 setOvercast 0;
forceWeatherChange;
999999 setRain 0;
999999 setFog 0;
999999 setOvercast 0;
uiNamespace setVariable ["Life_Rnd", floor(random(999999))];

iQsPRLpNqsHxF8hA4Mmng = 1; 
7Ye56RtEMtXgC5n8C5dbG9PX = 1;

StartProgress = true;

["init"] spawn lsyt_fnc_Oro;