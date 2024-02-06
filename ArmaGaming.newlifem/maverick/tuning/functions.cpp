/*--------------------------------------------------------------------------
    Author:		Bytex Digital
    Website:	https://bytex.digital

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

class Maverick_Tuning {
	tag = "mav_tuning";
	class functions {
		file = "maverick\tuning";

		// Client
		class start {};
		class mainMenuForType {};
		class loadPreview {};
		class loadVehicleModification {};
		class getMasterConfig {};
		class applyDefaults {};
		class purchaseSelectedModification {};
		class displayText {};
		class exit {};
		class initTuningClient { postInit = 1; };
		class rgbColorSelection {};
		class enableLight {};
		class disableLight {};
		class rgbColorSelectionLight {};

		// Server
		class hide {};
		class getTuningFromDB {};
		class tuning_prepareString {};
		class saveTuningToDB {};
	};
};