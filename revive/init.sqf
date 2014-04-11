sleep 0.1;
_unit = _this select 0;
_unit setVariable ["revive_down",false,true];
_unit setVariable ["revive_bleeding",false,true];
_unit setVariable ["revive_blood",100]; // other player dont need know this
_unit setVariable ["revive_dragging",nil];
_unit spawn f_fnc_LifeTick;

{
	_x addEventHandler ["HandleHeal",{_this call f_fnc_OnHeal}];
} foreach playableUnits;

// effects
F_UncCC = ppEffectCreate ["ColorCorrections", 1603];
F_UncRadialBlur = ppEffectCreate ["RadialBlur", 280];
F_UncBlur = ppEffectCreate ["DynamicBlur", 180];
F_UncToggle = false;
F_damageValue = 1.1;






_unit addEventHandler ["killed", {_this call f_fnc_OnDeath}];
//_unit addEventHandler ["HandleHeal",{_this call f_fnc_OnHeal}];
_unit addEventHandler ["HandleDamage",{_this call f_fnc_OnDamage}];

_unit sidechat "script inited";