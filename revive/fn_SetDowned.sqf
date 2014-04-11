// acts_InjuredLookingRifle02
_unit = _this select 0;
_bool = _this select 1;
if(_bool && alive _unit) then
{
	if(_unit getVariable ["revive_down",false]) exitWith {};
	player sidechat "im down";
	_unit setVariable ["revive_down",true,true];

	_unit setCaptive 1;
	if(local _unit && isPlayer _unit) then
	{
		_unit setVariable ["revive_down_mags",magazines _unit];
		{
			_unit removeMagazine _x;
		} foreach magazines _unit;
		showHud false;

	};

	if(damage _unit < 0.25) then {_unit setdamage 0.26};

	_addIndex = _unit addAction [format ["Drag %1", name _unit],{[_this, "f_fnc_OnDrag", true,false] spawn BIS_fnc_MP;}, nil, 6, false, true, "", "_var = _this getVariable ['revive_dragging',nil];_target distance _this < 2 && isNil '_var'"];
	_unit setVariable ["revive_dragIndex",_addIndex];
	if(vehicle _unit == _unit) then
	{
		_unit switchmove "acts_InjuredLookingRifle02";
		player sidechat "IM SO DOWN";
	}
	else
	{
		_anim = getArray (configfile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "interpolateTo");
		_unit switchmove (_anim select 0);
		_veh = vehicle _unit;
		_veh addAction  ["Pull out wounded", {[_this, "f_fnc_EjectWounded", true,false] spawn BIS_fnc_MP;}, nil, 5, false, true, "", "_target distance _this < 5 && [_target] call f_fnc_HasWounded"];
	};
}
else
{
	_unit setVariable ["revive_down",false,true];
	if(vehicle _unit == _unit) then
	{
		_unit switchmove "AinjPpneMstpSnonWnonDnon_rolltofront";
	}
	else
	{
		_unit switchmove "";
	};

	_unit setCaptive 0;
	_dragIndex = _unit getVariable ["revive_dragIndex",-1];
	if(_dragIndex >= 0) then {_unit removeAction _dragIndex};
	_unit setVariable ["revive_dragIndex",-1];
	if(local _unit && isPlayer _unit) then
	{
		_mags = _unit getVariable ["revive_down_mags",magazines _unit];
		{
			_unit addMagazine _x;
		} foreach _mags;
		showHud true;
		F_UncToggle = true;
		[] spawn f_fnc_WoundedEffect;
		sleep 0.1;
		_unit playMove "amovppnemstpsraswrfldnon";
	};
};
