[] spawn {
	["You've taken some morphine and feel the effects of it",false,"slow"] call ANZUS_fnc_notificationSystem;
    for "_i" from 0 to 5 do
    {
        colorCorr = ppEffectCreate ["colorCorrections", 1555]; 
        colorCorr ppEffectEnable true;
        colorCorr ppEffectAdjust [1, 1, -0.03, [0.0, 0.0, 0.0, 0.0], [2.0, 7.0, 6.0, 2.0],[0.1,0.0,0.0,0.3]];
        colorCorr ppEffectCommit 2;
        uiSleep random(2);
        wetEff = ppEffectCreate ["wetDistortion", 2006];
        wetEff ppEffectAdjust [0, 0.1, 0.1,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
        wetEff ppEffectEnable true;
        wetEff ppEffectCommit 0;
        ppe = ppEffectCreate ["colorCorrections", 1555]; 
        ppe ppEffectAdjust [1, 1, 0, [1,3,1.5,0.2], [1,0.6,1,-0.1], [-2,2,-2,-0.2]]; 
        ppe ppEffectCommit 2;
        ppe ppEffectEnable true; 
        ppe2 = ppEffectCreate ["chromAberration", 1555]; 
        ppe2 ppEffectAdjust [0.01,0.01,true];
        ppe2 ppEffectCommit 2;
        ppe2 ppEffectEnable true;
        ppe3 = ppEffectCreate ["radialBlur", 1555]; 
        ppe3 ppEffectEnable true;
        ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
        ppe3 ppEffectCommit 2;
        uiSleep random(2);
        wetEff = ppEffectCreate ["wetDistortion", 2006];
        wetEff ppEffectAdjust [0.5, 0.1, 0.1, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
        wetEff ppEffectEnable true;
        wetEff ppEffectCommit 0;
        uiSleep random(2);
        colorCorr = ppEffectCreate ["colorCorrections", 1555]; 
        colorCorr ppEffectEnable true;
        colorCorr ppEffectAdjust [1, 1, -0.02, [4.5, 0.7, 1.2, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
        colorCorr ppEffectCommit 2;
        uiSleep random(2);
    };

    colorCorr ppEffectAdjust [1, 1, 1, [1,1,1,1], [1,1,1,1],[1,1,1,1]];
    colorCorr ppEffectCommit 3;
    uiSleep 3;
    colorCorr ppEffectEnable false;
    wetEff ppEffectEnable false;
    ppe ppEffectEnable false;
    ppe2 ppEffectEnable false;
    ppe3 ppEffectEnable false;
    
    ppEffectDestroy[colorCorr,wetEff,ppe,ppe2,ppe3];
};