/*
	What is this?
	You have to link your server with you The-Programmer account to use our products, the core do a lot of work for you, to have an easy installation for all our products.

	This is required to start your server for security reasons. If you do not put the right API Key, you server will not work.

	You can generate your API Key on this page : https://my.the-programmer.com/settings
	Then copy/paste it below.

	EXAMPLE : (Theses keys doesn't exist, please generate your own key using the link above)

	accounts[] = {
	    "the-programmer-QMLAD65DAHAP54FS",
	    "another-account-LJQ54FSDQ5GK5CWP"
	};
*/
accounts[] = {
	"nilopachi-HF231RB7FVX8U0V0"
};


/*
	What is this?
	Our products use a shared permissions system that will allow you to choose precisely the specific rights that server's administrators can have on our products.
*/
admins_all_permissions = "(call life_adminlevel >= 1)";
admins_specific_permissions[] = {
	{
		{ "UID1","UID2","..." },
		{ "CAN_DO_THAT", "CAN_DO_THAT_TOO" }
	},
	{
		{ "UID3","..." },
		{ "CAN_DO_ONLY_THAT" }
	}
};


/*
	What is this?
	The-Programmer has a global ban system so hackers don't jump around servers and learn how to bypass The-Programmer.

	If you, as a server admin, want him to get in even tho he is globally banned, just ask him for his UID and add its UID in the array below.
*/
enable_global_ban_sync = true; // If disable, all people banned by The-Programmer will be able to join your server (DEFAULT : true)

bypass_global_ban_uids[] = {
	"UID1","UID2","UID3","..."
};


/*
	What is this?
	The-Programmer can detect errors in the installation of our products on your server.
*/
errors_detection = true;

descriptionPath = "description.ext";
cfgRemoteExecPath = "CfgRemoteExec.hpp";
coreInitPath = "core\init.sqf";


/*
	What is this?
	We offer a data encryption system with the Arcfour algorithm that can be used in your mission.
	Here you can enter a random character key, we recommend 255 random characters.

	For example :
	787831b573eeec79e93f98e9bfb6b530eec78f5a3ce3bc6cb5a2db5b4e2d1895dda22774db8cd78b90bc019bfb881ab53c64ac4dc99cf39ea037c7acc59fa068b1b331acdeeea19f307e4db3e18ad79d8b157f6b4e8e02ef787f7c8e65ea7b646b1cbf8cdd3bab0f090e115de31b6fb757ff78dee9bbaba4423fa5aa6f7a1cc
*/
arcfour_encryption_key = "REPLACE_ME";


/*
	What is this?
	To be able to customize our products to the maximum you can remove functions that may seem useless for you, overwrite or add new ones.
*/
edited_functions_logs = true;

removed_functions[] = {
	// "life_fnc_name"
};

overwritted_functions[] = {
	// {"life_fnc_name", "\PBO_name\path_in_pbo\fn_name.sqf"}
};

added_functions[] = {
	// {"life_fnc_name", "\PBO_name\path_in_pbo\fn_name.sqf", view (-2 : eveyrone, 2 : server), extra OPTIONNAL ("init_server", "init_client_spawn", "init_client_remoteExec"), [params] OPTIONNAL ("pid", "player", "name")}
};
