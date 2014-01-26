package io.arkeus.bsh.game.world {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.entity.Candy;
	import io.arkeus.bsh.game.entity.Entity;
	import io.axel.base.AxGroup;

	public class TilemapDataGenerator {
		public function generate(level:uint):Array {
			var pixels:BitmapData = (new TILEMAP_DATA_MAP[level] as Bitmap).bitmapData;
			var objects:AxGroup = new AxGroup;
			
			var data:Array = []
			for (var y:uint = 0; y < pixels.height; y++) {
				var row:Array = []
				for (var x:uint = 0; x < pixels.width; x++) {
					var pixel:uint = pixels.getPixel(x, y);
					row.push(pixelToTile(pixel));
					
					var object:Entity = pixelToObject(pixel, x, y);
					if (object != null) {
						objects.add(object);
					}
				}
				data.push(row);
			}
			
			return [data, objects];
		}
		
		private function pixelToTile(pixel:uint):uint {
			switch (pixel) {
				case 0x755214: return 1; break;
				case 0x1d1d1d: return 2; break;
			}
			return 0;
		}
		
		private function pixelToObject(pixel:uint, x:uint, y:uint):Entity {
			switch (pixel) {
				case 0xd076ff: return new Candy(x * World.TILE_SIZE + 192, y * World.TILE_SIZE); break;
			}
			return null;
		}
		
		private static const TILEMAP_DATA_MAP:Object = {
			0: Resource.MAP_TUTORIAL,
			1: Resource.MAP_SEA
		};
	}
}
