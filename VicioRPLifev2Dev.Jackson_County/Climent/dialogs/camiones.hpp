// $[1.063,["2222",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"fondo",[1,"BackGround_Camiones.paa",["0.135836 * safezoneW + safezoneX","0.0792647 * safezoneH + safezoneY","0.698961 * safezoneW","0.813421 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"ruta1",[1,"Lakeside - Morrison ",["0.323791 * safezoneW + safezoneX","0.350405 * safezoneH + safezoneY","0.311306 * safezoneW","0.084147 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","2"],[]],[1601,"Ruta3",[1,"Lakeside - Diablos",["0.323791 * safezoneW + safezoneX","0.471952 * safezoneH + safezoneY","0.311306 * safezoneW","0.084147 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","2"],[]],[1602,"ruta2",[1,"Lakeside - Los Cerros",["0.323791 * safezoneW + safezoneX","0.595371 * safezoneH + safezoneY","0.311306 * safezoneW","0.084147 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","2"],[]],[0,"",[0,"#(argb,8,8,3)color(1,1,1,1)",[-1,-1,0,0],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1603,"",[1,"Comenzar Ruta",["0.377829 * safezoneW + safezoneX","0.730002 * safezoneH + safezoneY","0.23377 * safezoneW","0.0991065 * safezoneH"],[-1,-1,-1,-1],[0,0,0,1],[-1,-1,-1,-1],"","2"],[]]]


class camionesedu {
	idd = 9638;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['camionesedu', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['camionesedu', nil]; ";
	
	class controls {////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Dono y no tiro server, v1.063, #Lazone)
////////////////////////////////////////////////////////

class fondo: RscPicture
{
	idc = 1200;
	text = "Climent\paa\BackGround_Camiones.paa";
	x = 0.135836 * safezoneW + safezoneX;
	y = 0.0792647 * safezoneH + safezoneY;
	w = 0.698961 * safezoneW;
	h = 0.813421 * safezoneH;
};
class ruta1: RscButton
{
	idc = 1600;
	onButtonClick = "['comienzomorri'] spawn climent_fnc_camiones;";
	text = "Lakeside - Morrison "; //--- ToDo: Localize;
	x = 0.323791 * safezoneW + safezoneX;
	y = 0.350405 * safezoneH + safezoneY;
	w = 0.311306 * safezoneW;
	h = 0.084147 * safezoneH;
};
class Ruta3: RscButton
{
	idc = 1601;
	onButtonClick = "['comienzocerro'] spawn climent_fnc_camiones;";
	text = "Lakeside - Cerros"; //--- ToDo: Localize;
	x = 0.323791 * safezoneW + safezoneX;
	y = 0.471952 * safezoneH + safezoneY;
	w = 0.311306 * safezoneW;
	h = 0.084147 * safezoneH;
};
class ruta2: RscButton
{
	idc = 1602;
	onButtonClick = "['comienzodiablo'] spawn climent_fnc_camiones;";
	text = "Lakeside - Diablos"; //--- ToDo: Localize;
	x = 0.323791 * safezoneW + safezoneX;
	y = 0.595371 * safezoneH + safezoneY;
	w = 0.311306 * safezoneW;
	h = 0.084147 * safezoneH;
};
class RscButton_1603: RscButton
{
	idc = 1603;
	onButtonClick = "['confirmar'] spawn climent_fnc_camiones;";
	text = "Comenzar Ruta"; //--- ToDo: Localize;
	x = 0.377829 * safezoneW + safezoneX;
	y = 0.730002 * safezoneH + safezoneY;
	w = 0.23377 * safezoneW;
	h = 0.0991065 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


	};
};
