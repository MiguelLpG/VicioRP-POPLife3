
// ***********************************************************
// PoP Police framework by Blakord
// Speed limiter
// ***********************************************************

if (isServer) exitWith {} ;

[] spawn {
	private ["_MyVehicle","_PoP_Class"];

	bkUsarLimitador = false ;
	bkLimitadorOn = false;
	bkLimitador2 = false;
	_SpeedLimit = 60 ;
	_SpeedLimit4x4 = 120 ;
	_SpeedDiferential = 3 ;
	_TruckArray = false;
	_RandomFactor = 0 ;
	_SelectSpeed = 0;
	_RndSpeed1 = 0;
	_RndSpeed2 = 0;
	_RndSpeed3 = 0;
	_RndSpeed4 = 0;
	_SleepCondi = 2;
	//_time

	While {true} do {
		//waitUntil { vehicle player != player };
		If ( vehicle player != player ) Then {
			If ( _RandomFactor == 0 ) Then { _RandomFactor = selectRandom [-7,-6,-5,-4,-3,-2,2,3,4,5,6,7] ; };
			_MyVehicle = assignedVehicle player;
			_PoP_Class = typeOf _MyVehicle;
			_SelectSpeed = _SpeedLimit ;
			_TruckArray = [ "veh4x4",_PoP_Class ] call ica_fnc_vehiculoValidar ;
			If ( _TruckArray ) Then {_SelectSpeed = _SpeedLimit4x4 };
			If ( driver _MyVehicle == player and _MyVehicle isKindOf "Land" ) Then {
				While { vehicle player != player } do {
					If ( isOnRoad player OR (count (player nearRoads 20) > 0) ) Then {
						bkLimitadorOn = false ;
						titleText ["", "PLAIN DOWN"];
					} Else {
						If ( (speed player < (_SelectSpeed + _RandomFactor) - _SpeedDiferential) AND (speed player > (_SelectSpeed/2) * -1 ) ) Then { 
								bkLimitadorOn = false; 
								titleText ["", "PLAIN DOWN"];
						} Else { 
							If ( bkLimitador2 ) Then {
								titleText ["CUIDADO EVEL KNIEVEL!, EL VEHICULO NO VA A AGUANTAR MUCHO ESTE MALTRADO", "PLAIN DOWN"];
								_SleepCondi = 8 - ((speed player - _SelectSpeed) * 0.1);
								If ( _SleepCondi < 1 ) Then { _SleepCondi = 1 };
								sleep _SleepCondi;
								If ( !isOnRoad player AND (speed player >= (_SelectSpeed + _RandomFactor) - _SpeedDiferential) ) Then { 
									If ( speed player > (_SelectSpeed + 30) OR speed player < (_SelectSpeed/2) * -1 ) Then { _RndSpeed4 = 1} Else {_RndSpeed4 = 0};
									If ( speed player > (_SelectSpeed + 60) OR speed player < (_SelectSpeed/2) * -1 ) Then { _RndSpeed3 = 1} Else {_RndSpeed3 = 0};
									If ( speed player > (_SelectSpeed + 70) OR speed player < (_SelectSpeed/2) * -1 ) Then { _RndSpeed2 = 1} Else {_RndSpeed2 = 0};
									If ( speed player > (_SelectSpeed + 100) OR speed player < (_SelectSpeed/2) * -1 ) Then { _RndSpeed1 = 1} Else {_RndSpeed1 = 0};
									_MyVehicle setHit [selectRandom ["engine","wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering"], selectRandom [_RndSpeed1,_RndSpeed2,_RndSpeed3,_RndSpeed4,1] ];
								};
							} Else {
								bkLimitadorOn = true; 
								titleText ["FALLOS EN EL COCHE POR IT A CAMPO ATRAVEZ", "PLAIN DOWN"];
							};
						};
					};
					sleep 0.2;
				};
			};
		};
		sleep 0.5 ;
		//waitUntil { vehicle player == player };
		_RandomFactor = 0 ;
	};
};