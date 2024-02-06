class CfgGather {
    class Resources {
        class apple {
            amount = 5;
            zones[] = { "apple_1", "apple_2", "apple_3", "apple_4" };
            item = "";
            zoneSize = 30;
        };

        class MDMA {
            amount = 1;
            zones[] = { "MDMA_1" };
            item = "";
            zoneSize = 30;
        };

		class rubberU
		{
			amount = 2;
			zones[] = { "rubber_1" };
			item = "";
            zoneSize = 30;
		};		

        class wool
		{
			amount = 3;
			zones[] = { "wool_1" };
			item = "";
            zoneSize = 30;
		};

        class mushrooms {
            amount = 1;
            zones[] = { "lsd_1" };	
            zoneSize = 30;
        };
    };

    class Minerals {
        class oil_unprocessed {
            amount = 2;
            zones[] = { "oil_field_1", "oil_field_2" };
            item = "anzus_pickaxe";
            mined[] = { "oil_unprocessed" };
            zoneSize = 30;
        };
        class ruby { //IG
            amount = 1;
            zones[] = { "ruby_1" };
            item = "anzus_pickaxe";
            mined[] = { "rubyU" };
            zoneSize = 35;
        };
        class diamondM { //IG
            amount = 1;
            zones[] = { "diamondMine" };
            item = "anzus_pickaxe";
            mined[] = { "diamondOre" };
            zoneSize = 35;
        };
        class goldM { //IG
            amount = 1;
            zones[] = { "goldMine" };
            item = "anzus_pickaxe";
            mined[] = { "goldbar" };
            zoneSize = 35;
        };
        class uraniumU { //IG
            amount = 1;
            zones[] = { "uranium_1" };
            item = "pdrill";	
            mined[] = { "uraniumU" };
            zoneSize = 40;
        };
        class heroin_unprocessed {
            amount = 1;
            zones[] = { "heroinAre" };
            item = "";
            mined[] = { "heroin_unprocessed" };
            zoneSize = 30;
        };
        class cocaine_unprocessed {
            amount = 1;
            zones[] = { "cocainePlant" };
            item = "";
            mined[] = { "cocaine_unprocessed" };
            zoneSize = 30;
        };
        class cannabis {
            amount = 1;
            zones[] = { "marihuanaPlant" };
            item = "";
            mined[] = { "cannabis" };
            zoneSize = 30;
        };
		class coal {
            amount = 1;
            zones[] = { "coalMine" };
            item = "anzus_pickaxe";
            mined[] = { "coalOre" };
            zoneSize = 35;
        };


    };
};