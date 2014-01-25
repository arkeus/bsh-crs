package io.arkeus.bsh.asset {
	public class Resource {
		// Heroes
		[Embed(source = "/entity/hero_armin.png")] public static const HERO_ARMIN:Class;
		
		// World
		[Embed(source = "/world/tileset.png")] public static const TILESET_SEA:Class;
		[Embed(source = "/world/water.png")] public static const WATER:Class;
		
		// Maps
		[Embed(source = "/maps/sea.png")] public static const MAP_SEA:Class;
	}
}
