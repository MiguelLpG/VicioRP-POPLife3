if (isNil "enmision") exitwith {hint "No tienes ningún coche para mi"};
hint "Hola amigo, que carraso me has traido. Toma tu dinero.";
vicio_din = vicio_din + 150000;
deleteVehicle _veh;
deleteMarkerLocal "cocherob";