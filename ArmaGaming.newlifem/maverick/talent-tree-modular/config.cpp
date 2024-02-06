#define true 1
#define false 0

	
#include "gui\_master.cpp"

class Maverick_TTM {
	class Config {
		keyCode = 20;
		shift = false;
		ctrl = true;
	};

	class Actions {
		#include "modules\maverick_perkset_1\actions.cpp"
	};

	class Levels {
		#include "configuration\levels.hpp"
	};

	class Perks {
		#include "modules\maverick_perkset_1\perks.cpp"
	};
};
