// Developer info: https://github.com/ConnorAU/SQFDiscordEmbedBuilder/blob/master/README.md

class CfgDiscordEmbedWebhooks {
    // https://discord.com/api/webhooks/000000000000000000/XXXXXXX_XXXXXXXXXXXXXXX_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    Example="1205572849297784832/Yd3RkPmEL9Hl-uXcIENxBSAMtn3dYRitwEuDDO_3SprhQMqZNTbTabfmTqwXyZGw_iHv";
};

class CfgDiscordEmbedTemplate {
    title="";
    description="";
    url="";
    color="";
    timestamp=0;
    thumbnail="";
    image="";
    class Author {
        name="";
        url="";
        image="";
    };
    class Footer {
        text="";
        image="";
    };
    // Maximum 25 fields per embed
    fields[]={
        //{title,content,inline}
    };
};

class CfgDiscordEmbedBuilder {
	#include "\@DiscordEmbedBuilder\external\Example.cpp"
	#include "\@DiscordEmbedBuilder\external\Example2.cpp"
};
