package flixel.tile;
import flixel.FlxObject;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Ohmnivore
 */
class FlxTileObj extends FlxObject
{
	public var showed:Bool = false;
	public var fall:Float = 100;
	public var alpha:Float = 0.0;
	
	public function new(X:Float = 0.0, Y:Float = 0.0)
	{
		super(X, Y);
	}
	
	public function makeFall():Void
	{
		if (!showed)
		{
			visible = true;
			var opt:TweenOptions = { };
			opt.ease = FlxEase.quadOut;
			FlxTween.singleVar(this, "fall", 0, 1, opt);
			FlxTween.singleVar(this, "alpha", 1, 2.0, opt);
			showed = true;
		}
	}
	
}