// ["Example2",productVersion] call DiscordEmbedBuilder_fnc_buildCfg;
class Example2 {
    webhook="Example"; // CfgDiscordEmbedWebhooks
    message="This is another example message";
    username="Different username, same webhook";
    avatar="https://discord.com/assets/28174a34e77bb5e5310ced9f95cb480b.png";
    tts=0;
    // Maximum of 10 embeds per template
    class Embeds {
        class Embed1: CfgDiscordEmbedTemplate {
            title="This is the embed title";
            description="This is the embed description";
            url="https://arma3.com/";
            color="00FF00";
            thumbnail="https://arma3.com/assets/img/wallpapers/1/9/arma3_white_plain_800x600.jpg";
            image="https://arma3.com/assets/img/wallpapers/low/3/Arma%203%20Laws%20of%20War_wallpaper_1024x768.jpg";
            class Author {
                name="Connor";
                url="https://steamcommunity.com/id/_connor";
                image="https://avatars.akamai.steamstatic.com/ea139abcaf2d2f19c7ec2d76622cb66498e32a85_full.jpg";
            };
            class Footer {
                text="This is the footer text";
                image="https://arma3.com/favicon.ico";
            };
            fields[]={
                //{title,content,inline}
                {"Field 1","Content 1",1},
                {"Field 2","Some words",1},
                {"Field 3",":+1:",0},
                {"Field 4","__Markdown works here__",0}
            };
        };
        class Embed2: CfgDiscordEmbedTemplate {
            title="Second embed";
            description="This embed uses [productVersion](https://community.bistudio.com/wiki/productVersion) as the sqf parameter";
            timestamp=1;
            fields[]={
                {"Product Name","%1",1},
                {"Product Name Short","%2",1},
                {"Product Version","%3",1},
                {"Product Build","%4",1},
                {"Product Branch","%5",1},
                {"Has Mods","%6",1},
                {"Platform","%7",1},
                {"Architecture","%8",1},
                {"All","You can use sqf parameters in the message, username, embed title, embed description, author name, footer text, field name and field content.\n**Discord** markdown `is` also _supported_.\n```sqf\n[%1,%2,%3,%4,%5,%6,%7,%8]```",0}
            };
        };
    };
};
