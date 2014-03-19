package entities;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.util.FlxRect;
import haxe.xml.Fast;
import flixel.FlxSprite;

import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;

/**
 * ...
 * @author Ohmnivore
 */
class Player extends FlxSprite
{
	public var data:Fast;
	
	public function new(Data:Fast) 
	{
		data = Data;
		
		super(Std.parseInt(data.att.x), Std.parseInt(data.att.y));
		
		//loadGraphic('assets/images/sprite/$spritename.png', true, false, 96, 64);
		makeGraphic(16, 24, FlxColor.CHARCOAL);
		
		FlxG.camera.follow(this, FlxCamera.STYLE_LOCKON, 6);
		FlxG.camera.followLead.x = 10.0;
		FlxG.camera.followLead.y = 10.0;
		FlxG.camera.followLerp = 30.0;
		FlxG.camera.focusOn(this.getMidpoint());
		
		FlxControl.create(
			this,
			FlxControlHandler.MOVEMENT_ACCELERATES,
			FlxControlHandler.STOPPING_DECELERATES,
			1,
			true,
			true
			);
		
		if (FlxG.plugins.get(FlxControl) == null) FlxG.plugins.add(new FlxControl());
		FlxControl.player1.setGravity(0, 350);
		var bounds:FlxRect = FlxG.worldBounds;
		FlxControl.player1.setBounds(Std.int(bounds.x), Std.int(bounds.y),
			Std.int(bounds.width), Std.int(bounds.height));
		FlxControl.player1.setCursorControl(false, false, true, true);
		FlxControl.player1.setJumpButton("UP", FlxControlHandler.KEYMODE_JUST_DOWN, 230,
			FlxObject.FLOOR, 250, 100);
		FlxControl.player1.setAdvancedMovementSpeed(2000, 2000, 230, 110, 150, 200, 2000, 200);
		FlxControl.start();
		
		Reg.state.player = this;
		Reg.state.playerlayer.add(this);
		
		FlxTilemapAppear.radius = Std.int(350);
		FlxTilemapAppear.player = this;
	}
	
	override public function update():Void
	{
		super.update();
	}
}