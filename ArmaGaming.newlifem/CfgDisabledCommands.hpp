/*
    Author: Travis Butts
    Description: If you don't understand this please don't touch, thanks!

    Paramaters:  
    targets[] - the format is {enableServer,enableClient,enableHC}. 1 means enable, 0 means disable. From the above example targets[] = {1,0,1}; means: enable server, disable client, enable HC.
    args[] - the format is {{leftArgumentType},{rightArgumentType}}
*/

class CfgDisabledCommands
{
    class COPYTOCLIPBOARD
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class DELETEMARKER 
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class SETWEAPONRELOADINGTIME 
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };
    class SCREENSHOT 
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class REMOTECONTROL
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"OBJECT"},{"OBJECT"}};
        };
    };
    class SETWAYPOINTSTATEMENTS
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"ARRAY"},{"ARRAY"}};
        };
    };
    class CREATEUNIT
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"STRING"},{"ARRAY"}};
        };
        class SYNTAX2
        {
            targets[] = {0,0,0};
            args[] = {{"GROUP"},{"ARRAY"}};
        };
    };
    class CREATEMARKER 
    {
        class SYNTAX1 {
            targets[] = {1,0,0};
            args[] = {{},{"ARRAY"}};
        };
    }
    class SETMARKERTEXT
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"STRING"},{"STRING"}};
        };
    };
    class ALLVARIABLES
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"CONTROL"}};
        };

        class SYNTAX2
        {
            targets[] = {0,0,0};
            args[] = {{},{"TEAM_MEMBER"}};
        };

        class SYNTAX3
        {
            targets[] = {0,0,0};
            args[] = {{},{"NAMESPACE"}};
        };

        class SYNTAX4
        {
            targets[] = {1,1,0};
            args[] = {{},{"OBJECT"}};
        };

        class SYNTAX5
        {
            targets[] = {0,0,0};
            args[] = {{},{"GROUP"}};
        };
    };
    class LOADFILE
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class SETFRIEND
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"SIDE"},{"ARRAY"}};
        };
    };
    class REMOVEALLACTIONS
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"OBJECT"}};
        };
    };
    class REMOVEALLITEMS
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"OBJECT"}};
        };
    };
    class REMOVEALLMPEVENTHANDLERS
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"OBJECT"},{"STRING"}};
        };
    };
    class ADDMPEVENTHANDLER
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"OBJECT"},{"ARRAY"}};
        };
    };
    class SERVERCOMMAND
    {
        class SYNTAX1
        {
            targets[] = {1,0,0};
            args[] = {{"STRING"},{"STRING"}};
        };
        class SYNTAX2
        {
            targets[] = {0,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class SERVERCOMMANDEXECUTABLE
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"STRING"}};
        };
    };
    class DRAWLINE
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"CONTROL"},{"ARRAY"}};
        };
    };
    class DRAWLINE3D
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{},{"ARRAY"}};
        };
    };
};