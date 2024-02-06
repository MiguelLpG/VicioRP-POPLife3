/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MateriANZUSive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MateriANZUSive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class oil {
        MaterialsReq[] = {{"oil_unprocessed",1}};
        MateriANZUSive[] = {{"oil_processed",1}};
        Text = "STR_Process_Oil";
        NoLicenseCost = 1000;
    };

    class ruby {
        MaterialsReq[] = {{"rubyu",1}};
        MateriANZUSive[] = {{"rubyC",1}};
        Text = "STR_Process_Ruby";
        NoLicenseCost = 1000;
    };

    class iron {
        MaterialsReq[] = {{"ironu",1}};
        MateriANZUSive[] = {{"iron",1}};
        Text = "STR_Process_Iron";
        NoLicenseCost = 1000;
    };

    class uranium {
        MaterialsReq[] = {{"uraniumu",1}};
        MateriANZUSive[] = {{"uranium",1}};
        Text = "STR_Process_uranium";
        NoLicenseCost = 1000;
    };

    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",1}};
        MateriANZUSive[] = {{"cocaine_processed",1}};
        Text = "STR_Process_Processed";
        NoLicenseCost = 1000;
    };

    class marijuana {
        MaterialsReq[] = {{"marijuanau",1}};
        MateriANZUSive[] = {{"marijuana",1}};
        Text = "STR_Process_Marijuana";
        NoLicenseCost = 1000;
    };

    class lsd {
        MaterialsReq[] = {{"LSDu",1}};
        MateriANZUSive[] = {{"LSD",1}};
        Text = "STR_Process_LSD";
        NoLicenseCost = 1000;
    };

    class steel {
        MaterialsReq[] = {{"steelu",1}};
        MateriANZUSive[] = {{"steel",1}};
        Text = "STR_Process_steel";
        NoLicenseCost = 1000;
    };

    class rubber {
        MaterialsReq[] = {{"rubberU",1}};
        MateriANZUSive[] = {{"rubber",1}};
        Text = "STR_Process_rubber";
        NoLicenseCost = 1000;
    };
    
    class diamond {
        MaterialsReq[] = {{"diamondOre",1}};
        MateriANZUSive[] = {{"diamond",1}};
        Text = "STR_Process_diamond";
        NoLicenseCost = 1000;
    };

    class coal {
        MaterialsReq[] = {{"coalOre",1}};
        MateriANZUSive[] = {{"coal",1}};
        Text = "STR_Process_coal";
        NoLicenseCost = 1000;
    };

};