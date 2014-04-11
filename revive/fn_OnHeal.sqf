_unit = _this select 0;
_healer = _this select 1;
_ret = false;
if(_unit == _healer && _unit getVariable ["revive_down",false] ) then{_ret = true};
player sidechat "im healed";
if(_unit getVariable ["revive_bleeding",false]) then
{
	_unit setVariable ["revive_bleeding",false];
};
if(_unit getVariable ["revive_down",false] && !_ret) then
{
	[[_unit,false], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
};
_ret