class CfgPatches 
{
    class fini_ah
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {};
        fileName = "finiAH_A3.pbo";
        author[]= {"Fini"}; 
    };
};

class CfgFunctions
{
    class fini_ah
    {
        tag = "Fini";
        class Init
        {
            file = "finiAH_A3";
            class init {preInit=1;};
        };        
    };    
};