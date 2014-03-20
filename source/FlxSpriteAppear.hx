package ;
import flixel.FlxObject;
import flixel.FlxSprite;

/**
 * ...
 * @author Ohmnivore
 */
class FlxSpriteAppear extends FlxSprite
{
	static public var player:FlxObject;
	static public var radius:Int;
	
	public var tween:TweenAppear;
	
	public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		visible = false;
		alpha = 0;
		tween = new TweenAppear(false);
	}
	
	override public function update():Void
	{
		if (!visible && tween.fall != 0)
		{
			if (Math.pow(player.x + player.width/2 - x - width/2, 2) + Math.pow(player.y + player.height/2 - y - height/2, 2) <= Math.pow(((width + height) / 4 + player.width / 2) + 100, 2))
			{
				visible = true;
				tween.makeFall();
			}
		}
		
		super.update();
	}
	
	override public function draw():Void
	{
		if (alpha != tween.alpha) alpha = tween.alpha;
		
		if (tween.fall != 0)
		{
			y += tween.fall;
			super.draw();
			y -= tween.fall;
		}
		
		else
		{
			super.draw();
		}
	}
}