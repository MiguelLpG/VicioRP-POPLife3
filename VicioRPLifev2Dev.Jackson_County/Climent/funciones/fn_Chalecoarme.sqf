if (side player == WEST) exitwith {hint "Eres un madero, pa que quieres esto";};
if (side player == INDEPENDENT) exitwith {hint "Eres un EMS, pa que quieres esto";};

_dinero = 15000;
if (vicio_din - _dinero < 0) exitwith {hint "No tienes suficiente dinero";};

player addVest "k_hrebel_1";
vicio_din = vicio_din - _dinero;
titleText ["<t color='#ff0000' size='2'>Mochea muchos calvos</t><br/>", "PLAIN", -1, true, true];
hint "Gracias por la compra";
