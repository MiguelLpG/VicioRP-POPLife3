_desbug = PLAYER addAction["Click a qui para desbugear ropa",life_fnc_clothingMenu,"desbug"];
hint "Dale a la rueda del ratón para desbugear la ropa";
sleep 5;
hint "Se te ha eliminado la opción para desbugeartela";
player removeAction _desbug;
closeDialog 0;