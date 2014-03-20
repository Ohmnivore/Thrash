package;
import flixel.FlxObject;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author Ohmnivore
 */
class TweenAppear
{
	public var showed:Bool = false;
	public var fall:Float = 100;
	public var fallinit:Float = 100;
	public var alpha:Float = 0.0;
	
	public function new(fromDown:Bool = true)
	{
		if (!fromDown)
		{
			fall *= -1;
			fallinit *= -1;
		}
	}
	
	public function makeFall():Void
	{
		if (!showed)
		{
			var opt:TweenOptions = { };
			opt.ease = FlxEase.quadOut;
			FlxTween.singleVar(this, "fall", 0, 1, opt);
			FlxTween.singleVar(this, "alpha", 1, 2.0, opt);
			showed = true;
		}
	}
	
}