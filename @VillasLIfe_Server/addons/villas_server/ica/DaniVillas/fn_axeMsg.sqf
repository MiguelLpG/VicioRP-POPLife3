
/* 
AxE's  Msg hammer !

Uso: [obj aquien, str msg, str titulo, str pic classname,str arg1, str arg2, str arg3] call ica_fnc_axeMsg;
Para usar argumentos poner en el msg select 1, en ese string poner desde el %4 hasta el %6.

*/

params [["_tio",ObjNull],["_msg",""],["_titulo",""],["_pic",""],["_uno",""],["_dos",""],["_tres",""]];
if (isNull _tio) exitWith {};// WaTuFuk ?
if (isNil "_msg") exitWith {}; // WaTuFuk ?
if (isNil "_titulo") then {_titulo = "POPLife"};
if (isNil "_pic") then {_pic = "Cha_AKS74U";};

_pic1 = [_pic] call ica_fnc_classToPic;

	if (!isNil "_uno") then {
	
		if (!isNil "_dos") exitWith {
		
			if (!isNil "_tres") exitWith {
			[[_pic1, _titulo, _msg, _uno, _dos, _tres],{ hint parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>%2 </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> %3.</t>",_this select 0,_this select 1,_this select 2, _this select 3, _this select 4, _this select 5]}] remoteExec ["BIS_fnc_spawn",_tio];
			};
		[[_pic1, _titulo, _msg, _uno, _dos],{ hint parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>%2 </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> %3.</t>",_this select 0,_this select 1,_this select 2, _this select 3, _this select 4]}] remoteExec ["BIS_fnc_spawn",_tio];
		};
	[[_pic1, _titulo, _msg, _uno],{ hint parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>%2 </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> %3.</t>",_this select 0,_this select 1,_this select 2, _this select 3]}] remoteExec ["BIS_fnc_spawn",_tio];
	};
[[_pic1, _titulo, _msg],{ hint parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>%2 </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> %3.</t>",_this select 0,_this select 1,_this select 2]}] remoteExec ["BIS_fnc_spawn",_tio];
