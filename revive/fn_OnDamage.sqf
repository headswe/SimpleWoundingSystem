_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_totalDamage = damage _unit + _damage;
player sidechat format["%1 - '%2' - %3 - %4",_unit,_selection,_damage,_totalDamage];
if((_selection != "head") &&  _selection != ""  && _selection != "hands" && _totalDamage > 1) then
{
	if(!(_unit getVariable ["revive_down",false])) then
	{
		[[_unit,true], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
		_damage = 0;
		_unit spawn {_this allowDammage false;sleep 1;_this allowDammage true};
	};
};
if(isBleeding _unit && _unit getVariable ["revive_bleeding",false]) then
{
	_unit setVariable ["revive_bleeding",true,true];
};
_damage

//  || _selection != ""