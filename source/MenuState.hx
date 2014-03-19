package;

import flixel.addons.display.FlxZoomCamera;
import flixel.addons.plugin.effects.FlxSpecialFX;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.scaleModes.FillScaleMode;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = true;
		#end
		
		super.create();
		
		if (FlxG.camera.zoom > 1)
		{
			var cam:FlxZoomCamera = new FlxZoomCamera(0, 0, FlxG.width, FlxG.height, FlxG.camera.zoom);
			cam.followLead.x = 10.0;
			cam.followLead.y = 10.0;
			cam.followLerp = 30.0;
			FlxG.cameras.reset(cam);
			FlxG.scaleMode = new FillScaleMode();
			FlxG.cameras.bgColor = 0xff000000;
		}
		
		else
		{
			FlxG.camera.followLead.x = 10.0;
			FlxG.camera.followLead.y = 10.0;
			FlxG.camera.followLerp = 30.0;
			FlxG.scaleMode = new FillScaleMode();
			FlxG.cameras.bgColor = 0xff000000;
		}
		
		FlxG.camera.setSize(320, 244);
		
		var spr:FlxSprite = new FlxSprite();
		spr.loadGraphic("media/images/test.png");
		add(spr);
		
		//FlxG.game.startEffect();
		
		//var d:RGBShift = new RGBShift(spr.pixels);
		//FlxG.game.stage.addChild(d);
		FlxG.switchState(new PlayState());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}