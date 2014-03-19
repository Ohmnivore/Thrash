package ;

import entities.Player;
import flixel.addons.plugin.effects.FlxSpecialFX;
import flixel.addons.plugin.effects.fx.StarfieldFX;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.util.FlxRect;
import haxe.xml.Fast;
/**
 * ...
 * @author Ohmnivore
 */

class OgmoLoader
{
	public static var tilemaps:Map<String, String>;
	
	static public function initTilemaps():Void
	{
		//Initializing entities
		Player;
		
		tilemaps = new Map();
		tilemaps.set("test", "media/images/platformertiles.png");
	}
	
	static public function loadXML(XML:String, State:PlayState):Void
	{
		var xml = Xml.parse(XML);
		
		var fast = new Fast(xml.firstElement());
		
		if (FlxG.plugins.get(FlxSpecialFX) == null) FlxG.plugins.add(new FlxSpecialFX());
		State.starfx = FlxSpecialFX.starfield();
		State.add(State.starfx.create(0, 0, FlxG.width, FlxG.height, 50, StarfieldFX.STARFIELD_TYPE_2D));
		State.starfield = State.starfx.sprite;
		State.starfield.scrollFactor.set();
		State.background.add(State.starfield);
		
		State.starfx.setBackgroundColor(0xff);
		State.starfx.setStarDepthColors(3, 0xff585858, 0xffABABAB);
		State.starfx.setStarSpeed( -1, 1);
		
		for (x in fast.elements)
		{
			if (x.has.tileset) //Tilemap
			{
				var map:FlxTilemapAppear = new FlxTilemapAppear();
				map.loadMap(x.innerData, tilemaps.get(x.att.tileset), 16, 16, 0, 0, 0, 0);
				State.maps.add(map);
				
				if (x.name.indexOf("Tiles") > -1)
				{
					State.collidemap = map;
					FlxG.worldBounds.set(map.x - 100, map.y - 100, map.width + 200, map.height + 200);
					State.bounds = new FlxRect(map.x - 100, map.y - 100, map.width + 200, map.height + 200);
				}
				
				FlxG.worldBounds.set(map.x, map.y, map.width, map.height);
			}
			
			else //Entity layer
			{
				for (ent in x.elements)
				{
					Type.createInstance(Type.resolveClass("entities." + ent.name), [ent]);
				}
			}
		}
	}
}