_carro = vehicle player;
_ultimoEstado = locked _carro;

while(vehicle player != player) {
    if (speed _carro >= 20) then {
          [_carro,2] remoteexeccall ["life_fnc_lockVehicle",_carro];
    } else {
        if(_ultimoEstado == 2) {
            [_carro,2] remoteexeccall ["life_fnc_lockVehicle",_carro];
        }else{ 
          [_carro,0] remoteexeccall ["life_fnc_lockVehicle",_carro];
        };
    };
}: