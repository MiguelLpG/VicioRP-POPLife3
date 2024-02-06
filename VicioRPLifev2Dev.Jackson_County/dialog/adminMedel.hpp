class life_admin_menu
{
    idd = 2900;
    name= "life_admin_menu";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_adminMenu; uiNameSpace setVariable ['life_admin_menu', _this select 0];";
	onUnLoad = "uiNameSpace setVariable ['life_admin_menu', nil];";

class controlsBackground {

class fondo: RscText
{
	idc = 1000;

	x = 0.253304 * safezoneW + safezoneX;
	y = 0.21577 * safezoneH + safezoneY;
	w = 0.560343 * safezoneW;
	h = 0.77539 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class cabecera: RscText
{
	idc = 1001;

	text = "Panel de Administración - VicioRP"; //--- ToDo: Localize;
	x = 0.253307 * safezoneW + safezoneX;
	y = 0.191461 * safezoneH + safezoneY;
	w = 0.56015 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0.702,0.102,0.102,1};
	colorBackground[] = {0,0,0,0.7};
};



};

	class controls {

class listaJugadores: RscListBox
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.26623 * safezoneW + safezoneX;
	y = 0.297527 * safezoneH + safezoneY;
	w = 0.240829 * safezoneW;
	h = 0.215042 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class infoJugador: RscStructuredText
{
	idc = 2903;

	x = 0.516446 * safezoneW + safezoneX;
	y = 0.662684 * safezoneH + safezoneY;
	w = 0.287381 * safezoneW;
	h = 0.252561 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class Fondo_botonera: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.26623 * safezoneW + safezoneX;
	y = 0.518179 * safezoneH + safezoneY;
	w = 0.242004 * safezoneW;
	h = 0.129546 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class fondo_botonera_2: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.265055 * safezoneW + safezoneX;
	y = 0.658944 * safezoneH + safezoneY;
	w = 0.243179 * safezoneW;
	h = 0.157076 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class fondo_botonera_3: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.26623 * safezoneW + safezoneX;
	y = 0.821628 * safezoneH + safezoneY;
	w = 0.240829 * safezoneW;
	h = 0.0934964 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class botonera_4: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.51762 * safezoneW + safezoneX;
	y = 0.260647 * safezoneH + safezoneY;
	w = 0.285479 * safezoneW;
	h = 0.134632 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class botonera_5: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.51762 * safezoneW + safezoneX;
	y = 0.400894 * safezoneH + safezoneY;
	w = 0.285479 * safezoneW;
	h = 0.0841429 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class botonera_6: RscText
{
	idc = 2902;
	onLBSelChanged = "[_this] spawn life_fnc_adminquery";

	x = 0.517621 * safezoneW + safezoneX;
	y = 0.49626 * safezoneH + safezoneY;
	w = 0.286654 * safezoneW;
	h = 0.155202 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class reparar: RscButton
{
	idc = 2904;
	onButtonClick = "[] spawn ica_fnc_adminReparar;";

	text = "Reparar"; //--- ToDo: Localize;
	x = 0.274453 * safezoneW + safezoneX;
	y = 0.875857 * safezoneH + safezoneY;
	w = 0.10534 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class llaves: RscButton
{
	idc = 2905;
	onButtonClick = "[] call ica_fnc_adminLlaves;";

	text = "Llaves"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.875857 * safezoneH + safezoneY;
	w = 0.105725 * safezoneW;
	h = 0.0224392 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class licencias: RscButton
{
	idc = 2907;
	onButtonClick = "[] call ica_fnc_adminLicencias;";

	text = "Licencias"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.77862 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
};
class fuego: RscButton
{
	idc = 2908;
	onButtonClick = "[] call ica_fnc_adminParticulas";

	text = "Fuego"; //--- ToDo: Localize;
	x = 0.391929 * safezoneW + safezoneX;
	y = 0.578537 * safezoneH + safezoneY;
	w = 0.10769 * safezoneW;
	h = 0.0238699 * safezoneH;
	colorBackground[] = {0.6,0,0,1};
};
class crashear: RscButton
{
	idc = 2911;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCrasheo;";

	text = "Crashear"; //--- ToDo: Localize;
	x = 0.590453 * safezoneW + safezoneX;
	y = 0.447642 * safezoneH + safezoneY;
	w = 0.0595255 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class cachear: RscButton
{
	idc = 2405;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_cacheo;";

	text = "Cachear"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.77862 * safezoneH + safezoneY;
	w = 0.105725 * safezoneW;
	h = 0.0224392 * safezoneH;
};
class iconoX: RscPicture
{
	idc = 1200;

	text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
	x = 0.794856 * safezoneW + safezoneX;
	y = 0.191461 * safezoneH + safezoneY;
	w = 0.0154689 * safezoneW;
	h = 0.022 * safezoneH;
};
class marcadores: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_adminMarcadores;";

	text = "Map Markers"; //--- ToDo: Localize;
	x = 0.273275 * safezoneW + safezoneX;
	y = 0.617806 * safezoneH + safezoneY;
	w = 0.0700978 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.6,0,0,1};
};
class nombres: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_nombres;";

	text = "Markers"; //--- ToDo: Localize;
	x = 0.430693 * safezoneW + safezoneX;
	y = 0.617806 * safezoneH + safezoneY;
	w = 0.0689231 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.6,0,0,1};
};
class vestirse: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_adminvestirse;";

	text = "Vestirse"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.528049 * safezoneH + safezoneY;
	w = 0.10769 * safezoneW;
	h = 0.0294796 * safezoneH;
	colorBackground[] = {66,240,97,0.4};
};
class congelar: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCongelar;";

	text = "Congelar"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.447642 * safezoneH + safezoneY;
	w = 0.0595255 * safezoneW;
	h = 0.022 * safezoneH;
};
class voyATI: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyati;";

	text = "VOY A TI"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.703823 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
};
class invisible: RscButton
{
	idc = 2911;
	onButtonClick = "[] call ica_fnc_invisible;";

	text = "Invisible"; //--- ToDo: Localize;
	x = 0.273275 * safezoneW + safezoneX;
	y = 0.578537 * safezoneH + safezoneY;
	w = 0.10769 * safezoneW;
	h = 0.0238699 * safezoneH;
	colorBackground[] = {0.6,0,0,1};
};
class revivir: RscButton
{
	idc = 2911;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminRevivir;";

	text = "Revivir"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.836588 * safezoneH + safezoneY;
	w = 0.10534 * safezoneW;
	h = 0.022 * safezoneH;
};
class buscador: RscEdit
{
	idc = 1400;

	x = 0.26623 * safezoneW + safezoneX;
	y = 0.260128 * safezoneH + safezoneY;
	w = 0.239412 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
};
class venAMI: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_venami;";

	text = "VEN A MI"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.703823 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
};
class curar: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminCurar;";

	text = "Curar"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.836588 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
};
class espectador: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_adminEspectador;";

	text = "Espectador"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.670164 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
};
class recoil: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_recoil;";

	text = "No Recoil"; //--- ToDo: Localize;
	x = 0.724372 * safezoneW + safezoneX;
	y = 0.541139 * safezoneH + safezoneY;
	w = 0.074797 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class texto: RscEdit
{
	idc = 1700;

	x = 0.270929 * safezoneW + safezoneX;
	y = 0.930085 * safezoneH + safezoneY;
	w = 0.42797 * safezoneW;
	h = 0.0439999 * safezoneH;
};
class enviar: RscButton
{
	idc = 2911;
	onButtonClick = "[] call ica_fnc_mensaje;";

	text = "Enviar"; //--- ToDo: Localize;
	x = 0.718499 * safezoneW + safezoneX;
	y = 0.930085 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.0402601 * safezoneH;
};
class gasolina: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_llenarVehiculo;";

	text = "Gasolina"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.670164 * safezoneH + safezoneY;
	w = 0.106515 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class matar: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_killAdmin;";

	text = "Matar"; //--- ToDo: Localize;
	x = 0.741993 * safezoneW + safezoneX;
	y = 0.348535 * safezoneH + safezoneY;
	w = 0.0454289 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class marcadoresVehiculo: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_marcadoresVehiculo;";

	text = "Veh Markers"; //--- ToDo: Localize;
	x = 0.351985 * safezoneW + safezoneX;
	y = 0.617806 * safezoneH + safezoneY;
	w = 0.0700981 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.6,0,0,1};
};
class dia: RscButton
{
	idc = 2908;
	onButtonClick = "[] call ica_fnc_dedia;";

	text = "Dia"; //--- ToDo: Localize;
	x = 0.741993 * safezoneW + safezoneX;
	y = 0.275608 * safezoneH + safezoneY;
	w = 0.0466037 * safezoneW;
	h = 0.022 * safezoneH;
};
class arsenal: RscButton
{
	idc = 2908;
	onButtonClick = "[] call ica_fnc_adminarsenal";

	text = "Arsenal"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.50561 * safezoneH + safezoneY;
	w = 0.0798808 * safezoneW;
	h = 0.0243091 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class gesRol: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_dineroAdmin;";

	text = "Dinero Local"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.541137 * safezoneH + safezoneY;
	w = 0.0800174 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0.85,0.85,0,1};
};
class vehGOD: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_vehGOD;";

	text = "God Mode Veh"; //--- ToDo: Localize;
	x = 0.612773 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.107043 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class dejarEnBolas: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_equipo;";

	text = "Dejar en Bolas"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.413983 * safezoneH + safezoneY;
	w = 0.128188 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class forzarDesconexion: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_forzarDesconexionAdmin;";

	text = "Al Lobby"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.313007 * safezoneH + safezoneY;
	w = 0.105868 * safezoneW;
	h = 0.022 * safezoneH;
};
class kick: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_kickAdmin;";

	text = "Kick"; //--- ToDo: Localize;
	x = 0.633919 * safezoneW + safezoneX;
	y = 0.313007 * safezoneH + safezoneY;
	w = 0.0964707 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class explotar: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_explotar;";

	text = "Explotar Jugador"; //--- ToDo: Localize;
	x = 0.72316 * safezoneW + safezoneX;
	y = 0.507476 * safezoneH + safezoneY;
	w = 0.0765008 * safezoneW;
	h = 0.0220002 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class sacarDelVehiculo: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_sacarDelVehiculo;";

	text = "Expulsar del Vehiculo"; //--- ToDo: Localize;
	x = 0.633919 * safezoneW + safezoneX;
	y = 0.348535 * safezoneH + safezoneY;
	w = 0.0964707 * safezoneW;
	h = 0.022 * safezoneH;
};
class voyAtuVeh: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_voyatuVeh;";

	text = "Voy a tu Vehiculo"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.739352 * safezoneH + safezoneY;
	w = 0.107043 * safezoneW;
	h = 0.0238699 * safezoneH;
};
class venAmiVeh: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_moverEnMiVeh;";

	text = "Ven a mi Vehiculo"; //--- ToDo: Localize;
	x = 0.391925 * safezoneW + safezoneX;
	y = 0.739352 * safezoneH + safezoneY;
	w = 0.105868 * safezoneW;
	h = 0.0238699 * safezoneH;
};
class gesDineroC: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_dineroAdminC;";

	text = "Gestionar Dinero Cartera"; //--- ToDo: Localize;
	x = 0.612773 * safezoneW + safezoneX;
	y = 0.50748 * safezoneH + safezoneY;
	w = 0.107043 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0.85,0.85,0,1};
};
class gesDineroB: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_dineroAdminB;";

	text = "Gestionar Dinero Banco"; //--- ToDo: Localize;
	x = 0.612773 * safezoneW + safezoneX;
	y = 0.541139 * safezoneH + safezoneY;
	w = 0.107043 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0.85,0.85,0,1};
};
class reiniciarRobosEnCurso: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_reiniciarRobosCurso;";

	text = "Reiniciar Robos en Curso"; //--- ToDo: Localize;
	x = 0.521145 * safezoneW + safezoneX;
	y = 0.275608 * safezoneH + safezoneY;
	w = 0.107043 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class reiniciarRobos: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn ica_fnc_reiniciarRobos;";

	text = "Reiniciar Robo"; //--- ToDo: Localize;
	x = 0.633919 * safezoneW + safezoneX;
	y = 0.275608 * safezoneH + safezoneY;
	w = 0.0976454 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.5,0.1,0.9,1};
};
class luna: RscButton
{
	idc = 2911;
	onButtonClick = "[] remoteexec ['ica_fnc_luna', 0];";

	text = "Luna"; //--- ToDo: Localize;
	x = 0.741993 * safezoneW + safezoneX;
	y = 0.313007 * safezoneH + safezoneY;
	w = 0.0466037 * safezoneW;
	h = 0.022 * safezoneH;
};
class esposar: RscButton
{
	idc = 2911;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_esposarJugador;";

	text = "Esposar"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.348535 * safezoneH + safezoneY;
	w = 0.0501278 * safezoneW;
	h = 0.022 * safezoneH;
};
class quitarEsposas: RscButton
{
	idc = 2911;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_desesposarJugador;";

	text = "Desesposar"; //--- ToDo: Localize;
	x = 0.577532 * safezoneW + safezoneX;
	y = 0.348535 * safezoneH + safezoneY;
	w = 0.0501278 * safezoneW;
	h = 0.022 * safezoneH;
};
class entrarServicio: RscButton
{
	idc = 5908;
	onButtonClick = "[] spawn ica_fnc_entrarServicioAdmin;";

	text = "Entrar / Salir de Servicio"; //--- ToDo: Localize;
	x = 0.273278 * safezoneW + safezoneX;
	y = 0.527789 * safezoneH + safezoneY;
	w = 0.108218 * safezoneW;
	h = 0.0297398 * safezoneH;
	colorBackground[] = {66,240,97,0.4};
};
class spawnearVehiculo: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn VVS_fnc_openVVS;";

	text = "Spawnear Veh"; //--- ToDo: Localize;
	x = 0.52232 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.0811993 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class quitarNiebla: RscButton
{
	idc = 2911;
	onButtonClick = "[] remoteexec ['ica_fnc_quitarNiebla', 0];";

	text = "Quitar Niebla"; //--- ToDo: Localize;
	x = 0.662112 * safezoneW + safezoneX;
	y = 0.413983 * safezoneH + safezoneY;
	w = 0.131327 * safezoneW;
	h = 0.022 * safezoneH;
};
class quitarLluvia: RscButton
{
	idc = 2911;
	onButtonClick = "[] remoteexec ['ica_fnc_quitarLluvia', 0];";

	text = "Quitar Lluvia"; //--- ToDo: Localize;
	x = 0.662112 * safezoneW + safezoneX;
	y = 0.447642 * safezoneH + safezoneY;
	w = 0.131327 * safezoneW;
	h = 0.022 * safezoneH;
};
class copiarEquipa: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_copiarEquipacion;";

	text = "Copiar Equipacion"; //--- ToDo: Localize;
	x = 0.662112 * safezoneW + safezoneX;
	y = 0.615936 * safezoneH + safezoneY;
	w = 0.125839 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class ponerEquipa: RscButton
{
	idc = 2908;
	onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_ponEquipacion;";

	text = "Poner Equipacion"; //--- ToDo: Localize;
	x = 0.523495 * safezoneW + safezoneX;
	y = 0.615936 * safezoneH + safezoneY;
	w = 0.125839 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
class drops: RscButton
{
	idc = 2908;
	onButtonClick = "[] spawn climent_fnc_ClimentAirdrop;";

	text = "Drop"; //--- ToDo: Localize;
	x = 0.724372 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.074797 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.2,0.1,0.9,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};

