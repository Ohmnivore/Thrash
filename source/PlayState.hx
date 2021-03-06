package;

import entities.Player;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.display.FlxStarField.FlxStarField2D;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.misc.VarTween;
import flixel.util.FlxSpriteUtil;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRect;
import flash.display.BlendMode;
import flash.utils.ByteArray;
import flash.filters.ShaderFilter;
import flash.display.Shader;

@:file("media/splitter.pbj") class Splitter extends ByteArray { }

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	public var background:FlxGroup;
	public var maps:FlxGroup;
	public var undermap:FlxGroup;
	public var playerlayer:FlxGroup;
	public var overmaps:FlxGroup;
	public var emitters:FlxGroup;
	public var overlay:FlxGroup;
	
	public var collidemap:FlxTilemapAppear;
	public var player:Player;
	public var starfx:FlxStarField2D;
	
	public var bounds:FlxRect;
	
	public var s:ShaderFilter;
	public var scanlines:ShaderFilter;
	public var scan:FlxSprite;
	
	public var r:TweenHelper;
	public var g:TweenHelper;
	public var b:TweenHelper;
	
	
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
		undermap = new FlxGroup();
		add(undermap);
		maps = new FlxGroup();
		add(maps);
		playerlayer = new FlxGroup();
		add(playerlayer);
		overmaps = new FlxGroup();
		add(overmaps);
		emitters = new FlxGroup();
		add(emitters);
		overlay = new FlxGroup();
		add(overlay);
		
		Reg.state = this;
		
		OgmoLoader.loadXML(Lvls.loadLVL("Test"), this);
		
		//FlxG.game.startEffect();
		
		scan = new FlxSprite();
		scan.loadGraphic("media/images/scan.png");
		scan.scrollFactor.x = scan.scrollFactor.y = 0;
		scan.blend = BlendMode.OVERLAY;
		overlay.add(scan);
		
		r = new TweenHelper();
		g = new TweenHelper();
		b = new TweenHelper();
		
		TweenHelper.distort(r);
		TweenHelper.distort(g);
		TweenHelper.distort(b);
		
		var _s:Shader = new Shader(new Splitter());
		s = new ShaderFilter(_s);
		
		FlxG.camera.setSize(320, 244);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
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
		
		s.shader.data.or.value = [r.x, r.y];
		s.shader.data.og.value = [g.x, g.y];
		s.shader.data.ob.value = [b.x, b.y];
		
		FlxG.camera.buffer.applyFilter(FlxG.camera.buffer,
			new Rectangle(0, 0, FlxG.width, FlxG.height),
			new Point(0, 0),
			s);
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

class TweenHelper
{
	public var y:Float = 0;
	public var x:Float = 0;
	
	public function new()
	{
		
	}
	
	static public function randRange(min:Float, max:Float):Int 
	{
        var randomNum:Int = Math.floor(Math.random() * (Std.int(max) - Std.int(min) + 1)) + Std.int(min);
        return randomNum;
    }
	
	static public function distort(img:TweenHelper):Void
	{
		var opt:TweenOptions = { };
		opt.ease = FlxEase.sineInOut;
		opt.complete = distortx;
		FlxTween.tween(img, {
								y: randRange( - 1, 1),	// randomize y shift
								}
							, randRange(1, 2) / 10,
							opt
							);
	}
	
	static public function distortx(flx:FlxTween):Void
	{
		var img:Dynamic = Reflect.getProperty(cast(flx, VarTween), "_object");
		var opt:TweenOptions = { };
		opt.ease = FlxEase.sineInOut;
		opt.complete = distortx;
		FlxTween.tween(img, {
								y: randRange(- 1, 1),	// randomize y shift
								}
							, randRange(1, 2) / 10,
							opt
							);
	}
}