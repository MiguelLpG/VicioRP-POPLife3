/*
    File: rotar_img.sqf
    Author: LoSantosYT
    Description:
    Rota las imagenes de la huella
*/
params ["_control"];
_n = round (random 5);
if (_n isEqualTo lastnum) then {
	if (lastnum isEqualTo 5) then {
		_n = 0;
	} else {
		_n = _n + 1;
	};
	
};
private _pic = '\ArmaGamingCore\LoSantosYT\huella\'+(str(_n))+'.jpg'; 
ctrlSetText [_control,_pic]; 
lastnum = _n;

switch (_control) do {
	case 1611: {pic1=_pic;};
	case 1612: {pic2=_pic;};
	case 1613: {pic3=_pic;};
	case 1614: {pic4=_pic;};
	case 1615: {pic5=_pic;};
	case 1616: {pic6=_pic;};
};

