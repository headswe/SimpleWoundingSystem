_veh = _this select 0;
_caller = _this select 1;

{
	if(_x getVariable ["revive_down",false]) then
	{
		_x action["eject",_veh];
		sleep 0.2
		;
		_x switchmove "acts_InjuredLookingRifle02";
	};
} foreach crew _veh;
_veh removeAction (_this select 2);