class cplus_notification
{
	allowSpam = "true";
	spamCooldown = 5;
    class info
    {
        type = "Information";
        color1[] = {0.09019607843,0.6117647059,0.7411764706,1};
        color2 = "#179cbd";
        path = "\VillasLifeCore\images\codeplus\info.paa";
        sound = "beep_target";
    };

    class attention
    {
        type = "Attention";
        color1[] = {0.8745098039,0.3686274510,0,1};
        color2 = "#df5e00";
        path = "\VillasLifeCore\images\codeplus\attention.paa";
        sound = "3DEN_notificationWarning";
    };

    class admin_msg
    {
        type = "Admin";
        color1[] = {0.6196078431,0.0901960784,0.0901960784,1};
        color2 = "#9e1717";
        path = "\VillasLifeCore\images\codeplus\broadcast_admin.paa";
        sound = "TacticalPing2";
    };

    class event_msg
    {
        type = "Event";
        color1[] = {0.5294117647,0.0784313725,0.3607843137,1};
        color2 = "#87145c";
        path = "\VillasLifeCore\images\codeplus\broadcast_event.paa";
        sound = "TacticalPing";
    };

    class error
    {
        type = "Error";
        color1[] = {0.6352941176,0,0,1};
        color2 = "#a20000";
        path = "\VillasLifeCore\images\codeplus\error.paa";
        sound = "addItemFailed";
    };

    class success
    {
        type = "Success";
        color1[] = {0.5254901961,0.7333333333,0.08235294118,1};
        color2 = "#86bb15";
        path = "\VillasLifeCore\images\codeplus\success.paa";
        sound = "FD_Finish_F";
    };

    class waiting
    {
        type = "Waiting";
        color1[] = {0.8705882353,0.8823529412,0,1};
        color2 = "#dee100";
        path = "\VillasLifeCore\images\codeplus\waiting.paa";
        sound = "FD_Timer_F";
    };
};