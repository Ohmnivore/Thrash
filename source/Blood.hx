package ;
import flixel.FlxSprite;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Ohmnivore
 */
class Blood extends FlxSprite
{

	public function new(X:Float, Y:Float) 
	{
		super(X - 50, Y - 50);
		loadGraphic("media/images/blood.png", false, false, 100, 100);
		
		animation.add("anim", [FlxRandom.intRanged(0, 15)], 1, false);
		animation.play("anim");
		
		Reg.state.maps.add(this);
	}
	
	override public function update():Void
	{
		alpha -= 0.01;
		
		if (alpha <= 0)
		{
			kill();
			destroy();
		}
	}
}