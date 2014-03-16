package flixel.input;

import flixel.FlxG;
import flixel.plugin.FlxPlugin;
import flixel.system.debug.FlxDebugger;
import flixel.system.FlxAssets;
import flixel.system.frontEnds.PluginFrontEnd;
import flixel.util.FlxAngle;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxStringUtil;

@:allow(flixel.input.mouse.FlxMouseButton)
@:allow(flixel.input.touch.FlxTouch)
class FlxSwipe
{	
	/**
	 * Either LEFT_MOUSE, MIDDLE_MOUSE or RIGHT_MOUSE, 
	 * or the touchPointID of a FlxTouch.
	 */
	public var ID:Int;
	
	public var startPosition:FlxPoint;
	public var endPosition:FlxPoint;
	
	public var distance(get, never):Float;
	public var angle   (get, never):Float;
	public var duration(get, never):Float;
	
	private var _startTimeInTicks:Float;
	
	private function new(ID:Int, StartPosition:FlxPoint, EndPosition:FlxPoint, StartTimeInTicks:Float)
	{
		this.ID = ID;
		startPosition = StartPosition;
		endPosition = EndPosition;
		_startTimeInTicks = StartTimeInTicks;
	}
	
	private inline function toString():String
	{
		return FlxStringUtil.getDebugString([ { label: "ID", value: ID }, 
		                                      { label: "start", value: startPosition },
		                                      { label: "end", value: endPosition },
		                                      { label: "distance", value: distance },
		                                      { label: "angle", value: angle },
		                                      { label: "duration", value: (duration / 1000) } ]);
	}
	
	private inline function get_distance():Float
	{
		return FlxMath.vectorLength(startPosition.x - endPosition.x, startPosition.y - endPosition.y);
	}
	
	private inline function get_angle():Float
	{
		return FlxAngle.getAngle(startPosition, endPosition); 
	}
	
	private inline function get_duration():Float
	{
		return (FlxG.game.ticks - _startTimeInTicks);
	}
}