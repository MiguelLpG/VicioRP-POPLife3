/*
    File: camara_acorazada.sqf
    Author: LoSantosYT
    Description:
    Abre y cierra la puerta de la camara acorazada
*/
params ["_vault"];
switch (_vault) do {
	case "Land_posckoo_decagon":
	{


		{  
			if (_x animationPhase "vault_2_rot" isEqualTo 0) then {   
				_x animate ["door_7_rot", 1];
			}else{
				_x animate ["door_7_rot", 0];
			}
		} forEach (nearestObjects [player, ["Land_posckoo_decagon"], 30]);
		
	};
	break;
	case "":
	break;
};
