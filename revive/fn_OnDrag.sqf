_unit = _this select 0;
_dragger = _this select 1;
_dragger setVariable ["revive_dragging",_unit,true];
if(local _dragger) then
{
	_unit addAction [format["Release %1",name _unit],{(_this select 1) setVariable ["revive_dragging",nil,true];(_this select 0) removeAction (_this select 2);}, nil, 6, false, true, "", "true"];
};
_unit attachTo [_dragger, [0, 1.1, 0.092]];
_dragger playMoveNow "acinpknlmstpsraswrfldnon";
_unit switchMove "AinjPpneMrunSnonWnonDb_grab";
_unit playMove "AinjPpneMrunSnonWnonDb";
_unit SetDir 180;
_unit SetPos (getpos _unit);
waitUntil {
	sleep 0.1;
	_dude =  _dragger getVariable ["revive_dragging",nil];
	( isNil "_dude" || !alive _dragger)
};
player sideChat "stopped draging";
detach _unit;
_unit setpos getpos _dragger;
_unit switchMove "AinjPpneMstpSnonWrflDb_release";
sleep 0.1;
if(_unit getVariable ["revive_down",false]) then
{
	_unit switchMove "acts_InjuredLookingRifle02";
}
else
{
	_unit switchMove "amovppnemstpsraswrfldnon";
};
if(_dragger getVariable ["revive_down",false]) then
{
	_dragger switchMove "acts_InjuredLookingRifle02";
}
else
{
	_dragger switchMove "";
};
