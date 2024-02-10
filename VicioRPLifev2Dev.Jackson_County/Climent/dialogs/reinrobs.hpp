class desrob
{
	idd = -1; // ID del display
	onLoad = "uiNamespace setVariable ['desrob', _this select 0];"; // esto se lanza al cargar
	onUnLoad = "uiNamespace setVariable ['desrob', nil]; "; // esto se lanza al descargar
	
class controls {////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Edu Climent, v1.063, #Nywufo)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "\VillasLifeCore\images\climent\reiniciador.paa";
	x = 0.185173 * safezoneW + safezoneX;
	y = 0.1952 * safezoneH + safezoneY;
	w = 0.593236 * safezoneW;
	h = 0.714317 * safezoneH;
};
class banco: RscButton
{
	idc = 1600;
	text = "Reiniciar Banco"; //--- ToDo: Localize;
	x = 0.218066 * safezoneW + safezoneX;
	y = 0.715042 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\banco.sqf";

};
class blas: RscButton
{
	idc = 1601;
	text = "Reiniciar Blas de Lezo"; //--- ToDo: Localize;
	x = 0.218066 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\blas.sqf";

};
class mil: RscButton
{
	idc = 1602;
	text = "Reiniciar Militar"; //--- ToDo: Localize;
	x = 0.218066 * safezoneW + safezoneX;
	y = 0.425203 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\militar.sqf";
};
class c7: RscButton
{
	idc = 1603;
	text = "Reiniciar Club 7"; //--- ToDo: Localize;
	x = 0.218066 * safezoneW + safezoneX;
	y = 0.294307 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\c7.sqf";
};
class manolo: RscButton
{
	idc = 1604;
	text = "Reiniciar Manolo"; //--- ToDo: Localize;
	x = 0.640967 * safezoneW + safezoneX;
	y = 0.294307 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\manolo.sqf";
};
class paco: RscButton
{
	idc = 1605;
	text = "Reiniciar Paco"; //--- ToDo: Localize;
	x = 0.640967 * safezoneW + safezoneX;
	y = 0.425203 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\paco.sqf";
};
class putas: RscButton
{
	idc = 1606;
	text = "Reiniciar Casa Putas"; //--- ToDo: Localize;
	x = 0.640967 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\putas.sqf";
};
class tropa: RscButton
{
	idc = 1607;
	text = "Reiniciar Tienda Ropa"; //--- ToDo: Localize;
	x = 0.640967 * safezoneW + safezoneX;
	y = 0.715042 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\tiendaropa.sqf";
};
class nuke: RscButton
{
	idc = 1608;
	text = "Reiniciar Nuclear"; //--- ToDo: Localize;
	x = 0.429517 * safezoneW + safezoneX;
	y = 0.294307 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\nuclear.sqf";
};
class Sucurs: RscButton
{
	idc = 1609;
	text = "Reiniciar Sucursal"; //--- ToDo: Localize;
	x = 0.429517 * safezoneW + safezoneX;
	y = 0.425203 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\sucurs.sqf";
};
class hotel: RscButton
{
	idc = 1610;
	text = "Reiniciar Hotel"; //--- ToDo: Localize;
	x = 0.429517 * safezoneW + safezoneX;
	y = 0.574797 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\hotel.sqf";
};
class farma: RscButton
{
	idc = 1611;
	text = "Reiniciar Farmacia"; //--- ToDo: Localize;
	x = 0.429517 * safezoneW + safezoneX;
	y = 0.715042 * safezoneH + safezoneY;
	w = 0.0939779 * safezoneW;
	h = 0.084147 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\farmacia.sqf";
};
class Rrobos: RscButton
{
	idc = 1612;
	text = "Reiniciar Robos (robosactivos = 0)"; //--- ToDo: Localize;
	x = 0.312044 * safezoneW + safezoneX;
	y = 0.851548 * safezoneH + safezoneY;
	w = 0.328923 * safezoneW;
	h = 0.0467484 * safezoneH;
	action = execVM "Climent\scripts\desbugeador_robos\reiniciador_poli.sqf";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////







	};

};

