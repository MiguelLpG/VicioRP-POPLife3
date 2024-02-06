private["_building","_arr","_restricted","_exitLoop","_i"];
	_building = _this select 0;
	_arr = [];

	_restricted = switch(typeOf _building) do
	{
case "Land_i_House_Big_02_V1_F": {[[3.37305,2.36914,-2.62327,-90],[3.78564,2.76465,0.784061,-90],[-3.39355,2.1582,0.784061,-180]]};
case "Land_i_House_Big_02_V2_F": {[[3.37305,2.36914,-2.62327,-90],[3.78564,2.76465,0.784061,-90],[-3.39355,2.1582,0.784061,-180]]};
case "Land_i_House_Big_02_V3_F": {[[3.37305,2.36914,-2.62327,-90],[3.78564,2.76465,0.784061,-90],[-3.39355,2.1582,0.784061,-180]]};
case "Land_i_House_Big_01_V1_F": {[[0.997314,-0.0429688,-2.56493,-90],[0.806641,-0.0585938,0.855066,-90],[2.08496,-4.25977,0.855064,-90],[2.42041,6.57031,0.855066,-90]]};
case "Land_i_House_Big_01_V2_F": {[[0.997314,-0.0429688,-2.56493,-90],[0.806641,-0.0585938,0.855066,-90],[2.08496,-4.25977,0.855064,-90],[2.42041,6.57031,0.855066,-90]]};
case "Land_i_House_Big_01_V3_F": {[[0.997314,-0.0429688,-2.56493,-90],[0.806641,-0.0585938,0.855066,-90],[2.08496,-4.25977,0.855064,-90],[2.42041,6.57031,0.855066,-90]]};
case "Land_i_House_Small_01_V1_F": {[[-2.45215,-1.53906,-1.04179,-90]]};
case "Land_i_House_Small_01_V2_F": {[[-2.45215,-1.53906,-1.04179,-90]]};
case "Land_i_House_Small_01_V3_F": {[[-2.45215,-1.53906,-1.04179,-90]]};
case "Land_i_House_Small_02_V1_F": {[[5.95363,1.59488,-0.7,-90],[2.59414,-2.20007,-0.704403,90]]};
case "Land_i_House_Small_02_V2_F": {[[6.97363,-1.25488,-0.699268,-90],[2.99414,-2.20007,-0.704403,-130]]};
case "Land_i_House_Small_02_V3_F": {[[6.97363,-1.25488,-0.699268,-90],[2.99414,-2.20007,-0.704403,-130]]};
case "Land_i_House_Small_03_V1_F": {[[1.25854,2.51807,-0.371628,-90],[-4.20874,-0.478516,-0.371628,-130],[3.87915,-5.36084,-0.371628,-180]]};
case "Land_i_Stone_HouseSmall_V2_F": {[[4.32983,2.13037,-0.606995,-90],[-5.00854,2.17236,-0.628845,-90]]};
case "Land_i_Stone_HouseSmall_V1_F": {[[4.32983,2.13037,-0.606995,-90],[-5.00854,2.17236,-0.628845,-90]]};
case "Land_i_Stone_HouseSmall_V3_F": {[[4.32983,2.13037,-0.606995,-90],[-5.00854,2.17236,-0.628845,-90]]};
case "Land_HouseA1_L": {[[-5.5621, 0.9, 0.011,0],[0,0,0,0]]};
case "Land_HouseB": {[[-2.21, 3.98, 0.011,0],[-1.3, 7.9, 0.011,0],[6.9, 0.8, 0.011,0],[7.5, 4, 0.011,-90]]};
case		default {[[0,0,0,0]]};
	};

	{
		_pos = _building modelToWorld [(_x select 0), (_x select 1), (_x select 2)];
		_dir = (_x select 3);
		_pos pushback _Dir;
		_arr pushback _pos;
	}forEach _restricted;
	_arr;