// $[1.063,["menuincauntar",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"",[2,"#(argb,8,8,3)color(1,1,1,1)",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"infus",[1,"INCAUTAR FUSIL",["0.603125 * safezoneW + safezoneX","0.521954 * safezoneH + safezoneY","0.15125 * safezoneW","0.0768389 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"incsub",[1,"INCAUTAR SUBFUSIL",["0.4285 * safezoneW + safezoneX","0.521954 * safezoneH + safezoneY","0.144375 * safezoneW","0.0768389 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"incpis",[1,"INCAUTAR PISTOLA",["0.2525 * safezoneW + safezoneX","0.521954 * safezoneH + safezoneY","0.1375 * safezoneW","0.0768389 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
// $[1.063,["menuincauntar",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"fondo",[2,"moisesarmas.paa",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"infus",[1,"INCAUTAR FUSIL",["0.671875 * safezoneW + safezoneX","0.642701 * safezoneH + safezoneY","0.09625 * safezoneW","0.0658619 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"incsub",[1,"INCAUTAR SUBFUSIL",["0.548125 * safezoneW + safezoneX","0.642701 * safezoneH + safezoneY","0.09625 * safezoneW","0.0658619 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"incpis",[1,"INCAUTAR PISTOLA",["0.4175 * safezoneW + safezoneX","0.631724 * safezoneH + safezoneY","0.09625 * safezoneW","0.0768389 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

class menuinc
{
	idd = -1; // ID del display
	onLoad = "uiNamespace setVariable ['menuinc', _this select 0];"; // esto se lanza al cargar
	onUnLoad = "uiNamespace setVariable ['menuinc', nil]; "; // esto se lanza al descargar
	
class controls {////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Joel Bermudez, v1.063, #Piwovy)
////////////////////////////////////////////////////////

class fondo: RscPicture
{
	idc = 1200;
	text = "Climent\paa\moisesarmas.paa";
	x = 0.225 * safezoneW + safezoneX;
	y = 0.225575 * safezoneH + safezoneY;
	w = 0.55 * safezoneW;
	h = 0.54885 * safezoneH;
};
class infus: RscButton
{
	idc = 1600;
	text = "INCAUTAR FUSIL"; //--- ToDo: Localize;
	x = 0.671875 * safezoneW + safezoneX;
	y = 0.642701 * safezoneH + safezoneY;
	w = 0.09625 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\incautador\fusiles.sqf";
};
class incsub: RscButton
{
	idc = 1601;
	text = "INCAUTAR SUBFUSIL"; //--- ToDo: Localize;
	x = 0.548125 * safezoneW + safezoneX;
	y = 0.642701 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\incautador\subfus.sqf";
};
class incpis: RscButton
{
	idc = 1602;
	text = "INCAUTAR PISTOLA"; //--- ToDo: Localize;
	x = 0.43125 * safezoneW + safezoneX;
	y = 0.642701 * safezoneH + safezoneY;
	w = 0.09625 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\incautador\pistolas.sqf";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////





	};

};

