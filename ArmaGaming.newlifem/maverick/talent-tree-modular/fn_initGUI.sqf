scriptName "fn_initGUI";

if (isServer && !hasInterface) exitWith {};

0 spawn compileFinal preprocessFileLineNumbers "maverick\talent-tree-modular\gui\_init.sqf";