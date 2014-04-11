_unit = _this;

[_unit] spawn
{
	_unit = _this select 0;

	while{alive _unit} do
	{
		_downed = _unit getVariable ["revive_down",false];
		if(_downed) then
		{
			[] call f_fnc_WoundedEffect;
		};
		sleep 2.5;
	};
};


while {alive _unit} do
{
	_downed = _unit getVariable ["revive_down",false];
	_bleeding = _unit getVariable ["revive_bleeding",false];
	_blood = _unit getVariable ["revive_blood",100];
    if(_downed || _bleeding) then
    {
    	_unit setVariable ["revive_blood",_blood - 0.3 max 0];
    	if(getBleedingRemaining _unit <= 0) then {    	_unit setBleedingRemaining 10;};
    }
	else
	{
		_unit setVariable ["revive_blood",_blood + 0.3 min 100];
	};
	if(_blood < 45 && !_downed) then
	{
		[[_unit,true], "f_fnc_SetDowned", true] spawn BIS_fnc_MP;
	};
	if(_blood <= 0) then
	{
		_unit setdamage 1;
	};
	sleep 1;
};
