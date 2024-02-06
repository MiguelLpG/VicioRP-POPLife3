




addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
	if(isNull _instigator)then{_instigator = _killer};	

		
		if(isPlayer _killer && {local _killer})then{

			if(
				_killed isKindOf "CAManBase"

						
			)then{
			
			_killed_Name = "";
			_kill_HUD = "";
			_killed_Color = "#1868F9";

			if(!(isplayer _killed))then{
				_killed_Name = getText (configFile >> "CfgVehicles" >> format["%1",typeOf _killed] >> "Displayname");
				}else{_killed_Name = name _killed};
			
			private _distance = _killer distance2D _killed;
			private _weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayname");
			_killed_Color = (side group _killed call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML;
			
			_weapon = currentWeapon _killer;
			_pictureweapon = gettext (configFile >> "cfgWeapons" >> _weapon >> "picture");
			if(_pictureweapon == "")then{
				_weapon = typeOf (vehicle _killer);
			_pictureweapon = (getText (configFile >> "cfgVehicles" >> _weapon >> "picture"));
			};

			
			_kill_HUD = format["<t size='0.6' font='PuristaBold'>Has matado a <t size='0.6'><t color='%1'>%2<t color='#FFFFFF'> a <t color='#FFD700'>%3 m de distancia</t>",_killed_Color,_killed_Name,floor _distance];	
			[_kill_HUD, nil,  1, 2, 0] spawn bis_fnc_dynamicText;
			
			
		};
	};			
}];