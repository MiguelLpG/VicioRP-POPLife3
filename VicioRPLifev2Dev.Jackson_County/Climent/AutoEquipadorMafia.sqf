if (side player == WEST) exitWith {hint "¿Para que quieres comprar aqui?"};
if (side player == independent) exitWith {hint "Puto EMS corrupto, ¡se lo voy a decir a todo el mundo!"};
createDialog "automafia";