package flixel.input.gamepad;

class FlxGamepadButton
{
	public var id:Int;
	public var current:Int;
	public var last:Int;
	
	public function new(ID:Int, Current:Int = 0, Last:Int = 0)
	{
		id = ID;
		current = Current;
		last = Last;
	}
	
	public function reset():Void
	{
		current = 0;
		last = 0;
	}
}