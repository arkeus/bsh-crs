package io.arkeus.bsh.game.world {
	import io.axel.tilemap.AxTilemap;

	public class World extends AxTilemap {
		public static const WIDTH:uint = 16;
		public static const HEIGHT:uint = 12;
		public static const TILE_SIZE:uint = 16;
		
		private var mapData:Array;
		private var graphic:Class;
		
		public function World(mapData:Array, graphic:Class) {
			this.mapData = mapData;
			this.graphic = graphic;
		}
		
		public function create():World {
			build(mapData, graphic, TILE_SIZE, TILE_SIZE, 1);
			
			return this;
		}
	}
}
