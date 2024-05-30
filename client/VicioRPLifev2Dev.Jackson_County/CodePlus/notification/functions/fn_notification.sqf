/* 
	File: fn_notification.sqf
	Author: CodePlus
	You can purchase this script on www.bytex.market
	YOU DONT HAVE ANY PERMISSION TO USE THIS SCRIPT, WITHOUT A PERMISSION FROM THE AUTHOR!	
*/
private["_display","_text","_description","_title","_type","_icon","_path","_color1","_color2","_time","_sound","_spam","_spamcooldown"];

_title = param [0,"This is a Headline",[""]];
_description = param [1,"This is a description or something else",[""]];
_style = param [2,"info",[""]];
_time = param [3,0];

_spam = getText(missionConfigFile >> "cplus_notification" >> "allowSpam");
_spamcooldown = getNumber(missionConfigFile >> "cplus_notification" >> "spamCooldown");
if((_spam isEqualto "false") && (last_description isEqualTo _description)) exitWith {sleep _spamcooldown; last_description = "none" };
if (isServer || !hasInterface) exitWith {};
disableSerialization;
_display = finddisplay 46;

if (_style isequalto "manual") then {
	_path = param [4]; 
	_color1 = param [5]; 
	_color2 = param [6];
	_sound = param [7]; 
	_type = param [8];
} else {
	_path = getText(missionConfigFile >> "cplus_notification" >> _style >> "path");
	_color1 = getArray(missionConfigFile >> "cplus_notification" >> _style >> "color1");
	_color2 = getText(missionConfigFile >> "cplus_notification" >> _style >> "color2");
	_sound = getText(missionConfigFile >> "cplus_notification" >> _style >> "sound");
	_type = getText(missionConfigFile >> "cplus_notification" >> _style >> "type");
};

_text = format["<t size='1.25' color='%1' font = 'PuristaBold' >%2</t><t size='0.01'> <br/> </t><t size='0.9' color='f9f9f0' font = 'PuristaMedium'>%3</t>",_color2,_title,_description];

private ["_sidebar","_group","_icon","_textbox","_textheight","_ctrlgroup","_delimeters","_texture"]; 

_ctrlgroup = [];

_group = _display ctrlCreate ["cplus_structuredText", -1];
_group ctrlSetStructuredText parsetext _text;
_group ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,(0.2 - 0.03) * safezoneW, 0.5];
_group ctrlCommit 0;
_textheight = (ctrlTextHeight _group);
if (_textheight < 0.12) then {_textheight = 0.12};
_textheight = _textheight + (20/1920);
_group ctrlSetStructuredText parsetext format [""];
_group ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.225 * safezoneW, (_textheight+ (0.005 * safezoneH))];
_group ctrlSetBackgroundColor [0,0,0,0.8];
_group ctrlSetFade 1;
_group ctrlCommit 0;
_group ctrlSetFade 0;
_group ctrlCommit 0.4;
_delimeters = count(_text splitString "-,.: ");

_texture = _display ctrlCreate ['cplus_picture', -1, _group];
_texture ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.2667  * safezoneW, 0.237  * safezoneH];
_texture ctrlSetText "CodePlus\notification\textures\header.paa";
_texture ctrlSetFade 1;
_texture ctrlCommit 0;
_texture ctrlSetFade 0;
_texture ctrlCommit 0.4; 

_textbox = _display ctrlCreate ["cplus_structuredText", -1, _group];
_textbox ctrlSetStructuredText parsetext format ["%1",_text];
_textbox ctrlSetPosition [(0.005+(25/1920)) * safezoneW + safezoneX, (0.0205+(6/1080)) * safezoneH + safezoneY,(0.2 - 0.03) * safezoneW, (_textheight+ (0.005 * safezoneH))];
_textbox ctrlCommit 0;
_textbox ctrlSetBackgroundColor [0,0,0,0];
_textbox ctrlSetFade 1;
_textbox ctrlCommit 0;
_textbox ctrlSetFade 0;
_textbox ctrlCommit 0.4;

_sidebar = _display ctrlCreate ['cplus_text', -1, _group];
_sidebar ctrlSetPosition [(0.005+(10/1920)) * safezoneW + safezoneX, (0.021+(10/1080)) * safezoneH + safezoneY, (8/1920) * safezoneW, ((ctrlPosition (_group)) select 3) - (10/1080*2 * safezoneH)];
_sidebar ctrlSetBackgroundColor _color1;
_sidebar ctrlSetFade 1;
_sidebar ctrlCommit 0;
_sidebar ctrlSetFade 0;
_sidebar ctrlCommit 0.4;

_icon = _display ctrlCreate ['cplus_picture', -1, _group];
_icon ctrlSetPosition [(ctrlPosition (_group) select 0) + (ctrlPosition (_group) select 2) - (0.006 * safezoneW) - (0.0666666667/2 * safezoneW), (ctrlPosition (_group) select 1) + (((ctrlPosition (_group)) select 3)/2) - ((0.12190476190/2/2) * safezoneH), 0.0666666667/2 * safezoneW, 0.12190476190/2 * safezoneH];
_icon ctrlSetText _path;
_icon ctrlSetFade 1;
_icon ctrlCommit 0;
_icon ctrlSetFade 0;
_icon ctrlCommit 0.4;

_ctrlgroup = [_group,_textbox,_sidebar,_icon,_texture];

playsound _sound;
systemChat format ["[%1] %2: %3",_type,_title,[_description] call cplus_notification_fnc_parsetext_to_str];

[_ctrlgroup,_time,_delimeters] spawn 
{
	disableSerialization;
	private _time = _this select 1;
	
	if (_time > 0) then 
	{
		uiSleep _time;
	} else 
	{
		private _delimeters = _this select 2;
		uiSleep (_delimeters * 0.32);
	};

	private _ctrlgroup1 = _this select 0;
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0.3;
	} foreach _ctrlgroup1;
	uiSleep 0.3;
	{
		ctrlDelete _x;
	} foreach _ctrlgroup1;
};



private ["_h_text","_note_group"];
_h_text = (ctrlPosition (_ctrlgroup select 0)) select 3;

if (count life_open_notes > 0) then 
{
	private _active_notes = 0;
 	{
 		_note_group = _x;

 		if (!isNull (_note_group select 0) && !isNull (_note_group select 1) && !isNull (_note_group select 2) && !isNull (_note_group select 3)) then 
		{

			{
				_x ctrlSetPosition [((ctrlPosition (_x)) select 0), ((ctrlPosition (_x)) select 1) + (_h_text + 1.5*(0.011 * safezoneH))];
			} foreach _note_group;
			{
				_x ctrlCommit 0.25;
			} foreach _note_group;
			
 			if (_active_notes > 3) then 
			{
 				{
					_x ctrlSetFade 1;
 					_x ctrlCommit 0.2;
				} foreach _note_group;
 			};
 			_active_notes = _active_notes + 1;
 		};
 	} forEach life_open_notes;
};
last_description = _description;
life_open_notes = ([_ctrlgroup] + life_open_notes) select {!isNull (_x select 0) && !isNull (_x select 1) && !isNull (_x select 2) && !isNull (_x select 3)}; //In Array einfügen


