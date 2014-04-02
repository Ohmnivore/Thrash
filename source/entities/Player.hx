package entities;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.util.FlxRect;
import flixel.util.loaders.TexturePackerData;
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
		
		loadGraphic("media/images/agent_run4.png", true, true, 16, 24);
		animation.add("run", [0, 1, 2, 3, 4, 5, 6, 7, 8], 15, true);
		animation.add("idle", [9, 10], 2, true);
		animation.play("idle");
		animation.add("jump", [18, 19, 20], 9, false);
		animation.add("mergejump", [19, 19], 13, false);
		animation.add("punch", [27, 28, 29, 29, 29], 16, false);
		
		width -= 6;
		offset.x = 3;
		
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
		FlxSpriteAppear.radius = Std.int(350);
		FlxSpriteAppear.player = this;
	}
	
	override public function update():Void
	{
		if (FlxG.keys.justPressed.X)
		{
			if (animation.getByName("punch").finished)
			{
				animation.play("punch");
				new Blood(x, y);
			}
		}
		
		if (animation.getByName("punch").finished)
		{
			if (isTouching(FlxObject.ANY) && velocity.x != 0)
			{
				animation.play("run");
			}
			
			else
			{
				if (velocity.y >= 0)
				{
					var isnotrun:Bool = true;
					
					if (animation.name == "run")
					{
						animation.play("idle");
						isnotrun = true;
						
					}
					
					if (animation.name == "jump" && isnotrun)
					{
						animation.play("mergejump");
					}
					
					else
					{
						if (animation.curAnim == null)
							animation.play("idle");
					}
				}
			}
			
			if (FlxG.keys.justPressed.UP && isTouching(FlxObject.ANY))
			{
				animation.play("jump", true);
			}
		}
		
		super.update();
	}
}