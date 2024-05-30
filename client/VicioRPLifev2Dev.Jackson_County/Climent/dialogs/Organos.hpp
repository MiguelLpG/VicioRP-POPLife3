// $[1.063,["menuorg",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"fondo",[1,"FONDoorg.paa",["0.26625 * safezoneW + safezoneX","0.225575 * safezoneH + safezoneY","0.48125 * safezoneW","0.559827 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1201,"ojo",[1,"ojosico.paa",["0.28 * safezoneW + safezoneX","0.368276 * safezoneH + safezoneY","0.12375 * safezoneW","0.186609 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1202,"estom",[1,"estomago.paa",["0.410625 * safezoneW + safezoneX","0.357299 * safezoneH + safezoneY","0.17875 * safezoneW","0.21954 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1203,"corazon",[1,"corazonico.paa",["0.59625 * safezoneW + safezoneX","0.379253 * safezoneH + safezoneY","0.12375 * safezoneW","0.186609 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"vojo",[1,"Vender Ojo",["0.29375 * safezoneW + safezoneX","0.620747 * safezoneH + safezoneY","0.11 * safezoneW","0.0658619 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"vest",[1,"Vender Estomago",["0.445 * safezoneW + safezoneX","0.620747 * safezoneH + safezoneY","0.11 * safezoneW","0.0658619 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"Vcor",[1,"Vender CorazÃ³n",["0.59625 * safezoneW + safezoneX","0.620747 * safezoneH + safezoneY","0.11 * safezoneW","0.0658619 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]

class menuorg
{
	idd = -1; // ID del display
	onLoad = "uiNamespace setVariable ['menuorg', _this select 0];"; // esto se lanza al cargar
	onUnLoad = "uiNamespace setVariable ['menuorg', nil]; "; // esto se lanza al descargar
	
class controls {////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Mateo Contreras, v1.063, #Laqore)
////////////////////////////////////////////////////////

class fondo: RscPicture
{
	idc = 1200;
	text = "VillasLifeCore\images\climent\FONDoorg.paa";
	x = 0.26625 * safezoneW + safezoneX;
	y = 0.225575 * safezoneH + safezoneY;
	w = 0.48125 * safezoneW;
	h = 0.559827 * safezoneH;
};
class ojo: RscPicture
{
	idc = 1201;
	text = "VillasLifeCore\images\climent\ojosico.paa";
	x = 0.28 * safezoneW + safezoneX;
	y = 0.368276 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.186609 * safezoneH;
};
class estom: RscPicture
{
	idc = 1202;
	text = "VillasLifeCore\images\climent\estomago.paa";
	x = 0.410625 * safezoneW + safezoneX;
	y = 0.357299 * safezoneH + safezoneY;
	w = 0.17875 * safezoneW;
	h = 0.21954 * safezoneH;
};
class corazon: RscPicture
{
	idc = 1203;
	text = "VillasLifeCore\images\climent\corazonico.paa";
	x = 0.59625 * safezoneW + safezoneX;
	y = 0.379253 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.186609 * safezoneH;
};
class vojo: RscButton
{
	idc = 1600;
	text = "Vender Ojo"; //--- ToDo: Localize;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.620747 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\ventaorg\ojo.sqf";
};
class vest: RscButton
{
	idc = 1601;
	text = "Vender Estomago"; //--- ToDo: Localize;
	x = 0.445 * safezoneW + safezoneX;
	y = 0.620747 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\ventaorg\estomago.sqf";
};
class Vcor: RscButton
{
	idc = 1602;
	text = "Vender Corazón"; //--- ToDo: Localize;
	x = 0.59625 * safezoneW + safezoneX;
	y = 0.620747 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.0658619 * safezoneH;
	action = execVM "Climent\scripts\ventaorg\corazon.sqf";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




};

};

