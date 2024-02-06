/*
    File: finalizar.sqf
    Author: LoSantosYT
    Description:
    Cuando la huella corresponda abre la camara 
*/


pic1 ='\ArmaGamingCore\LoSantosYT\huella\3.jpg';
pic2 ='\ArmaGamingCore\LoSantosYT\huella\2.jpg';
pic3 ='\ArmaGamingCore\LoSantosYT\huella\1.jpg';
pic4 ='\ArmaGamingCore\LoSantosYT\huella\5.jpg';
pic5 ='\ArmaGamingCore\LoSantosYT\huella\0.jpg';
pic6 ='\ArmaGamingCore\LoSantosYT\huella\3.jpg';

waitUntil{
	pic1 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\0.jpg' &&
	pic2 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\1.jpg' &&
	pic3 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\2.jpg' &&
	pic4 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\3.jpg' &&
	pic5 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\4.jpg' &&
	pic6 isEqualTo '\ArmaGamingCore\LoSantosYT\huella\5.jpg';
};
hint "Camara abierta";
[false,"codeCracker",1,"codeCracker"] call ANZUS_fnc_handleInv;
closeDialog 0;
createDialog "finalizar";
ctrlSetText [1236,'\ArmaGamingCore\LoSantosYT\huella\finalizar.jpg'];
sleep 1;
closeDialog 0;

[typeOf cursorObject] call lsyt_fnc_puerta;
missionNamespace setVariable ["Hackeando", "Vacio", true];