class AutoEquipador
{
	idd = 1; // ID del display
	onLoad = "uiNamespace setVariable ['AutoEquipador', _this select 0];"; // esto se lanza al cargar
	onUnLoad = "uiNamespace setVariable ['AutoEquipador', nil]; "; // esto se lanza al descargar
	
class controls {////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Joel Bermudez, v1.063, #Vukebu)
////////////////////////////////////////////////////////

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "VillasLifeCore\images\climent\456.paa";
	x = 0.21125 * safezoneW + safezoneX;
	y = -0.0159186 * safezoneH + safezoneY;
	w = 0.598125 * safezoneW;
	h = 1.00988 * safezoneH;
};
class SargentoGC: RscButton
{
	idc = 1611;
	text = "Sargento - Sargento Primero"; //--- ToDo: Localize;
	x = 0.51375 * safezoneW + safezoneX;
	y = 0.532931 * safezoneH + safezoneY;
	w = 0.17875 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\sargento.sqf";
	colorText[] = {0,0,0,1};
};
class ReclutaCNP: RscButton
{
	idc = 1600;
	text = "Recluta"; //--- ToDo: Localize;
	x = 0.34875 * safezoneW + safezoneX;
	y = 0.269483 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\reclutacnp.sqf";
	colorText[] = {0,0,0,1};
};
class AgenteCNP: RscButton
{
	idc = 1601;
	text = "Agente - Agente 2º"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.335345 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\agentecnp.sqf";
	colorText[] = {0,0,0,1};
};
class OficialCNP: RscButton
{
	idc = 1602;
	text = "Oficial"; //--- ToDo: Localize;
	x = 0.341875 * safezoneW + safezoneX;
	y = 0.467069 * safezoneH + safezoneY;
	w = 0.09625 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\oficialcnp.sqf";
	colorText[] = {0,0,0,1};
};
class ComisarioCNP: RscButton
{
	idc = 1603;
	text = "Comisario"; //--- ToDo: Localize;
	x = 0.341875 * safezoneW + safezoneX;
	y = 0.741494 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\comicnp.sqf";
	colorText[] = {0,0,0,1};
};
class ReclutaGC: RscButton
{
	idc = 1606;
	text = "Cadete"; //--- ToDo: Localize;
	x = 0.548125 * safezoneW + safezoneX;
	y = 0.269483 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\cadetegc.sqf";
	colorText[] = {0,0,0,1};
};
class AgenteGC: RscButton
{
	idc = 1607;
	text = "Guardia - Guardia 1º"; //--- ToDo: Localize;
	x = 0.534375 * safezoneW + safezoneX;
	y = 0.335345 * safezoneH + safezoneY;
	w = 0.116875 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\guardia1.sqf";
	colorText[] = {0,0,0,1};
};
class ComisarioGC: RscButton
{
	idc = 1609;
	text = "Capitán General"; //--- ToDo: Localize;
	x = 0.555 * safezoneW + safezoneX;
	y = 0.730517 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\comigc.sqf";
	colorText[] = {0,0,0,1};
};
class Agente1CNP: RscButton
{
	idc = 1604;
	text = "Agente 1º - Sub Oficial"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.401207 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\agente1cnp.sqf";
	colorText[] = {0,0,0,1};
};
class caboGC: RscButton
{
	idc = 1605;
	text = "Cabo - Cabo Primero"; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.401207 * safezoneH + safezoneY;
	w = 0.11 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\cabo.sqf";
	colorText[] = {0,0,0,1};
};
class CaboMGC: RscButton
{
	idc = 1608;
	text = "Cabo Mayor"; //--- ToDo: Localize;
	x = 0.548125 * safezoneW + safezoneX;
	y = 0.467069 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\caboM.sqf";
	colorText[] = {0,0,0,1};
};
class SubInspectCNP: RscButton
{
	idc = 1610;
	text = "Sub Inspector - Inspector"; //--- ToDo: Localize;
	x = 0.300625 * safezoneW + safezoneX;
	y = 0.532931 * safezoneH + safezoneY;
	w = 0.17875 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\subinspcnp.sqf";

	colorText[] = {0,0,0,1};
};
class InJCNP: RscButton
{
	idc = 1612;
	text = "Inspector Jefe"; //--- ToDo: Localize;
	x = 0.341875 * safezoneW + safezoneX;
	y = 0.598793 * safezoneH + safezoneY;
	w = 0.09625 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\inscnp.sqf";
	colorText[] = {0,0,0,1};
};
class TenienteGC: RscButton
{
	idc = 1613;
	text = "Teniente"; //--- ToDo: Localize;
	x = 0.548125 * safezoneW + safezoneX;
	y = 0.598793 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\Teniente.sqf";
	colorText[] = {0,0,0,1};
};
class CapitanGC: RscButton
{
	idc = 1614;
	text = "Capitán"; //--- ToDo: Localize;
	x = 0.548125 * safezoneW + safezoneX;
	y = 0.664655 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\Capi.sqf";
	colorText[] = {0,0,0,1};
};
class SubComCNP: RscButton
{
	idc = 1615;
	text = "Jefe Superior"; //--- ToDo: Localize;
	x = 0.341875 * safezoneW + safezoneX;
	y = 0.664655 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\subco.sqf";

	colorText[] = {0,0,0,1};
};
class uipas: RscButton
{
	idc = 1616;
	text = "UIP Asalto"; //--- ToDo: Localize;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.851264 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\uipa.sqf";
	colorText[] = {0,0,1,1};
};
class uipneg: RscButton
{
	idc = 1617;
	text = "UIP Negociador"; //--- ToDo: Localize;
	x = 0.245625 * safezoneW + safezoneX;
	y = 0.851264 * safezoneH + safezoneY;
	w = 0.089375 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\uipn.sqf";
	colorText[] = {0,0,1,1};
};
class geo: RscButton
{
	idc = 1618;
	text = "GEO"; //--- ToDo: Localize;
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.851264 * safezoneH + safezoneY;
	w = 0.075625 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\geo.sqf";
	colorText[] = {0.85,0.85,0,1};
};
class pilotocnp: RscButton
{
	idc = 1619;
	text = "Piloto CNP"; //--- ToDo: Localize;
	x = 0.6375 * safezoneW + safezoneX;
	y = 0.851264 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\gapcnp.sqf";
	colorText[] = {0.85,0.4,0,1};
};
class pilotogc: RscButton
{
	idc = 1620;
	text = "Piloto GC"; //--- ToDo: Localize;
	x = 0.70625 * safezoneW + safezoneX;
	y = 0.851264 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.054885 * safezoneH;
	action = execVM "Climent\scripts\gapgc.sqf";
	colorText[] = {0.85,0.4,0,1};
};
class atgc: RscButton
{
	idc = 1621;
	text = "ATGC"; //--- ToDo: Localize;
	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 28.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	action = execVM "Climent\scripts\atgc.sqf";
	colorText[] = {0,0.8,0,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////




 
	
};
};

