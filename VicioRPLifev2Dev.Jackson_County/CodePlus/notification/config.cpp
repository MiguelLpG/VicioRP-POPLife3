/* 
	File: config.cpp
	Author: CodePlus
	You can purchase this script on www.bytex.market
	YOU DONT HAVE ANY PERMISSION TO USE THIS SCRIPT, WITHOUT A PERMISSION FROM THE AUTHOR!	
*/

class cplus_notification
{
	//GENERAL CONFIGURATION
	allowSpam = "true"; //Allow the spam of same messages. Insert "true" for allow the spam, "false" for no spam.
	spamCooldown = 5; //The number of seconds, the same message will be displayed. Only used when allowSpam is false.
	
	///////////////////////
    class info
    {
        type = "Information";
        color1[] = {0.09019607843,0.6117647059,0.7411764706,1};
        color2 = "#179cbd";
        path = "CodePlus\notification\textures\info.paa";
        sound = "beep_target";
    };

    class attention
    {
        type = "Attention";
        color1[] = {0.8745098039,0.3686274510,0,1};
        color2 = "#df5e00";
        path = "CodePlus\notification\textures\attention.paa";
        sound = "3DEN_notificationWarning";
    };

    class admin_msg
    {
        type = "Admin";
        color1[] = {0.6196078431,0.0901960784,0.0901960784,1};
        color2 = "#9e1717";
        path = "CodePlus\notification\textures\broadcast_admin.paa";
        sound = "TacticalPing2";
    };

    class event_msg
    {
        type = "Event";
        color1[] = {0.5294117647,0.0784313725,0.3607843137,1};
        color2 = "#87145c";
        path = "CodePlus\notification\textures\broadcast_event.paa";
        sound = "TacticalPing";
    };

    class error
    {
        type = "Error";
        color1[] = {0.6352941176,0,0,1};
        color2 = "#a20000";
        path = "CodePlus\notification\textures\error.paa";
        sound = "addItemFailed";
    };

    class success
    {
        type = "Success";
        color1[] = {0.5254901961,0.7333333333,0.08235294118,1};
        color2 = "#86bb15";
        path = "CodePlus\notification\textures\success.paa";
        sound = "FD_Finish_F";
    };

    class waiting
    {
        type = "Waiting";
        color1[] = {0.8705882353,0.8823529412,0,1};
        color2 = "#dee100";
        path = "CodePlus\notification\textures\waiting.paa";
        sound = "FD_Timer_F";
    };
};