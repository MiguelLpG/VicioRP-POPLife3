
/*
por: Icaruk
	["sp", "hab1"] call ica_fnc_costeSP;
	["ene", "hab1"] call ica_fnc_costeSP;
*/

_param = _this select 0;
_hab = _this select 1;

_coste = switch (_hab) do {
	case "med1": {[1, 300]};
	case "med2": {[1, 400]};
	case "med3": {[2, 500]};
	case "med4": {[2, 600]};
	case "med5": {[2, 700]};
	case "med6": {[3, 800]};
	case "med7": {[3, 900]}; // 12
	
	case "con1": {[1, 300]};
	case "con2": {[1, 400]};
	case "con3": {[2, 500]};
	case "con4": {[2, 600]};
	case "con5": {[3, 800]};
	case "con6": {[6, 800]}; // 8
	
	case "for1": {[1, 300]};
	case "for2": {[1, 400]};
	case "for3": {[2, 500]};
	case "for4": {[2, 600]};
	case "for5": {[4, 700]};
	case "for6": {[3, 800]};
	case "for7": {[4, 500]};	// 13
	
	case "min1": {[1, 300]};
	case "min2": {[1, 400]};
	case "min3": {[2, 500]};
	//case "min4": {[2, 600]};
	//case "min5": {[3, 700]};
	//case "min6": {[3, 800]};
	//case "min7": {[2, 900]}; // 4
	
	case "pes1": {[1, 300]};
	case "pes2": {[1, 400]};
	case "pes3": {[2, 500]};
	case "pes4": {[3, 600]}; // 7

	case "agr1": {[1, 300]};
	case "agr2": {[2, 700]};
	case "agr3": {[2, 500]}; // 5
	
	case "log1": {[1, 300]};
	case "log2": {[2, 400]};
	case "log3": {[3, 500]};
	case "log4": {[4, 600]}; // 10
	
	case "art1": {[1, 200]};
	case "art2": {[1, 300]};
	case "art3": {[2, 400]};
	case "art4": {[1, 500]};
	case "art5": {[2, 600]};
	case "art6": {[2, 700]};
	case "art7": {[2, 800]};
	case "art8": {[2, 900]};
	case "art9": {[3, 1000]}; // 16
	
	case "inf1": {[1, 300]};
	case "inf2": {[2, 500]};
	case "inf3": {[2, 700]};
	case "inf4": {[3, 800]};
	case "inf5": {[3, 900]};
	case "inf6": {[3, 1000]}; // 14
	
	case "tir1": {[2, 600]};
	case "tir2": {[4, 800]};
	case "tir3": {[3, 500]}; // 7
	
	case "maf1": {[1, 200]};
	case "maf2": {[1, 300]};
	case "maf3": {[1, 400]};
	case "maf4": {[2, 500]};
	case "maf5": {[2, 550]};
	case "maf6": {[2, 575]};
	case "maf7": {[2, 600]};
	case "maf8": {[3, 700]}; // 14
	
	default {[0, 0]}; // para que initExp funcione bien
};

if (_param isEqualTo "sp") exitWith {_coste select 0};
if (_param isEqualTo "ene") exitWith {_coste select 1};

