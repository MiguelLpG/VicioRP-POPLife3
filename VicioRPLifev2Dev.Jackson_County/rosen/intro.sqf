/*
	Creado por Rosen
*/

cutText ["","BLACK OUT"];
_posi = getMarkerPos "camrosen1"; 
_posf = getMarkerPos "camrosen2"; 
_cam = "camera" camCreate _posi; 
_cam cameraEffect ["INTERNAL", "BACK"]; 
_cam camSetTarget _posf; 
_cam camSetPos [(_posi select 0)-600, (_posi select 1)-500, 400]; 
_cam camCommit 0;
cutText ["","BLACK IN"]; 
_cam camSetPos [(_posf select 0)-300, (_posf select 1)+500, 400]; 
_cam camSetTarget _posf; 
_cam camCommit 120; 
sleep 6; 
cutRsc ["intro","PLAIN"]; 
sleep 115; 
cutText ["","BLACK OUT"]; 
sleep 3; 
_cam cameraEffect ['TERMINATE', 'BACK']; 
sleep 1; 
cutText ["","BLACK IN"]; 
camDestroy _cam;