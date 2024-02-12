#define CT_EDIT 2
#define FONT_NORMAL "PuristaLight"

#define ST_LEFT           0x00
#define ST_MULTI          0x10
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class Life_RscScrollBarIphoneXI
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class Life_RscControlsGroupIphoneXI {
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 16;

    class VScrollBar : Life_RscScrollBarIphoneXI
    {
        width = 0.021;
        autoScrollEnabled = 1;
    };

    class HScrollBar : Life_RscScrollBarIphoneXI
    {
        height = 0.028;
    };

    class Controls {};
};

class Life_RscControlsGroupNoScrollbarsIphoneXI : Life_RscControlsGroupIphoneXI {
    class VScrollbar : VScrollbar {
        width = 0;
    };

    class HScrollbar : HScrollbar {
        height = 0;
    };
};

class Life_Checkbox
{
    access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
    idc = -1; // Control identification (without it, the control won't be displayed)
    type = 77; // Type
    style = ST_LEFT + ST_MULTI; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

    x = 0;
    y = 0;
    w = 1 * GUI_GRID_CENTER_W; // Width
    h = 1 * GUI_GRID_CENTER_H; // Height

    //Colors
    color[] = { 1, 1, 1, 0.7 }; // Texture color
    colorFocused[] = { 1, 1, 1, 1 }; // Focused texture color
    colorHover[] = { 1, 1, 1, 1 }; // Mouse over texture color
    colorPressed[] = { 1, 1, 1, 1 }; // Mouse pressed texture color
    colorDisabled[] = { 1, 1, 1, 0.2 }; // Disabled texture color

    //Background colors
    colorBackground[] = { 0, 0, 0, 0 }; // Fill color
    colorBackgroundFocused[] = { 0, 0, 0, 0 }; // Focused fill color
    colorBackgroundHover[] = { 0, 0, 0, 0 }; // Mouse hover fill color
    colorBackgroundPressed[] = { 0, 0, 0, 0 }; // Mouse pressed fill color
    colorBackgroundDisabled[] = { 0, 0, 0, 0 }; // Disabled fill color

    //Textures
    textureChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";        //Texture of checked CheckBox.
    textureUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";        //Texture of unchecked CheckBox.
    textureFocusedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";    //Texture of checked focused CheckBox (Could be used for showing different texture when focused).
    textureFocusedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";    //Texture of unchecked focused CheckBox.
    textureHoverChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";

    tooltip = ""; // Tooltip text
    tooltipColorShade[] = { 0, 0, 0, 1 }; // Tooltip background color
    tooltipColorText[] = { 1, 1, 1, 1 }; // Tooltip text color
    tooltipColorBox[] = { 1, 1, 1, 1 }; // Tooltip frame color

    //Sounds
    soundClick[] = { "\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1 }; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = { "\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1 }; // Sound played when mouse cursor enters the control
    soundPush[] = { "\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1 }; // Sound played when the control is pushed down
    soundEscape[] = { "\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1 }; // Sound played when the control is released after pushing down

};

class Life_RscButtonInvisibleIphoneXI : Life_RscButtonMenu {
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
    colorBackground[] = {0, 0, 0, 0};
    colorBackground2[] = {1, 1, 1, 0};
    color[] = {1, 1, 1, 0};
    color2[] = {1, 1, 1, 0};
    colorText[] = {1, 1, 1, 0};
    colorDisabled[] = {1, 1, 1, 0};
};

class Life_RscEditIphoneXI
  {
    deletable = 0;
    fade = 0;
    access = 0;
    type    = CT_EDIT;
    style = "16 + 512 + 2";
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.95,0.95,0.95,1};
    colorDisabled[] = {1,1,1,0.25};
    colorSelection[] = {1,1,1,0.25};
    autocomplete = "";
    text = "";
    size = 1;
    font = FONT_NORMAL;
    onKeyDown = "params [""_control"", ""_key"", ""_shift""];if (_key isEqualTo 28) then {true}else{false};";
    lineSpacing = 0;
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    canModify = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};

class Life_RscListBoxIphoneXI : Life_RscListBox {
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,1};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.65,0.65,0.65,0.5};
    colorSelectBackground2[] = {0.65,0.65,0.65,0.5};
    sizeex = 0.035;
};

class Life_RscComboIphoneXI : Life_RscCombo {
    colorBackground[] = {1,1,1,0.8};
    color[] = {0,0,0,1};
    colorText[] = {0,0,0,1};
    colorSelectBackground[] = {0.65,0.65,0.65,0.5};
};

class Life_RscTextIphoneXI : Life_RscText {
    shadow = 0;
};
