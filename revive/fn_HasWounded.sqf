_veh = _this select 0;
_ret = false;
{
	if(_x getVariable ["revive_down",false]) then
	{
		_ret = true;
	};
}	foreach crew _veh;
_ret