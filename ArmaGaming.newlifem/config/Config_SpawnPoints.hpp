/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
class CfgSpawnPoints {
	class newlifem {
        class Civilian {
            class Lakeside {
                displayName = "Lakeside";
                description = "Capital de Lakeside: Principal ciudad de la isla y capital del condado.";
                spawnMarker = "civ_spawn_lakeside";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };

            class Morrison {
                displayName = "Morrison";
                description = "Ciudad de Morrison";
                spawnMarker = "civ_spawn_morrison";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };
            
            class Diablos {
                displayName = "Los Diablos";
                description = "Ciudad de Los Diablos";
                spawnMarker = "civ_spawn_diablos";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };

            class SanCristobal {
                displayName = "San Cristobal";
                description = "Pueblo de San Cristobal";
                spawnMarker = "civ_spawn_cristobal";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };

            class RebelNort {
                displayName = "Base Rebelde (Norte)";
                description = "Base Rebelde del Norte";
                spawnMarker = "RebelNort";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "missionNamespace getVariable ['mav_ttm_var_rebel',0]) isEqualTo 1";
            };

            class RebelSur {
                displayName = "Base Rebelde (Sur)";
                description = "Base Rebelde del Sur";
                spawnMarker = "RebelSur";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "missionNamespace getVariable ['mav_ttm_var_rebel',0]) isEqualTo 1";
            };
        };

        class Cop {
            class KamdanHQ {
                displayName = "Kamdan Police HQ";
                description = "Main Police Headquarters";
                spawnMarker = "cop_spawn_1";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };
            class Corrections {
                displayName = "Departamento de Correcciones";
                description = "Departamento de Correcciones: La prisión general de la isla de Kamdan";
                spawnMarker = "doc_spawn";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };
        };

        class Medic {
            class KamdanHospital {
                displayName = "Kamdan Hospital";
                description = "Hospital General de Kamdan";
                spawnMarker = "medical_spawn_1";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };
            class KandanHospital2 {
                displayName = "Clinica de Los Diablos";
                description = "Clinica de Los Diablos";
                spawnMarker = "medical_spawn_2";
                icon = "\ArmaGamingCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
                };
        };
    };
};
