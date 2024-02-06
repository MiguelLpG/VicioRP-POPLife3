





diag_log "//________________ GF Headshot Script _____________";





GF_Killfeed_Headshot = { 

	_this addEventHandler ["hitpart", {
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

	if(isPlayer _shooter)then{ 

		if("head" in (_this select 0 select 5))then{
			((_this select 0) select 0) RemoveEventHandler ["HitPart",0];


				

			[parseText format  
			
			["<t align='center' font='PuristaBold' size='1.5'>""MOCHITA BY %1""</t>", name player ], 
			true, nil,  1, 0.7, 0] spawn BIS_fnc_textTiles; 

			//________________	_sounds	________________

			_sounds = selectRandom[
				"Headshot_edu2","Headshot_edu3","Headshot_edu5"
			];
				
			[[_shooter,_sounds] remoteExec ["say3D",_shooter]];


			};
		};
	}];
};


[]spawn{
	while{true}do{		
		{		
		if(
			((alive _x)) 
			&&(!(_x getVariable ["Var_GF_Killfeed",false]))		
			
			
		
		)then{			
			_x spawn GF_Killfeed_Headshot;			
			};						
			_x setVariable ["Var_GF_Killfeed",true];
			{waitUntil {!alive _x};
			_x setVariable ["Var_GF_Killfeed",false];
			};
		}forEach allUnits;
		uisleep 3;
	};
};

