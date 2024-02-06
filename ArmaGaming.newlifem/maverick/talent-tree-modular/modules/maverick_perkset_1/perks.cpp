class perk_civilian_master {
	displayName = "Civilian Perks";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "1 point required to unlock this tree";
	description = "Learn and improve on civilian specific perks";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {0,0.6,0,1};
};
class perk_rebel_1 {
	displayName = "Tienda Rebelde";
	requiredPerkPoints = 2;
	requiredLevel = 3;
	requiredPerk = "perk_civilian_master";
	subtitle = "2 point required to unlock this tree";
	description = "Obten acceso a la tienda rebelde";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_rebel_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {0,0.6,0,1};
};
class perk_rebel_2 {
	displayName = "Tienda Rebelde Avanzada";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "perk_rebel_1";
	subtitle = "5 point required to unlock this tree";
	description = "Obten acceso a la tienda rebelde";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_rebel_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {0,0.6,0,1};
};

class perk_medical_master {
	displayName = "Medical Perks";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "1 point required to unlock this tree";
	description = "Learn and improve on medical specific perks";
	initScript = "";
	limitToSides[] = {};
	color[] = {0,0.6,0,1};
};

class perk_cop_master {
	displayName = "Police Perks";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "1 point required to unlock this tree";
	description = "Learn and improve on police specific perks";
	initScript = "";
	limitToSides[] = {""};
	color[] = {0,0.6,0,1};
};