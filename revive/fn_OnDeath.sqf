_unit = _this select 0;
//player sidechat "im dead";
if(_unit getVariable ["revive_down",false]) then
{
	[[_unit,false], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
};