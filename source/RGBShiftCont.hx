package;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.display.BitmapDataChannel;
import flash.display.BlendMode;
import flash.events.Event;
import flash.geom.Point;
import flixel.FlxG;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.MultiVarTween;

class RGBShiftCont extends Sprite {

	private var _centerX:Float;
	private var _centerY:Float;
	private var r:Sprite;
	private var g:Sprite;
	private var b:Sprite;
	private var arr:Array<Sprite>;
	private var br:BitmapData;
	private var bg:BitmapData;
	private var bb:BitmapData;
	private var barr:Array<BitmapData>;
	private var tr:TweenContainer;
	private var tg:TweenContainer;
	private var tb:TweenContainer;

	// CONSTRUCTOR
	public function new(dObj:BitmapData)
	{
		super();
		
		r = new Sprite();
		r.scaleX = FlxG.camera.zoom;
		r.scaleY = FlxG.camera.zoom;
		g = new Sprite();
		g.scaleX = FlxG.camera.zoom;
		g.scaleY = FlxG.camera.zoom;
		b = new Sprite();
		b.scaleX = FlxG.camera.zoom;
		b.scaleY = FlxG.camera.zoom;
		
		arr = [r, g, b];
		addChild(r);
		addChild(g);
		addChild(b);
		
		//br = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			//Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		//bg = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			//Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		//bb = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			//Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		//barr = [br, bg, bb];
		br = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		bg = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		bb = new BitmapData(Std.int(dObj.width * FlxG.camera.zoom),
			Std.int(dObj.height * FlxG.camera.zoom), true, 0xFF000000);
		barr = [br, bg, bb];
		
		tr = new TweenContainer();
		tg = new TweenContainer();
		tb = new TweenContainer();
		distort(tr);
		distort(tg);
		distort(tb);
		
		update(dObj);
	}
	
	public function update(dObj:BitmapData):Void
	{
		createRGB(dObj);
		var rgbBMD:Array<BitmapData> = barr;
		
		var i:Int = 0;
		while (i < rgbBMD.length)
		{
			var bmp:Bitmap = new Bitmap(rgbBMD[i]);
			bmp.smoothing = true;
			
			var container:Sprite = arr[i]; // container sprite
			//container
			while (container.numChildren > 0) {
				container.removeChildAt(0);
			}
			container.addChildAt(bmp, 0); // add the Bitmap to the Sprite's display list
			
			if (i > 0) 
			{
				// set SCREEN blend mode for the 2nd and 3rd images
				bmp.blendMode = BlendMode.SCREEN;
			}
			
			// find the center
			_centerX = 0;
			_centerY = 0;
			
			// center the image
			bmp.x = 0 - _centerX;
			bmp.y =	0 - _centerY;

			container.x = _centerX;
			container.y = _centerY;
			
			i++;
		}
		
		r.y = tr.y;
		g.y = tg.y;
		b.y = tb.y;
		
		r.x = tr.x;
		g.x = tg.x;
		b.x = tb.x;
		
		//r.alpha = tr.alpha;
		//g.alpha = tg.alpha;
		//b.alpha = tb.alpha;
	}
	
	private function createRGB(bmd:BitmapData)
	{
		// copy the data from each channel into the corresponding bitmap data
		br.copyChannel(bmd, bmd.rect, new Point(),
						BitmapDataChannel.RED, BitmapDataChannel.RED);
		bg.copyChannel(bmd, bmd.rect, new Point(),
						BitmapDataChannel.GREEN, BitmapDataChannel.GREEN);
		bb.copyChannel(bmd, bmd.rect, new Point(),
						BitmapDataChannel.BLUE, BitmapDataChannel.BLUE);
	}
	
	private function distort(img:TweenContainer):Void
	{
		var opt:TweenOptions = { };
		opt.ease = FlxEase.sineInOut;
		opt.complete = distortx;
		//opt.
		FlxTween.multiVar(img, {
								y: randRange(_centerY - 1, _centerY + 1),	// randomize y shift
								x: randRange(_centerX-1, _centerX+1),	// randomize y shift
								alpha: randRange(10, 10) / 10
								}
							, randRange(1, 2) / 10,
							opt
							);
		//tween.obje
	}
	
	private function distortx(flx:FlxTween):Void
	{
		var img:Dynamic = cast(flx, MultiVarTween)._object;
		var opt:TweenOptions = { };
		opt.ease = FlxEase.sineInOut;
		opt.complete = distortx;
		FlxTween.multiVar(img, {
								y: randRange(_centerY - 1, _centerY + 1),	// randomize y shift
								x: randRange(_centerX-1, _centerX+1),	// randomize y shift
								alpha: randRange(10, 10) / 10
								}
							, randRange(1, 2) / 10,
							opt
							);
	}
	
	public function randRange(min:Float, max:Float):Int 
	{
        var randomNum:Int = Math.floor(Math.random() * (Std.int(max) - Std.int(min) + 1)) + Std.int(min);
        return randomNum;
    }
}

class TweenContainer {
	public var y:Float = 0;
	public var x:Float = 0;
	public var alpha:Float = 1;
	
	public function new() {}
}