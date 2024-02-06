scriptName "fn_disableLight";
/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/
#define __filename "fn_disableLight.sqf"

_v = param[0,objNull,[objNull]];

deleteVehicle (_v getVariable ["mav_tuning_light",objNull]);