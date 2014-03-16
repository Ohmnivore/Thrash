package;

import entities.Player;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.effects.FlxSpecialFX;
import flixel.addons.plugin.effects.fx.StarfieldFX;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRect;
import flash.display.BlendMode;
import flash.utils.ByteArray;
import flash.filters.ShaderFilter;
import flash.display.Shader;

//@:file("media/splitter.pbj") class Shade extends ByteArray { }

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var background:FlxGroup;
	public var maps:FlxGroup;
	public var playerlayer:FlxGroup;
	public var overlay:FlxGroup;
	
	public var collidemap:FlxTilemap;
	public var player:Player;
	public var starfx:StarfieldFX;
	public var starfield:FlxSprite;
	
	public var bounds:FlxRect;
	
	public var s:ShaderFilter;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xffDEDEDE;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = false;
		#end
		
		super.create();
		
		background = new FlxGroup();
		add(background);
		maps = new FlxGroup();
		add(maps);
		playerlayer = new FlxGroup();
		add(playerlayer);
		overlay = new FlxGroup();
		add(overlay);
		
		Reg.state = this;
		
		OgmoLoader.loadXML(Lvls.loadLVL("Test"), this);
		
		FlxG.game.startEffect();
		
		var scan:FlxSprite = new FlxSprite();
		scan.loadGraphic("media/images/scan.png");
		scan.scrollFactor.x = scan.scrollFactor.y = 0;
		scan.blend = BlendMode.OVERLAY;
		overlay.add(scan);
		
		//var _s:Shader = new Shader(new Shade());
		//s = new ShaderFilter(_s);
		//s.shader.data.og.value = [100, 5];
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		FlxG.plugins.removeType(FlxSpecialFX);
		FlxG.plugins.removeType(FlxControl);
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		FlxG.collide(playerlayer, collidemap);
		checkBounds();
	}
	
	override public function draw():Void
	{
		super.draw();
		//FlxG.camera.buffer.applyFilter(FlxG.camera.buffer,
			//new Rectangle(0, 0, FlxG.width, FlxG.height),
			//new Point(0, 0),
			//s);
	}
	
	public function checkBounds():Void
	{
		if (!bounds.containsFlxPoint(player.getMidpoint()))
		{
			//trace("lol");
			FlxG.camera.fade(0xffffffff, 3);
		}
	}
}