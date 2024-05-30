[{hotel setVariable ["Robo",false,true];}] remoteExec ["call"];
["Robos","Has reiniciado el robo con éxito.","success"] spawn cplus_notification_fnc_notification;
closeDialog 0;