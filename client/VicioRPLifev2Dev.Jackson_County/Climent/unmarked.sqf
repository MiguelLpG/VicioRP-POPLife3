hint format ["Hola %1, te estamos revisando",name player];
sleep 1;
hint "-";
sleep 0.1;
hint "--";
sleep 0.1;
hint "---";
sleep 0.1;
hint "----";
sleep 0.1;

if (call life_donator == 0) exitwith {titleText ["<t color='#ff0000' size='2'>No eres donador, abre un ticket de donación en Discord.</t><br/>", "PLAIN", -1, true, true];};

hint "Has sido aceptado para comprar en la Donador";
sleep 3;
hint "En breves momentos, te aparecerá una opción para abrir la tienda";
sleep 1;
_hola = player addAction["Vehiculos Policiales",life_fnc_vehicleShopMenu,["cop_don",west,"cop_car_2","cop","Vehiculos Lakeside"]];



sleep 15;

player removeAction _hola;