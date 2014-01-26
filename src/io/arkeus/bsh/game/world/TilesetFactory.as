package io.arkeus.bsh.game.world {
	import io.arkeus.bsh.asset.Resource;

	public class TilesetFactory {
		public function createTileset(level:uint):Class {
			switch (level) {
				case 0: return Resource.TILESET_SEA; break;
				case 1: return Resource.TILESET_SEA; break;
			}
			throw new ArgumentError("Invalid level: " + level);
		}
	}
}
