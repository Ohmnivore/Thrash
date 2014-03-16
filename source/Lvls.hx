package ;
import flash.utils.ByteArray;

/**
 * ...
 * @author Ohmnivore
 */

@:file("media/lvls/Test.oel") class Test extends ByteArray { }

class Lvls
{
	static public var totallvls:Int = 1;
	
	static public function loadLVL(Index:String):String
	{
		var lvl:Dynamic = Type.createInstance(Type.resolveClass(Std.string(Index)), []);
		var clvl:ByteArray = cast(lvl, ByteArray);
		return clvl.toString();
	}
}