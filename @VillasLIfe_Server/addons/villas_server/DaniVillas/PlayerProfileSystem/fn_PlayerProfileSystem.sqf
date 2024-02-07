/*
	Por: Dani Villas (vitro)
	Menú del jugador basado en el GTAHub
	Comencé a desarrollar esto para VicioRP, no usar este addon sin mi permiso por favor,
		si lo quieres usar, avisame y yo te paso todo lo que necesitas.

	PARAMS:
	[str] spawn ica_fnc_DaniVillasPlayerMenu;
	[menuAbrir] spawn ica_fnc_DaniVillasPlayerMenu;

*/


if (dialog) exitWith {};
_menu = _this select 0;
//---------------------------

if(_menu == "main") then {
	private ["_playerNameText", "_display", "_playerHash", "_playerStatsText", "_organizcacionPlayer", "_nivelJugador", "_SPsDisponibles", "_energiaDispo"];
	createDialog "newPlayerProfile";
	disableSerialization;

	while {!(isNull (findDisplay 19928))} do {
		if (isNull (findDisplay 19928)) exitWith{};
		_display = findDisplay 19928;

		// ----[ NOMBRE Y HASH DEL JUGADOR ]----
		_playerNameText = _display displayCtrl 1100;
		_playerHash = "TEST"; //CAMBIAR ESTO
		_playerNameText ctrlSetStructuredText parseText format[" <t size='2' font='PuristaBold' align = 'center'> %1#%2 </t>", name player, _playerHash];

		// ----[ ESTADÍSTICAS DEL JUGADOR ]----
		_nivelJugador = [] call ica_fnc_expToLevel;
		_SPsDisponibles = experiencia select 1;
		_energiaDispo = experiencia select 2;
		_XPToLVLUP = "next" call ica_fnc_expToLevel;
		_XPNextLevel = "%+" call ica_fnc_expToLevel;
		_EXPActual = ("%+" call ica_fnc_expToLevel) - ("%-" call ica_fnc_expToLevel) - ("next" call ica_fnc_expToLevel);
		_dineroMano = vicio_din;
		_dineroBanco = vicio_atmdin;
		_villasCoins = "0";
		_playerStatsText = _display displayCtrl 1101;


		_organizcacionPlayer = switch(playerSide) do {
			case WEST: {"FFCCSE"};
			case INDEPENDENT: {"EMS";};
		};

		if (isNil ((group player) getVariable "gang_owner")) {
			_organizcacionPlayer = "CIVIL";
		} else {
			_organizcacionPlayer = group player getVariable 'gang_name';
		};	

		_playerStatsText ctrlSetStructuredText parsetext format ["<t size='0.97' font='PuristaMedium' align = 'left'>nivel</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#FFFFFF'>%3 | (%6 / %7) </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>SP || energia</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#FFFFFF'>%4 || %5/1000 </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>dinero</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#00FF00'>%8 </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>en banco</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#FFFFFF'>%9 </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>VicioCoins</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#efb810'>%10 </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>tiempo jugado</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#FFFFFF'>Próximamente... </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>organización</t> <t size='0.97' font='PuristaMedium' align = 'right' color = '#FFFFFF'>%1 </t>
		<t size='0.97' font='PuristaMedium' align = 'left'><br/>steamid</t> <t size='0.97' font='PuristaMedium' align = 'right'>%2 </t>
		", _organizcacionPlayer, getPlayerUID player, _nivelJugador, _SPsDisponibles, _energiaDispo, _EXPActual, _XPNextLevel, _dineroMano, _dineroBanco, _villasCoins];
	};
};