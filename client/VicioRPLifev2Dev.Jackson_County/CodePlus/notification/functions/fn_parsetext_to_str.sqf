/* 
	File: fn_parsetext_to_str.sqf
	Author: CodePlus
	You can purchase this script on www.bytex.market
	YOU DONT HAVE ANY PERMISSION TO USE THIS SCRIPT, WITHOUT A PERMISSION FROM THE AUTHOR!	
*/
private["_act","_text","_noend","_actstr0","_actstr1"];


_text = param [0,"ERROR in fn_parsetext_to_str",[""]];


_text = _text splitstring "";

_actstr0 = 0;
_actstr1 = 0;
_noend = false;

{
	if (_x isequalto "<") then 
	{
		_noend = true;
		_actstr1 = _actstr0;
		while {_noend} do
		{
			if ((_text select _actstr1) isequalto ">") then {_noend = false;};
			_text set [_actstr1,""];
			_actstr1 = _actstr1 + 1;
		};
	};
	_actstr0 = _actstr0 + 1;
} foreach _text;

_text = _text joinstring "";

_text;

