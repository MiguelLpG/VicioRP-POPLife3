class AnzusLife_Phone
{
  idd = 19931;
  name = "AnzusLife_Phone";
  movingEnable = 0;
  enableSimulation = 1;
  onLoad = "uiNamespace setVariable ['AnzusLife_Phone', _this select 0];";
  onUnload = "uiNamespace setVariable ['AnzusLife_Phone', displayNull]";
  onDestroy = "uiNamespace setVariable ['AnzusLife_Phone', displayNull]";
  class controlsBackground
  {
    class AnzusLife_Background: AnzusLife_PhoneRscPicture
    {
      idc = -1;
      text = "\ArmaGamingCore\images\phone\background.paa";
      x = 0.318499 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
    };
  };
  class controls
  {
    class AnzusLife_Background_Changable: AnzusLife_PhoneRscPicture
    {
      idc = 987;
      text = "\ArmaGamingCore\images\phone\backgrounds\Background_2.paa";
      x = 0.318499 * safezoneW + safezoneX;
      y = (0.225 - 0.066) * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
    };
    class AnzusLife_Background_Changable2: AnzusLife_PhoneRscPicture
    {
      idc = 988;
      text = "\ArmaGamingCore\images\phone\backgrounds\Background_2.paa";
      x = 0.318499 * safezoneW + safezoneX;
      y = (0.225 - 0.066) * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
    };
  };
};


class AnzusLife_ChangeBackground
{
    controls[] = {
      {"AnzusLife_ChangeBackground_Background",100003},
      {"AnzusLife_ChangeBackground_BackButton",100004},
      {"AnzusLife_ChangeBackground_ControlGroup",100005},
      {"AnzusLife_ChangeBackground_BtnHome",100006}
    };
};

class AnzusLife_ChangeBackground_Background : AnzusLife_PhoneRscPicture
{
  idc = 100003;
  text = "\ArmaGamingCore\images\phone\dialogImages\WallpapersBackground.paa";
  x = 0.3185 * safezoneW + safezoneX;
  y = 0.159 * safezoneH + safezoneY;
  w = 0.360937 * safezoneW;
  h = 0.638 * safezoneH;
};
class AnzusLife_ChangeBackground_BackButton: AnzusLife_PhoneIconControlButton
{
  idc = 100004;
  x = 0.424719 * safezoneW + safezoneX;
  y = 0.2118 * safezoneH + safezoneY;
  w = 0.0237188 * safezoneW;
  h = 0.0176 * safezoneH;
  onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_ChangeBackground_ControlGroup: Life_RscControlsGroup
{
  idc = 100005;
  x = 0.3682 * safezoneW + safezoneX;
  y = 0.273 * safezoneH + safezoneY;
  w = 0.26193 * safezoneW;
  h = 0.4532 * safezoneH;
  class controls {};
  onMouseButtonDown = "AnzusLife_Phone_BackgroundControlMouseup = false;_this spawn ANZUS_fnc_BackgroundSlider";
  onMouseButtonUp = "AnzusLife_Phone_BackgroundControlMouseup = true";
  class VScrollBar : Life_RscScrollBar
  {
      width = 0;
      autoScrollEnabled = 1;
  };
  class HScrollBar : Life_RscScrollBar
  {
      height = 0;
  };
};
class AnzusLife_ChangeBackground_BtnHome: AnzusLife_PhoneIconControlButton
{
  idc = 100006;
  x = 0.470094 * safezoneW + safezoneX;
  y = 0.7588 * safezoneH + safezoneY;
  w = 0.0567187 * safezoneW;
  h = 0.011 * safezoneH;
  onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_Buttons : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_Buttons_ControlsGroup",1800},
    {"AnzusLife_Buttons_BottomControlGroup",1801}
  };
};

class AnzusLife_Buttons_ControlsGroup: Life_RscControlsGroup
{
  idc = 1800;
  x = 0.427812 * safezoneW + safezoneX;
  y = 0.2382 * safezoneH + safezoneY;
  w = 0.145 * safezoneW;
  h = 0.43 * safezoneH;
  class controls {};
  onMouseButtonDown = "AnzusLife_Phone_BackgroundControlMouseup = false;";
  onMouseButtonUp = "AnzusLife_Phone_BackgroundControlMouseup = true";
  class VScrollBar : Life_RscScrollBar
  {
      width = 0;
      autoScrollEnabled = 1;
  };
  class HScrollBar : Life_RscScrollBar
  {
      height = 0;
  };
};

class AnzusLife_Buttons_BottomControlGroup: Life_RscControlsGroup
{
  idc = 1801;
  x = 0.427812 * safezoneW + safezoneX;
  y = 0.6914 * safezoneH + safezoneY;
  w = 0.145 * safezoneW;
  h = 0.0682 * safezoneH;
};


class AnzusLife_ContactAdd
{
  controls[] = {
    {"AnzusLife_ContactAdd_Background", 190001},
    {"AnzusLife_ContactAdd_FirstName", 190002},
    {"AnzusLife_ContactAdd_LastName", 190003},
    {"AnzusLife_ContactAdd_Company", 190004},
    {"AnzusLife_ContactAdd_Number", 190005},
    {"AnzusLife_ContactAdd_Email", 190006},
    {"AnzusLife_ContactAdd_BtnCancel", 190007},
    {"AnzusLife_ContactAdd_BtnDone", 190008},
    {"AnzusLife_ContactAdd_BtnHome", 190009}
  };
};

class AnzusLife_ContactAdd_Background: AnzusLife_PhoneRscPicture
{
        idc = 190001;
        text = "\ArmaGamingCore\images\phone\dialogImages\new_contact.paa";
        x = 0.318499 * safezoneW + safezoneX;
        y = 0.159 * safezoneH + safezoneY;
        w = 0.360937 * safezoneW;
        h = 0.638 * safezoneH;
};
class AnzusLife_ContactAdd_FirstName: AnzusLife_PhoneRscEdit
{
        idc = 190002;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.2616 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contactaddfirst'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactAdd_LastName: AnzusLife_PhoneRscEdit
{
        idc = 190003;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.291 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contactaddlast'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactAdd_Company: AnzusLife_PhoneRscEdit
{
        idc = 190004;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.3193 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contactaddcompany'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactAdd_Number: AnzusLife_PhoneRscEdit
{
        idc = 190005;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.3834 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contactaddnumber'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactAdd_Email : AnzusLife_PhoneRscEdit
{
        idc = 190006;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.4714 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contactaddemail'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactAdd_BtnCancel: AnzusLife_PhoneIconControlButton
{
        idc = 190007;
        x = 0.428178 * safezoneW + safezoneX;
        y = 0.225459 * safezoneH + safezoneY;
        w = 0.0247505 * safezoneW;
        h = 0.0198 * safezoneH;
        onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_ContactAdd_BtnDone: AnzusLife_PhoneIconControlButton
{
        idc = 190008;
        x = 0.547437 * safezoneW + safezoneX;
        y = 0.225 * safezoneH + safezoneY;
        w = 0.0247505 * safezoneW;
        h = 0.0198 * safezoneH;
        onButtonClick = "[] call ANZUS_fnc_ContactChange";
};
class AnzusLife_ContactAdd_BtnHome: AnzusLife_PhoneIconControlButton
{
        idc = 190009;
        x = 0.469062 * safezoneW + safezoneX;
        y = 0.7618 * safezoneH + safezoneY;
        w = 0.0587812 * safezoneW;
        h = 0.011 * safezoneH;
        onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_ContactEdit
{
  controls[] = {
    {"AnzusLife_ContactEdit_Background", 200001},
    {"AnzusLife_ContactEdit_FirstName", 200002},
    {"AnzusLife_ContactEdit_LastName", 200003},
    {"AnzusLife_ContactEdit_Company", 200004},
    {"AnzusLife_ContactEdit_Number", 200005},
    {"AnzusLife_ContactEdit_Email", 200006},
    {"AnzusLife_ContactEdit_BtnHome", 200007},
    {"AnzusLife_ContactEdit_BtnCancel", 200008},
    {"AnzusLife_ContactEdit_BtnDone", 200009}
  };
};

class AnzusLife_ContactEdit_Background: AnzusLife_PhoneRscPicture
{
    idc = 200001;
    text = "\ArmaGamingCore\images\phone\dialogImages\edit_contact.paa";
    x = 0.318499 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
};
class AnzusLife_ContactEdit_FirstName: AnzusLife_PhoneRscEdit
{
        idc = 200002;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.2616 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contacteditfirst'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactEdit_LastName: AnzusLife_PhoneRscEdit
{
        idc = 200003;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.291 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contacteditlast'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactEdit_Company: AnzusLife_PhoneRscEdit
{
        idc = 200004;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.3193 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contacteditcompany'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactEdit_Number: AnzusLife_PhoneRscEdit
{
        idc = 200005;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.3834 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contacteditnumber'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactEdit_Email: AnzusLife_PhoneRscEdit
{
        idc = 200006;
        text = "";
        x = 0.45875 * safezoneW + safezoneX;
        y = 0.4714 * safezoneH + safezoneY;
        w = 0.115496 * safezoneW;
        h = 0.0176 * safezoneH;
        onSetFocus = "['contacteditemail'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_ContactEdit_BtnHome: AnzusLife_PhoneIconControlButton
{
        idc = 200007;
        x = 0.469062 * safezoneW + safezoneX;
        y = 0.7618 * safezoneH + safezoneY;
        w = 0.0587812 * safezoneW;
        h = 0.011 * safezoneH;
        onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_ContactEdit_BtnCancel: AnzusLife_PhoneIconControlButton
{
        idc = 200008;
        x = 0.428178 * safezoneW + safezoneX;
        y = 0.225459 * safezoneH + safezoneY;
        w = 0.0247505 * safezoneW;
        h = 0.0198 * safezoneH;
};
class AnzusLife_ContactEdit_BtnDone: AnzusLife_PhoneIconControlButton
{
        idc = 200009;
        x = 0.547437 * safezoneW + safezoneX;
        y = 0.225 * safezoneH + safezoneY;
        w = 0.0247505 * safezoneW;
        h = 0.0198 * safezoneH;
};


class AnzusLife_ContactsMain : Life_RscControlsGroupNoScrollbars
{
    controls[] = {
      {"AnzusLife_ContactsMain_Background", 170001},
      {"AnzusLife_ContactsMain_ContactsGroup", 170002},
      {"AnzusLife_ContactsMain_BtnHome", 170003},
      {"AnzusLife_ContactsMain_BtnNew", 170004}
    };
};


class AnzusLife_ContactsMain_Background: AnzusLife_PhoneRscPicture
{
          idc = 170001;
          text = "\ArmaGamingCore\images\phone\dialogImages\ContactsBackground.paa";
          x = 0.3185 * safezoneW + safezoneX;
          y = 0.159 * safezoneH + safezoneY;
          w = 0.360937 * safezoneW;
          h = 0.638 * safezoneH;
};
class AnzusLife_ContactsMain_ContactsGroup: Life_RscControlsGroupNoScrollbars
{
          idc = 170002;
          x = 0.422656 * safezoneW + safezoneX;
          y = 0.2756 * safezoneH + safezoneY;
          w = 0.153656 * safezoneW;
          h = 0.453 * safezoneH;
          class controls {};
};
class AnzusLife_ContactsMain_BtnHome: AnzusLife_PhoneIconControlButton
{
          idc = 170003;
          x = 0.469062 * safezoneW + safezoneX;
          y = 0.7618 * safezoneH + safezoneY;
          w = 0.0587812 * safezoneW;
          h = 0.011 * safezoneH;
          onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_ContactsMain_BtnNew: AnzusLife_PhoneIconControlButton
{
          idc = 170004;
          x = 0.561875 * safezoneW + safezoneX;
          y = 0.214 * safezoneH + safezoneY;
          w = 0.00928125 * safezoneW;
          h = 0.0176 * safezoneH;
          onbuttonClick = "['AnzusLife_ContactAdd'] spawn ANZUS_fnc_changeMenu";
};


class AnzusLife_ContactView
{
  controls[] = {
    {"AnzusLife_ContactView_Background", 210001},
    {"AnzusLife_ContactView_BtnMessage", 210002},
    {"AnzusLife_ContactView_BtnPay", 210003},
    {"AnzusLife_ContactView_NameRscText", 210004},
    {"AnzusLife_ContactView_PhoneRscText", 210005},
    {"AnzusLife_ContactView_EmailRscText", 210006},
    {"AnzusLife_ContactView_BtnSendMessage", 210007},
    {"AnzusLife_ContactView_BtnContacts", 210008},
    {"AnzusLife_ContactView_BtnEdit", 210009},
    {"AnzusLife_ContactView_BtnHome", 210010},
    {"AnzusLife_ContactView_BtnDelete", 210011}
  };
};

class AnzusLife_ContactView_Background : AnzusLife_PhoneRscPicture
{
      idc = 210001;
      text = "\ArmaGamingCore\images\phone\dialogImages\view_contact.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_ContactView_BtnMessage: AnzusLife_PhoneIconControlButton
{
      idc = 210002;
      x = 0.460812 * safezoneW + safezoneX;
      y = 0.335 * safezoneH + safezoneY;
      w = 0.0206254 * safezoneW;
      h = 0.044 * safezoneH;
};
class AnzusLife_ContactView_BtnPay: AnzusLife_PhoneIconControlButton
{
      idc = 210003;
      x = 0.515469 * safezoneW + safezoneX;
      y = 0.335 * safezoneH + safezoneY;
      w = 0.0206254 * safezoneW;
      h = 0.044 * safezoneH;
};
class AnzusLife_ContactView_NameRscText: Life_RscStructuredText
{
      idc = 210004;
      x = 0.426788 * safezoneW + safezoneX;
      y = 0.302 * safezoneH + safezoneY;
      w = 0.146426 * safezoneW;
      h = 0.0286 * safezoneH;
      shadow = 0;
      class Attributes {
            font = "RobotoCondensed";
            color = "#000000";
            align = "center";
            shadow = 0;
            valign= "middle";
      };
};
class AnzusLife_ContactView_PhoneRscText: Life_RscText
{
      idc = 210005;
      x = 0.430905 * safezoneW + safezoneX;
      y = 0.4054 * safezoneH + safezoneY;
      w = 0.14024 * safezoneW;
      h = 0.0198 * safezoneH;
      shadow = 0;
      sizeEx = "(((pixelh * 5) * ((getResolution select 1) / 1080)) * 4)";
};
class AnzusLife_ContactView_EmailRscText: Life_RscText
{
      idc = 210006;
      x = 0.430905 * safezoneW + safezoneX;
      y = 0.4868 * safezoneH + safezoneY;
      w = 0.14024 * safezoneW;
      h = 0.0198 * safezoneH;
      shadow = 0;
      sizeEx = "(((pixelh * 5) * ((getResolution select 1) / 1080)) * 4)";
};
class AnzusLife_ContactView_BtnSendMessage: AnzusLife_PhoneIconControlButton
{
      idc = 210007;
      x = 0.428845 * safezoneW + safezoneX;
      y = 0.5418 * safezoneH + safezoneY;
      w = 0.142302 * safezoneW;
      h = 0.0308 * safezoneH;
};
class AnzusLife_ContactView_BtnContacts: AnzusLife_PhoneIconControlButton
{
      idc = 210008;
      x = 0.42575 * safezoneW + safezoneX;
      y = 0.225 * safezoneH + safezoneY;
      w = 0.0360938 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_ContactView_BtnEdit: AnzusLife_PhoneIconControlButton
{
      idc = 210009;
      x = 0.556719 * safezoneW + safezoneX;
      y = 0.225 * safezoneH + safezoneY;
      w = 0.0144377 * safezoneW;
      h = 0.0176 * safezoneH;
};
class AnzusLife_ContactView_BtnHome: AnzusLife_PhoneIconControlButton
{
      idc = 210010;
      x = 0.469062 * safezoneW + safezoneX;
      y = 0.7618 * safezoneH + safezoneY;
      w = 0.0587812 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_ContactView_BtnDelete: AnzusLife_PhoneIconControlButton
{
      idc = 210011;
      x = 0.428843 * safezoneW + safezoneX;
      y = 0.5726 * safezoneH + safezoneY;
      w = 0.142302 * safezoneW;
      h = 0.0308 * safezoneH;
};


class AnzusLife_Settings : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_Settings_Background",90001},
    {"Playerstags_ToggleBackground_Off",90002},
    {"Playerstags_ToggleBackground_On",90003},
    {"BroadCasts_ToggleBackground_Off",90004},
    {"BroadCasts_ToggleBackground_On",90005},
    {"RNO_ToggleBackground_Off",90006},
    {"RNO_ToggleBackground_On",90007},
    {"Sidechat_ToggleBackground_Off",90008},
    {"Sidechat_ToggleBackground_On",90009},
    {"AIP_ToggleBackground_Off",90010},
    {"AIP_ToggleBackground_On",90011},
    {"AnzusLife_Settings_SettingsForground", 90012},
    {"AnzusLife_Settings_Playerstags_Toggle",90013},
    {"Playerstags_Toggle_Button",90014},
    {"AnzusLife_Settings_BroadCasts_Toggle",90015},
    {"BroadCasts_Toggle_Button",90016},
    {"AnzusLife_Settings_RNO_Toggle",90017},
    {"RNO_Toggle_Button",90018},
    {"AnzusLife_Settings_Sidechat_Toggle",90019},
    {"Sidechat_Toggle_Button",90020},
    {"AnzusLife_Settings_AIP_Toggle",90021},
    {"AIP_Toggle_Button",90022},
    {"AnzusLife_Settings_OnFootViewDistance",90023},
    {"AnzusLife_Settings_onGroundViewDistance",90024},
    {"AnzusLife_Settings_inAirViewDistance",90025},
    {"AnzusLife_Settings_WallpaperButton",90026},
    {"AnzusLife_Settings_Background_BackButton",90027},
    {"AnzusLife_Settings_BtnHome",90028}
  };
};

class AnzusLife_Settings_Background: AnzusLife_PhoneRscPicture
{
      idc = 90001;
      text = "\ArmaGamingCore\images\phone\dialogImages\LightGreyBackground.paa";
      x = 0.318531 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};


class Playerstags_ToggleBackground_Off: AnzusLife_PhoneRscPicture
{
      idc = 90002;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackgroundOff.paa";
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.302 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.0242 * safezoneH;
};
class Playerstags_ToggleBackground_On: AnzusLife_PhoneRscPicture
{
      idc = 90003;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackground.paa";
      x = 0.52 * safezoneW + safezoneX;
      y = 0.302 * safezoneH + safezoneY;
      w = 0.0216566 * safezoneW;
      h = 0.0242 * safezoneH;
};

class BroadCasts_ToggleBackground_Off: AnzusLife_PhoneRscPicture
{
      idc = 90004;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackgroundOff.paa";
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.3394 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.0242 * safezoneH;
};
class BroadCasts_ToggleBackground_On: AnzusLife_PhoneRscPicture
{
      idc = 90005;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackground.paa";
      x = 0.52 * safezoneW + safezoneX;
      y = 0.3394 * safezoneH + safezoneY;
      w = 0.0216566 * safezoneW;
      h = 0.0242 * safezoneH;
};

class RNO_ToggleBackground_Off: AnzusLife_PhoneRscPicture
{
      idc = 90006;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackgroundOff.paa";
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.3768 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.0242 * safezoneH;
};
class RNO_ToggleBackground_On: AnzusLife_PhoneRscPicture
{
      idc = 90007;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackground.paa";
      x = 0.52 * safezoneW + safezoneX;
      y = 0.3768 * safezoneH + safezoneY;
      w = 0.0216566 * safezoneW;
      h = 0.0242 * safezoneH;
};

class Sidechat_ToggleBackground_Off: AnzusLife_PhoneRscPicture
{
      idc = 90008;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackgroundOff.paa";
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.412 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.0242 * safezoneH;
};
class Sidechat_ToggleBackground_On: AnzusLife_PhoneRscPicture
{
      idc = 90009;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackground.paa";
      x = 0.52 * safezoneW + safezoneX;
      y = 0.412 * safezoneH + safezoneY;
      w = 0.0216566 * safezoneW;
      h = 0.0242 * safezoneH;
};

class AIP_ToggleBackground_Off: AnzusLife_PhoneRscPicture
{
      idc = 90010;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackgroundOff.paa";
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.4494 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.0242 * safezoneH;
};
class AIP_ToggleBackground_On: AnzusLife_PhoneRscPicture
{
      idc = 90011;
      text = "\ArmaGamingCore\images\phone\ui\toggleBackground.paa";
      x = 0.52 * safezoneW + safezoneX;
      y = 0.4494 * safezoneH + safezoneY;
      w = 0.0216566 * safezoneW;
      h = 0.0242 * safezoneH;
};

class AnzusLife_Settings_SettingsForground: AnzusLife_PhoneRscPicture
{
      idc = 90012;
      text = "\ArmaGamingCore\images\phone\dialogImages\SettingsForground.paa";
      x = 0.318531 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};


class AnzusLife_Settings_Playerstags_Toggle: Life_RscPictureKeepAspect
{
      idc = 90013;
      text = "\ArmaGamingCore\images\phone\ui\Toggle.paa";
      x = 0.5495 * safezoneW + safezoneX;
      y = 0.3035 * safezoneH + safezoneY;
      w = 0.0123751 * safezoneW;
      h = 0.022 * safezoneH;
};
class Playerstags_Toggle_Button: AnzusLife_PhoneIconControlButton
{
      idc = 90014;
      x = 0.423687 * safezoneW + safezoneX;
      y = 0.2998 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "[1] spawn ANZUS_fnc_UpdateToggle";
};


class AnzusLife_Settings_BroadCasts_Toggle: Life_RscPictureKeepAspect
{
      idc = 90015;
      text = "\ArmaGamingCore\images\phone\ui\Toggle.paa";
      x = 0.5495 * safezoneW + safezoneX;
      y = 0.3405 * safezoneH + safezoneY;
      w = 0.0123751 * safezoneW;
      h = 0.022 * safezoneH;
};
class BroadCasts_Toggle_Button: AnzusLife_PhoneIconControlButton
{
      idc = 90016;
      x = 0.423687 * safezoneW + safezoneX;
      y = 0.335 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "[2] spawn ANZUS_fnc_UpdateToggle";
};


class AnzusLife_Settings_RNO_Toggle: Life_RscPictureKeepAspect
{
      idc = 90017;
      text = "\ArmaGamingCore\images\phone\ui\Toggle.paa";
      x = 0.5495 * safezoneW + safezoneX;
      y = 0.3774 * safezoneH + safezoneY;
      w = 0.0123751 * safezoneW;
      h = 0.022 * safezoneH;
};
class RNO_Toggle_Button: AnzusLife_PhoneIconControlButton
{
      idc = 90018;
      x = 0.423688 * safezoneW + safezoneX;
      y = 0.3702 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.0352 * safezoneH;
      onButtonClick = "[3] spawn ANZUS_fnc_UpdateToggle";
};


class AnzusLife_Settings_Sidechat_Toggle: Life_RscPictureKeepAspect
{
      idc = 90019;
      text = "\ArmaGamingCore\images\phone\ui\Toggle.paa";
      x = 0.5495 * safezoneW + safezoneX;
      y = 0.4143 * safezoneH + safezoneY;
      w = 0.0123751 * safezoneW;
      h = 0.022 * safezoneH;
};
class Sidechat_Toggle_Button: AnzusLife_PhoneIconControlButton
{
      idc = 90020;
      x = 0.423688 * safezoneW + safezoneX;
      y = 0.4076 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.0352 * safezoneH;
      onButtonClick = "[4] spawn ANZUS_fnc_UpdateToggle";
};


class AnzusLife_Settings_AIP_Toggle: Life_RscPictureKeepAspect
{
      idc = 90021;
      text = "\ArmaGamingCore\images\phone\ui\Toggle.paa";
      x = 0.5495 * safezoneW + safezoneX;
      y = 0.4507 * safezoneH + safezoneY;
      w = 0.0123751 * safezoneW;
      h = 0.022 * safezoneH;
};
class AIP_Toggle_Button: AnzusLife_PhoneIconControlButton
{
      idc = 90022;
      x = 0.423687 * safezoneW + safezoneX;
      y = 0.445 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "[5] spawn ANZUS_fnc_UpdateToggle";
};


class AnzusLife_Settings_OnFootViewDistance: AnzusLife_PhoneRscEdit
{
      idc = 90023;
      x = 0.535074 * safezoneW + safezoneX;
      y = 0.544926 * safezoneH + safezoneY;
      w = 0.0391876 * safezoneW;
      h = 0.0198 * safezoneH;
      text = "1";
      maxChars = 5;
};
class AnzusLife_Settings_onGroundViewDistance: AnzusLife_PhoneRscEdit
{
      idc = 90024;
      x = 0.535063 * safezoneW + safezoneX;
      y = 0.5088 * safezoneH + safezoneY;
      w = 0.0391876 * safezoneW;
      h = 0.0198 * safezoneH;
      text = "2";
      maxChars = 5;
};
class AnzusLife_Settings_inAirViewDistance: AnzusLife_PhoneRscEdit
{
      idc = 90025;
      x = 0.535063 * safezoneW + safezoneX;
      y = 0.5836 * safezoneH + safezoneY;
      w = 0.0391876 * safezoneW;
      h = 0.0198 * safezoneH;
      text = "3";
      maxChars = 4;
};

class AnzusLife_Settings_WallpaperButton: AnzusLife_PhoneIconControlButton
{
      idc = 90026;
      x = 0.423687 * safezoneW + safezoneX;
      y = 0.632 * safezoneH + safezoneY;
      w = 0.151581 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "['AnzusLife_ChangeBackground'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_Settings_Background_BackButton: AnzusLife_PhoneIconControlButton
{
    x = 0.424719 * safezoneW + safezoneX;
    y = 0.214 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.0154 * safezoneH;
    onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_Settings_BtnHome: AnzusLife_PhoneIconControlButton
{
    x = 0.470094 * safezoneW + safezoneX;
    y = 0.7588 * safezoneH + safezoneY;
    w = 0.0567187 * safezoneW;
    h = 0.011 * safezoneH;
    onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_gangMain
{
      controls[] = {
            {"AnzusLife_gangMain_Background", 150001},
            {"AnzusLife_gangMain_PList", 150002},
            {"AnzusLife_gangMain_catList", 150003},
            {"AnzusLife_gangMainBtnLeave", 150004},
            {"AnzusLife_gangMainBtnSetLeader", 150005},
            {"AnzusLife_gangMainBtnUpgradeSlots", 150006},
            {"AnzusLife_gangMainBtnDisbandGang", 150007},
            {"AnzusLife_gangMainBtnKick", 150008},
            {"AnzusLife_gangMainBtnInvitePlayer", 150009},
            {"AnzusLife_gangMain_BackButton", 150010},
            {"AnzusLife_gangMain_BtnHome", 150011}
      };
};

class AnzusLife_gangMain_Background: AnzusLife_PhoneRscPicture
{
      text = "\ArmaGamingCore\images\phone\dialogImages\gangMain.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_gangMain_PList: AnzusLife_PhoneRscListbox
{
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.302 * safezoneH + safezoneY;
      w = 0.144375 * safezoneW;
      h = 0.3828 * safezoneH;
      sizeEx = "(((pixelh * 5) * ((getResolution select 1) / 1080)) * 4)";
};
class AnzusLife_gangMain_catList: AnzusLife_PhoneRscCombo
{
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.2822 * safezoneH + safezoneY;
      w = 0.144375 * safezoneW;
      h = 0.0154 * safezoneH;
      wholeHeight = 10 * (0.017 * safezoneH);
      sizeEx = "(((pixelh * 5) * ((getResolution select 1) / 1080)) * 4)";
      onLbSelChanged = "[] call ANZUS_fnc_GangComboChanged";
};
class AnzusLife_gangMainBtnLeave: AnzusLife_PhoneIconControlButton
{
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.6914 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_GangLeave";
};
class AnzusLife_gangMainBtnSetLeader: AnzusLife_PhoneIconControlButton
{
      x = 0.5 * safezoneW + safezoneX;
      y = 0.6914 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_GangSetLeader";
};
class AnzusLife_gangMainBtnUpgradeSlots: AnzusLife_PhoneIconControlButton
{
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.7112 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_gangUpgrade;";
};
class AnzusLife_gangMainBtnDisbandGang: AnzusLife_PhoneIconControlButton
{
      x = 0.5 * safezoneW + safezoneX;
      y = 0.7112 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_GangDisband";
};
class AnzusLife_gangMainBtnKick: AnzusLife_PhoneIconControlButton
{
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.731 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_GangKick";
};
class AnzusLife_gangMainBtnInvitePlayer: AnzusLife_PhoneIconControlButton
{
      x = 0.5 * safezoneW + safezoneX;
      y = 0.731 * safezoneH + safezoneY;
      w = 0.0711562 * safezoneW;
      h = 0.0176 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_gangPlayerInvite";
};
class AnzusLife_gangMain_BackButton: AnzusLife_PhoneIconControlButton
{
      x = 0.424719 * safezoneW + safezoneX;
      y = 0.214 * safezoneH + safezoneY;
      w = 0.020625 * safezoneW;
      h = 0.0154 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_gangMain_BtnHome: AnzusLife_PhoneIconControlButton
{
      x = 0.470094 * safezoneW + safezoneX;
      y = 0.7588 * safezoneH + safezoneY;
      w = 0.0567187 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_gangCreate : Life_RscControlsGroupNoScrollbars
{
      controls[] = {
            {"AnzusLife_gangCreate_background", 160001},
            {"AnzusLife_gangCreate_BtnCreateGang", 160002},
            {"AnzusLife_gangCreate_GangNameEdit", 160003},
            {"AnzusLife_gangCreate_StructuredText", 160004},
            {"AnzusLife_Background_BackButton", 160005},
            {"AnzusLife_gangCreate_BtnHome", 160006}
      };
};

class AnzusLife_gangCreate_background: AnzusLife_PhoneRscPicture
{
      idc = 160001;
      text = "\ArmaGamingCore\images\phone\dialogImages\createGang.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_gangCreate_BtnCreateGang: AnzusLife_PhoneIconControlButton
{
      idc = 160002;
      x = 0.448439 * safezoneW + safezoneX;
      y = 0.4758 * safezoneH + safezoneY;
      w = 0.102093 * safezoneW;
      h = 0.0264 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_GangCreateGang";
};
class AnzusLife_gangCreate_GangNameEdit: AnzusLife_PhoneRscEdit
{
      idc = 160003;
      x = 0.44225 * safezoneW + safezoneX;
      y = 0.4516 * safezoneH + safezoneY;
      w = 0.114465 * safezoneW;
      h = 0.022 * safezoneH;
      text = "Enter Gang Name";
      onSetFocus = "['gangcreate'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_gangCreate_StructuredText: AnzusLife_PhoneStructuredText
{
      idc = 160004;
      x = 0.444312 * safezoneW + safezoneX;
      y = 0.3064 * safezoneH + safezoneY;
      w = 0.110341 * safezoneW;
      h = 0.1386 * safezoneH;
};
class AnzusLife_Background_BackButton: AnzusLife_PhoneIconControlButton
{
      idc = 160005;
      x = 0.424719 * safezoneW + safezoneX;
      y = 0.214 * safezoneH + safezoneY;
      w = 0.020625 * safezoneW;
      h = 0.0154 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_gangCreate_BtnHome: AnzusLife_PhoneIconControlButton
{
      idc = 160006;
      x = 0.470094 * safezoneW + safezoneX;
      y = 0.7588 * safezoneH + safezoneY;
      w = 0.0567187 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_Inv : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_Inv_Background", 130001},
    {"AnzusLife_Inv_ItemList", 130002},
    {"AnzusLife_Inv_amount", 130003},
    {"AnzusLife_Inv_Plist", 130004},
    {"AnzusLife_Inv_BtnRemove", 130005},
    {"AnzusLife_Inv_Use", 130006},
    {"AnzusLife_Inv_Give", 130007},
    {"AnzusLife_Inv_Give", 130007},
    {"AnzusLife_Inv_Give", 130007},
    {"AnzusLife_Inv_BackButton", 130008},
    {"AnzusLife_Inv_BtnHome", 130009}
  };
};

class AnzusLife_Inv_Background: AnzusLife_PhoneRscPicture
{
      idc = 130001;
      text = "\ArmaGamingCore\images\phone\dialogImages\Inventory.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_Inv_ItemList: AnzusLife_PhoneRscListbox
{
      idc = 130002;
      x = 0.429366 * safezoneW + safezoneX;
      y = 0.286252 * safezoneH + safezoneY;
      w = 0.141271 * safezoneW;
      h = 0.3564 * safezoneH;
      wholeHeight = 10 * (0.017 * safezoneH);
};
class AnzusLife_Inv_amount: AnzusLife_PhoneRscEdit
{
      idc = 130003;
      x = 0.428846 * safezoneW + safezoneX;
      y = 0.6496 * safezoneH + safezoneY;
      w = 0.143333 * safezoneW;
      h = 0.0176 * safezoneH;
      text = "1";
      onSetFocus = "['invamount'] call ANZUS_fnc_clearPlaceholder";
};
class AnzusLife_Inv_Plist: AnzusLife_PhoneRscCombo
{
      idc = 130004;
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.672 * safezoneH + safezoneY;
      w = 0.1435 * safezoneW;
      h = 0.017 * safezoneH;
      wholeHeight = 10 * (0.009 * safezoneH);
};
class AnzusLife_Inv_BtnRemove: AnzusLife_PhoneIconControlButton
{
      idc = 130005;
      x = 0.427293 * safezoneW + safezoneX;
      y = 0.6958 * safezoneH + safezoneY;
      w = 0.0484791 * safezoneW;
      h = 0.0320741 * safezoneH;
      onButtonClick = "[] spawn ANZUS_fnc_removeItem";
};
class AnzusLife_Inv_Use: AnzusLife_PhoneIconControlButton
{
      idc = 130006;
      x = 0.476292 * safezoneW + safezoneX;
      y = 0.6958 * safezoneH + safezoneY;
      w = 0.0464166 * safezoneW;
      h = 0.0320741 * safezoneH;
      onButtonClick = "[] call ANZUS_fnc_useItem";
};
class AnzusLife_Inv_Give: AnzusLife_PhoneIconControlButton
{
      idc = 130007;
      x = 0.522688 * safezoneW + safezoneX;
      y = 0.6958 * safezoneH + safezoneY;
      w = 0.0484791 * safezoneW;
      h = 0.0320741 * safezoneH;
      onButtonClick = "[] call ANZUS_fnc_giveItem";
};
class AnzusLife_Inv_BackButton: AnzusLife_PhoneIconControlButton
{
      idc = 130008;
      x = 0.424719 * safezoneW + safezoneX;
      y = 0.214 * safezoneH + safezoneY;
      w = 0.020625 * safezoneW;
      h = 0.0154 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_Inv_BtnHome: AnzusLife_PhoneIconControlButton
{
      idc = 130009;
      x = 0.470094 * safezoneW + safezoneX;
      y = 0.7588 * safezoneH + safezoneY;
      w = 0.0567187 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_KeyChain : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_KeyChain_Background",140001},
    {"AnzusLife_KeyChain_KeyList",140002},
    {"AnzusLife_KeyChain_PList",140003},
    {"AnzusLife_KeyChain_BtnGive",140004},
    {"AnzusLife_KeyChain_BackButton",140005},
    {"AnzusLife_KeyChain_BtnHome",140006}
  };
};

class AnzusLife_KeyChain_Background: AnzusLife_PhoneRscPicture
{
      idc = 140001;
      text = "\ArmaGamingCore\images\phone\dialogImages\keyChain.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_KeyChain_KeyList: AnzusLife_PhoneRscListbox
{
      idc = 140002;
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.2844 * safezoneH + safezoneY;
      w = 0.144375 * safezoneW;
      h = 0.3828 * safezoneH;
};
class AnzusLife_KeyChain_PList: AnzusLife_PhoneRscCombo
{
      idc = 140003;
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.6716 * safezoneH + safezoneY;
      w = 0.144375 * safezoneW;
      h = 0.0176 * safezoneH;
      wholeHeight = 10 * (0.009 * safezoneH);
};
class AnzusLife_KeyChain_BtnGive: AnzusLife_PhoneIconControlButton
{
      idc = 140004;
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.6958 * safezoneH + safezoneY;
      w = 0.143344 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "[] call ANZUS_fnc_giveKey";
};
class AnzusLife_KeyChain_BackButton: AnzusLife_PhoneIconControlButton
{
      idc = 140005;
      x = 0.424719 * safezoneW + safezoneX;
      y = 0.214 * safezoneH + safezoneY;
      w = 0.020625 * safezoneW;
      h = 0.0154 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_KeyChain_BtnHome: AnzusLife_PhoneIconControlButton
{
      idc = 140006;
      x = 0.470094 * safezoneW + safezoneX;
      y = 0.7588 * safezoneH + safezoneY;
      w = 0.0567187 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_Licenses : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_Licenses_Background",110001},
    {"AnzusLife_Licenses_Listbox",110002},
    {"AnzusLife_Licenses_btnBack",110003},
    {"AnzusLife_Licenses_BtnHome",110004}
  };
};


class AnzusLife_Licenses_Background: AnzusLife_PhoneRscPicture
{
    text = "\ArmaGamingCore\images\phone\dialogImages\Licenses.paa";
    x = 0.3185 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
};
class AnzusLife_Licenses_Listbox: AnzusLife_PhoneRscListbox
{
    x = 0.427812 * safezoneW + safezoneX;
    y = 0.282 * safezoneH + safezoneY;
    w = 0.143344 * safezoneW;
    h = 0.3894 * safezoneH;
};
class AnzusLife_Licenses_btnBack: AnzusLife_PhoneIconControlButton
{
    x = 0.424719 * safezoneW + safezoneX;
    y = 0.214 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.0154 * safezoneH;
    onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_Licenses_BtnHome: AnzusLife_PhoneIconControlButton
{
    x = 0.470094 * safezoneW + safezoneX;
    y = 0.7588 * safezoneH + safezoneY;
    w = 0.0567187 * safezoneW;
    h = 0.011 * safezoneH;
    onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};


class AnzusLife_MessagesMain : Life_RscControlsGroupNoScrollbars
{
    controls[] =  {
        {"AnzusLife_MessagesMain_Background", 250001},
        {"AnzusLife_MessagesMain_ContactsGroup", 250002},
        {"AnzusLife_MessagesMain_BtnHome", 250003},
        {"AnzusLife_MessagesMain_BtnBack", 250004}
    };
};

class AnzusLife_MessagesMain_Background: AnzusLife_PhoneRscPicture
{
    idc = 250001;
    text = "\ArmaGamingCore\images\phone\dialogImages\MessageMainBackground.paa";
    x = 0.3185 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
};
class AnzusLife_MessagesMain_ContactsGroup: Life_RscControlsGroupNoScrollbars
{
    idc = 250002;
    x = 0.422656 * safezoneW + safezoneX;
    y = 0.2756 * safezoneH + safezoneY;
    w = 0.153656 * safezoneW;
    h = 0.453 * safezoneH;
    class controls {};
};
class AnzusLife_MessagesMain_BtnHome: AnzusLife_PhoneIconControlButton
{
    idc = 250003;
    x = 0.470094 * safezoneW + safezoneX;
    y = 0.7588 * safezoneH + safezoneY;
    w = 0.0567187 * safezoneW;
    h = 0.011 * safezoneH;
    onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_MessagesMain_BtnBack: AnzusLife_PhoneIconControlButton
{
    idc = 250004;
    x = 0.424719 * safezoneW + safezoneX;
    y = 0.214 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.0154 * safezoneH;
    onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};


class AnzusLife_EmergencyMessage : Life_RscControlsGroupNoScrollbars
{
    controls[] = {
        {"AnzusLife_EmergencyMessage_Background",800001},
        {"AnzusLife_EmergencyMessage_ContactsGroup", 800002},
        {"AnzusLife_EmergencyMessage_BtnHome", 800003},
        {"AnzusLife_EmergencyMessage_BtnBack", 800004},
        {"AnzusLife_EmergencyMessage_TextBox", 800005},
        {"AnzusLife_EmergencyMessage_BtnSendCops", 800006},
        {"AnzusLife_EmergencyMessage_BtnSendEMS", 800007}
    };
};

class AnzusLife_EmergencyMessage_Background: Life_RscPictureKeepAspect
{
    idc = 800001;
    text = "\ArmaGamingCore\images\phone\dialogImages\ES_Background.paa";
    x = 0.318499 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
};
class AnzusLife_EmergencyMessage_ContactsGroup: Life_RscControlsGroupNoScrollbars
{
    idc = 800002;
    x = 0.422656 * safezoneW + safezoneX;
    y = (0.3416 - 0.066) * safezoneH + safezoneY;
    w = 0.153656 * safezoneW;
    h = 0.3716 * safezoneH;
    class controls {};
};
class AnzusLife_EmergencyMessage_BtnHome: AnzusLife_PhoneIconControlButton
{
    idc = 800003;
    x = 0.470094 * safezoneW + safezoneX;
    y = 0.7588 * safezoneH + safezoneY;
    w = 0.0567187 * safezoneW;
    h = 0.011 * safezoneH;
    onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_EmergencyMessage_BtnBack: AnzusLife_PhoneIconControlButton
{
    idc = 800004;
    x = 0.424719 * safezoneW + safezoneX;
    y = 0.214 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.0154 * safezoneH;
    onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_EmergencyMessage_TextBox: AnzusLife_PhoneRscEdit
{
    idc = 800005;
    text = "Type Message Here";
    x = 0.42575 * safezoneW + safezoneX;
    y = (0.72 - 0.066) * safezoneH + safezoneY;
    w = 0.137156 * safezoneW;
    h = 0.0704 * safezoneH;
    style = 16 + 512;
    onSetFocus = "['messagebox'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_EmergencyMessage_BtnSendCops: AnzusLife_PhoneIconControlButton
{
    idc = 800006;
    x = 0.561875 * safezoneW + safezoneX;
    y = (0.7706 - 0.066) * safezoneH + safezoneY;
    w = 0.0134062 * safezoneW;
    h = 0.0242 * safezoneH;
    onButtonClick = "['cop'] call ANZUS_fnc_SendEMessage";
};
class AnzusLife_EmergencyMessage_BtnSendEMS: AnzusLife_PhoneIconControlButton
{
    idc = 800007;
    x = 0.562907 * safezoneW + safezoneX;
    y = (0.753 - 0.066) * safezoneH + safezoneY;
    w = 0.0113438 * safezoneW;
    h = 0.0176 * safezoneH;
    onButtonClick = "['ems'] call ANZUS_fnc_SendEMessage";
};


class AnzusLife_MessagesView : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_MessagesView_Background", 230001},
    {"AnzusLife_MessagesView_ContactsGroup", 230002},
    {"AnzusLife_MessagesView_BtnHome", 230003},
    {"AnzusLife_MessagesView_BtnBack", 230004},
    {"AnzusLife_MessagesView_TextBox", 230005},
    {"AnzusLife_MessagesView_ContactInfo", 230006},
    {"AnzusLife_MessagesView_InfoButton", 230007},
    {"AnzusLife_MessagesView_BtnSendMessage", 230008}
  };
};

class AnzusLife_MessagesView_Background: AnzusLife_PhoneRscPicture
{
        idc = 230001;
        text = "\ArmaGamingCore\images\phone\dialogImages\MessageViewBackground.paa";
        x = 0.3185 * safezoneW + safezoneX;
        y = 0.159 * safezoneH + safezoneY;
        w = 0.360937 * safezoneW;
        h = 0.638 * safezoneH;
};
class AnzusLife_MessagesView_ContactsGroup: Life_RscControlsGroupNoScrollbars
{
        idc = 230002;
        x = 0.422656 * safezoneW + safezoneX;
        y = (0.3416 - 0.066) * safezoneH + safezoneY;
        w = 0.153656 * safezoneW;
        h = 0.3716 * safezoneH;
        class controls {};
};
class AnzusLife_MessagesView_BtnHome: AnzusLife_PhoneIconControlButton
{
        idc = 230003;
        x = 0.470094 * safezoneW + safezoneX;
        y = (0.8248 - 0.066) * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.011 * safezoneH;
        onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_MessagesView_BtnBack: AnzusLife_PhoneIconControlButton
{
        idc = 230004;
        x = 0.424718 * safezoneW + safezoneX;
        y = (0.28 - 0.066) * safezoneH + safezoneY;
        w = 0.0422815 * safezoneW;
        h = 0.0154 * safezoneH;
        onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_MessagesView_TextBox: AnzusLife_PhoneRscEdit
{
        idc = 230005;
        text = "";
        x = 0.42575 * safezoneW + safezoneX;
        y = (0.72 - 0.066) * safezoneH + safezoneY;
        w = 0.137156 * safezoneW;
        h = 0.0704 * safezoneH;
        style = 16 + 512;
        onSetFocus = "['messagebox'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_MessagesView_ContactInfo: Life_RscStructuredText
{
        idc = 230006;
        text = "test";
        x = 0.424719 * safezoneW + safezoneX;
        y = (0.3196 - 0.066) * safezoneH + safezoneY;
        w = 0.149531 * safezoneW;
        h = 0.0198 * safezoneH;
};
class AnzusLife_MessagesView_InfoButton: AnzusLife_PhoneIconControlButton
{
        idc = 230007;
        x = 0.562906 * safezoneW + safezoneX;
        y = (0.28 - 0.066) * safezoneH + safezoneY;
        w = 0.0103125 * safezoneW;
        h = 0.0154 * safezoneH;
};
class AnzusLife_MessagesView_BtnSendMessage: AnzusLife_PhoneIconControlButton
{
        idc = 230008;
        x = 0.561875 * safezoneW + safezoneX;
        y = (0.7706 - 0.066) * safezoneH + safezoneY;
        w = 0.0134062 * safezoneW;
        h = 0.0242 * safezoneH;
};



class AnzusLife_MessagesEmergency : Life_RscControlsGroupNoScrollbars
{
        controls[] = {
                {"AnzusLife_MessagesEmergency_Background", 900001},
                {"AnzusLife_MessagesEmergency_MessagesGroup", 900002},
                {"AnzusLife_MessagesEmergency_BtnHome", 900003},
                {"AnzusLife_MessagesEmergency_BtnBack", 900004},
        };
};
class AnzusLife_MessagesEmergency_Background: Life_RscPictureKeepAspect
{
    idc = 900001;
    text = "\ArmaGamingCore\images\phone\dialogImages\Dispatch.paa";
    x = 0.318499 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
};
class AnzusLife_MessagesEmergency_MessagesGroup: Life_RscControlsGroupNoScrollbars
{
    idc = 900002;
    x = 0.422656 * safezoneW + safezoneX;
    y = 0.2756 * safezoneH + safezoneY;
    w = 0.153656 * safezoneW;
    h = 0.453 * safezoneH;
    class controls {};
};
class  AnzusLife_MessagesEmergency_BtnHome: AnzusLife_PhoneIconControlButton
{
    x = 0.470094 * safezoneW + safezoneX;
    y = 0.7588 * safezoneH + safezoneY;
    w = 0.0567187 * safezoneW;
    h = 0.011 * safezoneH;
    onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class  AnzusLife_MessagesEmergency_BtnBack: AnzusLife_PhoneIconControlButton
{
    x = 0.424719 * safezoneW + safezoneX;
    y = 0.214 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.0154 * safezoneH;
    onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};


class AnzusLife_Money : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_Money_Background", 120001},
    {"AnzusLife_Money_Plist", 120002},
    {"AnzusLife_Money_AmountEdit", 120003},
    {"AnzusLife_Money_CashBox", 120004},
    {"AnzusLife_Money_BankBox", 120005},
    {"AnzusLife_Money_BtnGive", 120006},
    {"AnzusLife_Money_BackButton", 120007},
    {"AnzusLife_Money_BtnHome", 120008},
    {"AnzusLife_Money_Btnatm", 120009}
  };
};

class AnzusLife_Money_Background: AnzusLife_PhoneRscPicture
{
      idc = 120001;
      text = "\ArmaGamingCore\images\phone\dialogImages\MoneyStats.paa";
      x = 0.3185 * safezoneW + safezoneX;
      y = 0.159 * safezoneH + safezoneY;
      w = 0.360937 * safezoneW;
      h = 0.638 * safezoneH;
};
class AnzusLife_Money_Plist: AnzusLife_PhoneRscCombo
{
      idc = 120002;
      x = 0.427816 * safezoneW + safezoneX;
      y = 0.526 * safezoneH + safezoneY;
      w = 0.144364 * safezoneW;
      h = 0.017 * safezoneH;
      wholeHeight = 10 * (0.017 * safezoneH);
};
class AnzusLife_Money_AmountEdit: AnzusLife_PhoneRscEdit
{
      idc = 120003;
      x = 0.427814 * safezoneW + safezoneX;
      y = 0.566 * safezoneH + safezoneY;
      w = 0.144364 * safezoneW;
      h = 0.0176 * safezoneH;
      text = "1";
      onSetFocus = "['moneyamount'] call ANZUS_fnc_ClearPlaceholder";
};
class AnzusLife_Money_CashBox: Life_RscText
{
      idc = 120004;
      x = 0.458744 * safezoneW + safezoneX;
      y = 0.423 * safezoneH + safezoneY;
      w = 0.107248 * safezoneW;
      h = 0.0242 * safezoneH;
      text = "CASH MONEY";
      colorText[] = {0.3,0.3,0.3,1};
      font = "RobotoCondensed";
      shadow = 0;
      sizeEx = (((pixelh * 5) * ((getResolution select 1) / 1080)) * 4);
};
class AnzusLife_Money_BankBox: Life_RscText
{
      idc = 120005;
      x = 0.458744 * safezoneW + safezoneX;
      y = 0.3548 * safezoneH + safezoneY;
      w = 0.107248 * safezoneW;
      h = 0.0242 * safezoneH;
      text = "BANK MONEY";
      colorText[] = {0.3,0.3,0.3,1};
      font = "RobotoCondensed";
      shadow = 0;
      sizeEx = (((pixelh * 5) * ((getResolution select 1) / 1080)) * 4);
};
class AnzusLife_Money_BtnGive: AnzusLife_PhoneIconControlButton
{
      idc = 120006;
      x = 0.427812 * safezoneW + safezoneX;
      y = 0.6958 * safezoneH + safezoneY;
      w = 0.143344 * safezoneW;
      h = 0.033 * safezoneH;
      onButtonClick = "[] call ANZUS_fnc_giveMoney";
};
class AnzusLife_Money_BackButton: AnzusLife_PhoneIconControlButton
{
      idc = 120007;
      x = 0.424719 * safezoneW + safezoneX;
      y = 0.214 * safezoneH + safezoneY;
      w = 0.020625 * safezoneW;
      h = 0.0154 * safezoneH;
      onButtonClick = "['last'] spawn ANZUS_fnc_changeMenu";
};
class AnzusLife_Money_BtnHome: AnzusLife_PhoneIconControlButton
{
      idc = 120008;
      x = 0.470094 * safezoneW + safezoneX;
      y = 0.7588 * safezoneH + safezoneY;
      w = 0.0567187 * safezoneW;
      h = 0.011 * safezoneH;
      onButtonClick = "['AnzusLife_Buttons'] spawn ANZUS_fnc_changeMenu;";
};
class AnzusLife_Money_Btnatm: AnzusLife_PhoneIconControlButton
{
      idc = 120009;
      x = 0.530937 * safezoneW + safezoneX;
      y = 0.2514 * safezoneH + safezoneY;
      w = 0.04125 * safezoneW;
      h = 0.022 * safezoneH;
      onButtonClick = "[] spawn anzus_fnc_atmmarker;";
};


class AnzusLife_Setup
{
    controls[] = {
        {"AnzusLife_Setup_SetupGroup", 180001}
    };
};

class AnzusLife_Setup_SetupGroup : Life_RscControlsGroupNoScrollbars
{
    idc = 180001;
    x = 0.318531 * safezoneW + safezoneX;
    y = 0.159 * safezoneH + safezoneY;
    w = 0.360937 * safezoneW;
    h = 0.638 * safezoneH;
    class controls {};
};



class AnzusLife_PhoneWarning : Life_RscControlsGroupNoScrollbars
{
  controls[] = {
    {"AnzusLife_PhoneWarning_Background", 50001},
    {"AnzusLife_PhoneWarning_TextGroup", 50002},
    {"AnzusLife_PhoneWarning_BtnCancel", 50003},
    {"AnzusLife_PhoneWarning_BtnOk", 50004}
  };
};

class AnzusLife_PhoneWarning_Background: AnzusLife_PhoneRscPicture
{
  text = "\ArmaGamingCore\images\phone\dialogImages\warning.paa";
  x = 0.3185 * safezoneW + safezoneX;
  y = 0.159 * safezoneH + safezoneY;
  w = 0.360937 * safezoneW;
  h = 0.638 * safezoneH;
};
class AnzusLife_PhoneWarning_TextGroup : Life_RscControlsGroupNoScrollbars
{
  x = 0.437095 * safezoneW + safezoneX;
  y = 0.4054  * safezoneH + safezoneY;
  w = 0.124775 * safezoneW;
  h = 0.121 * safezoneH;
  class controls
  {
    class Text: AnzusLife_PhoneStructuredText
    {
      idc = 1;
      text = "";
      w = 0.124775 * safezoneW;
      h = 0.121 * safezoneH;
    };
  };
};
class AnzusLife_PhoneWarning_BtnCancel: AnzusLife_PhoneIconControlButton
{
  x = 0.432969 * safezoneW + safezoneX;
  y = 0.533  * safezoneH + safezoneY;
  w = 0.0659999 * safezoneW;
  h = 0.0242 * safezoneH;
};
class AnzusLife_PhoneWarning_BtnOk: AnzusLife_PhoneIconControlButton
{
  x = 0.49897 * safezoneW + safezoneX;
  y = 0.533  * safezoneH + safezoneY;
  w = 0.0659999 * safezoneW;
  h = 0.0242 * safezoneH;
};
