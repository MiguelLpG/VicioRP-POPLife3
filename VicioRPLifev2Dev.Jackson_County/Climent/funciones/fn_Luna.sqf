while {true} do {

if (date select [3,2] isEqualTo [21,0]) then { //21:00 sharp
    [] remoteexec ['life_fnc_adminkill', 0];
	sleep 60 * 60;

} else {
sleep 1;
};

};
