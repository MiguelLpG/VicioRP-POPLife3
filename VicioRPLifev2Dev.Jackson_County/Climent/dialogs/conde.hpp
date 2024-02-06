// $[1.063,["1234",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],[1200,"fondo",[1,"autoequipador_mafias.paa",["0.045 * safezoneW + safezoneX","-0.335195 * safezoneH + safezoneY","0.95375 * safezoneW","1.65647 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"EquipaGenovesse",[1,"Genovesse",["0.658588 * safezoneW + safezoneX","0.640245 * safezoneH + safezoneY","0.0875 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1601,"beretta",[1,"Beretta",["0.535 * safezoneW + safezoneX","0.263361 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1602,"SantaMaria",[1,"Zetas",["0.6575 * safezoneW + safezoneX","0.736639 * safezoneH + safezoneY","0.0875 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1604,"NewHeaven",[1,"Porro",["0.523495 * safezoneW + safezoneX","0.640245 * safezoneH + safezoneY","0.0875 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1605,"Taurus",[1,"Taurus",["0.6575 * safezoneW + safezoneX","0.263361 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1606,"P90",[1,"P90",["0.535 * safezoneW + safezoneX","0.45824 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1607,"HK416",[1,"HK-416",["0.6575 * safezoneW + safezoneX","0.45824 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1603,"beretta20",[1,"+20",["0.535 * safezoneW + safezoneX","0.346881 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1608,"taurus20",[1,"+20",["0.6575 * safezoneW + safezoneX","0.346881 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1609,"p9020",[1,"+20",["0.535 * safezoneW + safezoneX","0.54176 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1610,"hk20",[1,"+20",["0.6575 * safezoneW + safezoneX","0.54176 * safezoneH + safezoneY","0.07 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1611,"nutria",[1,"Otter",["0.523495 * safezoneW + safezoneX","0.733742 * safezoneH + safezoneY","0.0875 * safezoneW","0.0556797 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1612,"exo",[1,"Exodus",["0.5875 * safezoneW + safezoneX","0.804381 * safezoneH + safezoneY","0.0881043 * safezoneW","0.056098 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]class automafia
class automafia {
	idd = 9638;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['automafia', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['automafia', nil]; ";
	
	class controls {

class fondo: RscPicture
{
	idc = 1200;
	text = "Climent\paa\autoequipador_mafias.paa";
	x = 0.045 * safezoneW + safezoneX;
	y = -0.335195 * safezoneH + safezoneY;
	w = 0.95375 * safezoneW;
	h = 1.65647 * safezoneH;
};
class EquipaGenovesse: RscButton
{
	idc = 1600;
	text = "Genovesse"; //--- ToDo: Localize;
	x = 0.658588 * safezoneW + safezoneX;
	y = 0.640245 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\genovesse.sqf";
};
class beretta: RscButton
{
	idc = 1601;
	text = "Beretta"; //--- ToDo: Localize;
	x = 0.535 * safezoneW + safezoneX;
	y = 0.263361 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\beretta.sqf";
};
class SantaMaria: RscButton
{
	idc = 1602;
	text = "Zetas"; //--- ToDo: Localize;
	x = 0.6575 * safezoneW + safezoneX;
	y = 0.736639 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\mdlr.sqf";

};
class NewHeaven: RscButton
{
	idc = 1604;
	text = "Porro"; //--- ToDo: Localize;
	x = 0.523495 * safezoneW + safezoneX;
	y = 0.640245 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\ananin.sqf";
};
class Taurus: RscButton
{
	idc = 1605;
	text = "Taurus"; //--- ToDo: Localize;
	x = 0.6575 * safezoneW + safezoneX;
	y = 0.263361 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\taurus.sqf";
};
class P90: RscButton
{
	idc = 1606;
	text = "P90"; //--- ToDo: Localize;
	x = 0.535 * safezoneW + safezoneX;
	y = 0.45824 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\p90.sqf";
};
class HK416: RscButton
{
	idc = 1607;
	text = "HK-416"; //--- ToDo: Localize;
	x = 0.6575 * safezoneW + safezoneX;
	y = 0.45824 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\416.sqf";
};
class beretta20: RscButton
{
	idc = 1603;
	text = "+20"; //--- ToDo: Localize;
	x = 0.535 * safezoneW + safezoneX;
	y = 0.346881 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\beretta20.sqf";
};
class taurus20: RscButton
{
	idc = 1608;
	text = "+20"; //--- ToDo: Localize;
	x = 0.6575 * safezoneW + safezoneX;
	y = 0.346881 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\taurus20.sqf";
};
class p9020: RscButton
{
	idc = 1609;
	text = "+20"; //--- ToDo: Localize;
	x = 0.535 * safezoneW + safezoneX;
	y = 0.54176 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\p9020.sqf";
};
class hk20: RscButton
{
	idc = 1610;
	text = "+20"; //--- ToDo: Localize;
	x = 0.6575 * safezoneW + safezoneX;
	y = 0.54176 * safezoneH + safezoneY;
	w = 0.07 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\hk20.sqf";
};
class nutria: RscButton
{
	idc = 1611;
	text = "Otter"; //--- ToDo: Localize;
	x = 0.523495 * safezoneW + safezoneX;
	y = 0.733742 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.0556797 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\otter.sqf";
};
class exo: RscButton
{
	idc = 1612;
	text = "Exodus"; //--- ToDo: Localize;
	x = 0.5875 * safezoneW + safezoneX;
	y = 0.804381 * safezoneH + safezoneY;
	w = 0.0881043 * safezoneW;
	h = 0.056098 * safezoneH;
	action = execVM "Climent\scripts\Autoequipmafia\exodus.sqf";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


	};
};




