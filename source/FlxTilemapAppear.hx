package ;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.addons.editors.tiled.TiledObject;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxTilemapBuffer;
import flixel.util.FlxColorUtil;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Ohmnivore
 */
class FlxTilemapAppear extends FlxTilemap
{
	public var objMap:Map<Int, TweenAppear>;
	static public var player:FlxObject;
	static public var radius:Int;
	private var flashp:Point;
	private var alphaBitmap:BitmapData;
	private var alphaHelper:Point;
	private var alpharect:Rectangle;
	private var alphapoint:Point;
	private var tileobj:TweenAppear;
	
	public function new()
	{
		super();
		objMap = new Map();
		flashp = new Point();
		alphaBitmap = new BitmapData(16, 16, true, 0xff000000);
	}
	
	/**
	 * Load the tilemap with string data and a tile graphic.
	 * 
	 * @param	MapData      	A string of comma and line-return delineated indices indicating what order the tiles should go in, or an Array of Int. YOU MUST SET widthInTiles and heightInTyles manually BEFORE CALLING loadMap if you pass an Array!
	 * @param	TileGraphic		All the tiles you want to use, arranged in a strip corresponding to the numbers in MapData.
	 * @param	TileWidth		The width of your tiles (e.g. 8) - defaults to height of the tile graphic if unspecified.
	 * @param	TileHeight		The height of your tiles (e.g. 8) - defaults to width if unspecified.
	 * @param	AutoTile		Whether to load the map using an automatic tile placement algorithm (requires 16 tiles!).  Setting this to either AUTO or ALT will override any values you put for StartingIndex, DrawIndex, or CollideIndex.
	 * @param	StartingIndex	Used to sort of insert empty tiles in front of the provided graphic.  Default is 0, usually safest ot leave it at that.  Ignored if AutoTile is set.
	 * @param	DrawIndex		Initializes all tile objects equal to and after this index as visible. Default value is 1.  Ignored if AutoTile is set.
	 * @param	CollideIndex	Initializes all tile objects equal to and after this index as allowCollisions = ANY.  Default value is 1.  Ignored if AutoTile is set.  Can override and customize per-tile-type collision behavior using setTileProperties().
	 * @return	A reference to this instance of FlxTilemap, for chaining as usual :)
	 */
	override public function loadMap(MapData:Dynamic, TileGraphic:Dynamic, TileWidth:Int = 0, TileHeight:Int = 0, AutoTile:Int = 0, StartingIndex:Int = 0, DrawIndex:Int = 1, CollideIndex:Int = 1):FlxTilemap
	{
		var tilemap:FlxTilemap = super.loadMap(MapData, TileGraphic, TileWidth, TileHeight, AutoTile, StartingIndex, DrawIndex, CollideIndex);
		
		alpharect = new Rectangle(0, 0, _scaledTileWidth, _scaledTileHeight);
		alphapoint = new Point();
		
		return tilemap;
	}
	
	/**
	 * Internal function that actually renders the tilemap to the tilemap buffer. Called by draw().
	 * 
	 * @param	Buffer		The FlxTilemapBuffer you are rendering to.
	 * @param	Camera		The related FlxCamera, mainly for scroll values.
	 */
	override private function drawTilemap(Buffer:FlxTilemapBuffer, Camera:FlxCamera):Void
	{
		#if flash
		Buffer.fill();
		#else
		_helperPoint.x = x - Camera.scroll.x * scrollFactor.x; //copied from getScreenXY()
		_helperPoint.y = y - Camera.scroll.y * scrollFactor.y;
		
		var tileID:Int;
		var drawX:Float;
		var drawY:Float;
		
		var hackScaleX:Float = tileScaleHack * scaleX;
		var hackScaleY:Float = tileScaleHack * scaleY;
		
		#if !js
		var drawItem:DrawStackItem = Camera.getDrawStackItem(cachedGraphics, false, 0);
		#else
		var drawItem:DrawStackItem = Camera.getDrawStackItem(cachedGraphics, false);
		#end
		var currDrawData:Array<Float> = drawItem.drawData;
		var currIndex:Int = drawItem.position;
		#end
		
		// Copy tile images into the tile buffer
		_point.x = (Camera.scroll.x * scrollFactor.x) - x; //modified from getScreenXY()
		_point.y = (Camera.scroll.y * scrollFactor.y) - y;
		
		var screenXInTiles:Int = Math.floor(_point.x / _scaledTileWidth);
		var screenYInTiles:Int = Math.floor(_point.y / _scaledTileHeight);
		var screenRows:Int = Buffer.rows;
		var screenColumns:Int = Buffer.columns;
		
		// Bound the upper left corner
		if (screenXInTiles < 0)
		{
			screenXInTiles = 0;
		}
		if (screenXInTiles > widthInTiles - screenColumns)
		{
			screenXInTiles = widthInTiles - screenColumns;
		}
		if (screenYInTiles < 0)
		{
			screenYInTiles = 0;
		}
		if (screenYInTiles > heightInTiles - screenRows)
		{
			screenYInTiles = heightInTiles - screenRows;
		}
		
		var rowIndex:Int = screenYInTiles * widthInTiles + screenXInTiles;
		_flashPoint.y = 0;
		var row:Int = 0;
		var column:Int;
		var columnIndex:Int;
		var tile:FlxTile;
		
		#if !FLX_NO_DEBUG
		var debugTile:BitmapData;
		#end 
		
		while (row < screenRows)
		{
			columnIndex = rowIndex;
			column = 0;
			_flashPoint.x = 0;
			
			while (column < screenColumns)
			{
				#if flash
				_flashRect = _rects[columnIndex];
				
				if (_flashRect != null)
				{
					if (!objMap.exists(columnIndex))
					{
						objMap.set(columnIndex, new TweenAppear());
					}
					
					else
					{
						tile = _tileObjects[_data[columnIndex]];
						tileobj = objMap.get(columnIndex);
						flashp = _flashPoint.clone();
						
						if (!tileobj.showed)
						{
							var p:FlxPoint = new FlxPoint(_flashPoint.x + _point.x, _flashPoint.y + _point.y);
							var dist:Float = player.getMidpoint().distanceTo(p);
							if (dist <= 280)
							{
								tileobj.makeFall();
							}
						}
						
						if (tileobj.fall != 0)
							flashp.y += tileobj.fall;
						
						if (tileobj.alpha != 1)
						{
							alphaBitmap.fillRect(alpharect, FlxColorUtil.makeFromARGB(tileobj.alpha, 0, 0, 0));
							Buffer.pixels.copyPixels(cachedGraphics.bitmap, _flashRect,
								flashp, alphaBitmap, alphapoint, false);
						}
						
						else
						{
							Buffer.pixels.copyPixels(cachedGraphics.bitmap, _flashRect, flashp,
								null, null, false);
						}
					}
					
					#if !FLX_NO_DEBUG
					if (FlxG.debugger.drawDebug && !ignoreDrawDebug) 
					{
						tile = _tileObjects[_data[columnIndex]];
						
						if (tile != null)
						{
							if (tile.allowCollisions <= FlxObject.NONE)
							{
								// Blue
								debugTile = _debugTileNotSolid; 
							}
							else if (tile.allowCollisions != FlxObject.ANY)
							{
								// Pink
								debugTile = _debugTilePartial; 
							}
							else
							{
								// Green
								debugTile = _debugTileSolid; 
							}
							
							Buffer.pixels.copyPixels(debugTile, _debugRect, _flashPoint, null, null, true);
						}
					}
					#end
				}
				#else
				tileID = _rectIDs[columnIndex];
				
				if (tileID != -1)
				{
					drawX = _helperPoint.x + (columnIndex % widthInTiles) * _scaledTileWidth;
					drawY = _helperPoint.y + Math.floor(columnIndex / widthInTiles) * _scaledTileHeight;
					
					#if !js
					currDrawData[currIndex++] = drawX;
					currDrawData[currIndex++] = drawY;
					#else
					currDrawData[currIndex++] = Math.floor(drawX);
					currDrawData[currIndex++] = Math.floor(drawY);
					#end
					currDrawData[currIndex++] = tileID;
					
					// Tilemap tearing hack
					currDrawData[currIndex++] = hackScaleX; 
					currDrawData[currIndex++] = 0;
					currDrawData[currIndex++] = 0;
					// Tilemap tearing hack
					currDrawData[currIndex++] = hackScaleY; 
					
					#if !js
					// Alpha
					currDrawData[currIndex++] = 1.0; 
					#end
				}
				#end
				
				#if flash
				_flashPoint.x += _tileWidth;
				#end
				column++;
				columnIndex++;
			}
			
			#if flash
			_flashPoint.y += _tileHeight;
			#end
			rowIndex += widthInTiles;
			row++;
		}
		
		#if !flash
		drawItem.position = currIndex;
		#end
		
		Buffer.x = screenXInTiles * _scaledTileWidth;
		Buffer.y = screenYInTiles * _scaledTileHeight;
	}
}