/*_param = param [0];

aaa = addMissionEventHandler ["Draw3D",  

 { 
 
 if (player distance _param > 10) exitWith {}; 
  
 drawIcon3D ["\a3\ui_f\data\map\Markers\System\dummy_ca.paa",  
 [0.9,0.1,0.9,1], visiblePosition player vectorAdd [0,0,2.1], 0.2, 0.2, 45,format [ 
   
 "%1 - %2",name player, rango], 2, 0.07, "RobotoCondensedBold"]; 
 }];
*/

 //[player] remoteExec ["climent_fnc_nevcarcel",-2];


sleep 5;

_jaillocations = [ 
 [8728.72,7236.44,4.4669], 
 [8727.5,7235.36,4.4669], 
 [8728.12,7234.23,4.4669], 
 [8729.13,7235.16,4.4669], 
 [8730.56,7233.84,4.4669], 
 [8729.38,7232.88,4.4669], 
 [8732.78,7231.63,4.4669], 
 [8731.4,7230.65,4.4669], 
 [8730.37,7229.95,4.4669], 
 [8728.83,7228.5,4.4669], 
 [8730.19,7227.31,4.4669], 
 [8731.3,7228.13,4.4669], 
 [8732.95,7229.38,4.4669], 
 [8731.56,7229.29,4.4669] ]; 
 _randomer = floor random (count _jaillocations); 
 _jailpos = _jaillocations select _randomer; 
 
 player setPos _jailpos;