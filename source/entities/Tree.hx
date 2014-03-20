package entities;
import flixel.FlxSprite;
import haxe.xml.Fast;

/**
 * ...
 * @author Ohmnivore
 */
class Tree extends FlxSpriteAppear
{
	public var data:Fast;
	
	public function new(Data:Fast)
	{
		data = Data;
		
		super(Std.parseInt(data.att.x), Std.parseInt(data.att.y));
		
		loadGraphic("media/images/tree.png");
		
		Reg.state.undermap.add(this);
		
		//visible = false;
	}
	
}