package io.arkeus.bsh.game.world {
	import io.arkeus.bsh.game.entity.Hero;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.axel.Ax;
	import io.axel.base.AxGroup;
	import io.axel.base.AxRect;
	import io.axel.particle.AxParticleSystem;
	import io.axel.tilemap.AxTile;
	import io.axel.tilemap.AxTilemap;

	public class World extends AxTilemap {
		public static const WIDTH:uint = 16;
		public static const HEIGHT:uint = 12;
		public static const TILE_SIZE:uint = 16;
		
		public var mapData:Array;
		public var graphic:Class;
		public var objects:AxGroup;
		
		public function World(mapData:Array, objects:AxGroup, graphic:Class) {
			this.mapData = mapData;
			this.graphic = graphic;
			this.objects = objects;
		}
		
		public function create():World {
			build(mapData, graphic, TILE_SIZE, TILE_SIZE, 1);
			assignCallbacks();
			
			timers.add(0.3, function():void {
				AxParticleSystem.emit("fish", Ax.camera.x + Ax.viewWidth, Sea.level);
			}, 0);
			
			return this;
		}
		
		private function assignCallbacks():void {
			var frame:AxRect = new AxRect;
			
			getTile(2).collision = NONE;
			getTile(2).callback = function(tile:AxTile, hero:Hero):void {
				frame.x = tile.x + 4;
				frame.y = tile.y + 4;
				frame.width = tile.width - 8;
				frame.height = tile.height - 8;
				if (frame.overlaps(hero)) {
					hero.kill();
				}
			}
		}
	}
}
