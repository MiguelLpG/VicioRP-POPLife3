// You don't need to worry about this stuff
#include "\@DiscordEmbedBuilder\configuracion.cpp"
class CfgPatches {
	class CAU_DiscordEmbedBuilder {
        name="DiscordEmbedBuilder";
        author="Connor";
        url="https://steamcommunity.com/id/_connor";

		requiredVersion=1.68;
		requiredAddons[]={};
		units[]={};
		weapons[]={};
	};
};
class CfgFunctions {
	class CAU_DiscordEmbedBuilder {
		tag="DiscordEmbedBuilder";
		class Scripts {
            file = "\cau.discordembedbuilder";
			class init {preInit=1;};
			class buildCfg {};
			class buildSqf {};
			class send {};
			class log {preInit=1;};
		};
	};
};
