/*

By AxE

*/

_param = _this select 0;
_unit = _this select 1;

if (isNull _unit) then {
_unit = _unit;
};

if (_param isEqualTo "fumar") exitWith {
 

_int = 0.1;  
life_nums = 3; 
 
	while{life_nums > 0} do {
		_pos = (ASLtoATL visiblePositionASL _unit);  
		_smoke = "#particlesource" createVehicleLocal _pos;   
		_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],   "",    "Billboard",    0.5,    0.5,    [0,0,0],   [0, 0.2, -0.2],    1, 1.275, 1, 0.2,    [0, 0.2,0],    [[0.4,0.4,1, 0.1], [1,1,1, 0.01], [1,1,1, 0]],    [1000],    1,    0.04,    "",    "",    _smoke];    
		_smoke setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];    
		_smoke setDropInterval 0.001;     
		_smoke attachto [_unit,[0,0.15,0], "neck"];  
		sleep 1; 
		life_nums = life_nums - 1; 
		deletevehicle _smoke; 

	}; 
 
};

//porros
if (_param isEqualTo "fumarPetas") exitWith {

_drogado = _unit getVariable ["drogado",false];

if !(_drogado)then{
_unit setVariable ["drogado",true,true];
};

_int = 1; 

_source = "logic" createVehicle (getpos _unit);   
_smoke = "#particlesource" createVehiclelocal getpos _source;   
_smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],   "",    "Billboard",    0.5,    0.5,    [0,0,0],   [0, 0.2, -0.2],    1, 1.275, 1, 0.2,    [0, 0.2,0],    [[0.1,1,0.1, _int], [1,1,1, 0.01], [1,1,1, 0]],    [1000],    1,    0.04,    "",    "",    _source];   
_smoke setParticleRandom [2, [0, 0, 0], [0.65, 0.65, 0.65], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];   
_smoke setDropInterval 0.001;    
_source attachto [_unit,[0,0.15,0], "neck"]; 
sleep 3.5;
detach _source;
deletevehicle _source;

"ChromAberration" ppEffectEnable true;
"ChromAberration" ppEffectAdjust[ 0.4 * cos(time * 11 * PI + 1), 0.3 * sin(time * 17 * PI), false];
"ChromAberration" ppEffectCommit 3;

sleep 30;

"ChromAberration" ppEffectEnable false;


};

//meta + heroina
if (_param isEqualTo "fumarHeroina") exitWith {

_drogado = _unit getVariable ["drogado",false];

if !(_drogado)then{

_unit setVariable ["drogado",true,true];

};


"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 2, -0.3, [0.75,0.7,0.7,0.98], [0,1,1,-35], [1,-9,-9,-0.7]];
			"colorCorrections" ppEffectCommit 10;
		
			sleep 30;

"colorCorrections" ppEffectEnable false;

};



//efedrina + cococa
if (_param isEqualTo "fumarCoca") exitWith {

_drogado = _unit getVariable ["drogado",false];

if !(_drogado)then{
_unit setVariable ["drogado",true,true];
};

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [2.5];
	"dynamicBlur" ppEffectCommit 10;
	sleep 30;
	"dynamicBlur" ppEffectEnable false;

};

//voy drogao
if (_param isEqualTo "voyDrogao") exitWith {

	_unit enableFatigue false;
	
	uisleep 60;
	
	_unit enableFatigue true;
};

if (_param isEqualTo "pastillaAntidroga") exitWith {

_unit setVariable ["drogado",false,true];
"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
life_heroin_effect = 0;
"chromAberration" ppEffectEnable false;
"ColorInversion" ppEffectEnable false;
life_crank_effect = 0;
life_drug_level = 0;
life_alcohol_level = 0;
life_used_drug = [0,0,0,0];
life_smoking = false;
life_drug_withdrawl = false;
life_cocaine_effect = 0;
life_heroin_effect = 0;
life_meth_effect = 0;
life_crank_effect = 0;
life_addiction = [0,0,0,0];
titleText [format ["<t color='#d9dad8' size='1.5'>..::: Te sientes libre de drogas ! :::..</t><br/><img image='%1' size='1.50'/>",["pop_metadona"] call ica_fnc_classToPic], "PLAIN", -1, true, true];


};


if (_param isEqualTo "testDrogas") exitWith {


	_cercania = nearestObjects [getPos _unit, ["Man"], 2];
	if !((count _cercania) > 1) exitWith {hint "No hay nadie cerca, debes estar a 2 metros de la persona."};
	if !(isPlayer (_cercania select 0)) exitWith {hint "Ese no es un jugador."};

_quien = _cercania select 1;
_drogado = _quien getVariable ["drogado",false];
if(_drogado)then{

titleText ["Positivo, está bajo los efectos de alguna droga.", "PLAIN"];

}else{

titleText ["Negativo, no está bajo los efectos de ninguna droga.", "PLAIN"];
	

};



};