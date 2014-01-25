package io.arkeus.bsh.game.world {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import io.arkeus.bsh.asset.Resource;

	public class TilemapDataGenerator {
		public function generate(level:uint):Array {
			var pixels:BitmapData = (new TILEMAP_DATA_MAP[level] as Bitmap).bitmapData;
			
			var data:Array = []
			for (var y:uint = 0; y < pixels.height; y++) {
				var row:Array = []
				for (var x:uint = 0; x < pixels.width; x++) {
					var pixel:uint = pixels.getPixel(x, y);
					row.push(pixelToTile(pixel));
				}
				data.push(row);
			}
			
			return data;
		}
		
		private function pixelToTile(pixel:uint):uint {
			switch (pixel) {
				case 0x755214: return 1;
			}
			return 0;
		}
		
		private static const TILEMAP_DATA_MAP:Object = {
			1: Resource.MAP_SEA
		};
	}
}
