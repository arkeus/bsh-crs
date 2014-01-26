package io.arkeus.bsh.asset {
	public class Resource {
		// Heroes
		[Embed(source = "/entity/hero_armin.png")] public static const HERO_ARMIN:Class;
		
		// World
		[Embed(source = "/world/tileset.png")] public static const TILESET_SEA:Class;
		[Embed(source = "/world/water.png")] public static const WATER:Class;
		
		// Maps
		[Embed(source = "/maps/sea.png")] public static const MAP_SEA:Class;
		[Embed(source = "/maps/tutorial.png")] public static const MAP_TUTORIAL:Class;
		
		// Particles
		[Embed(source = "/particle/armin.png")] public static const PARTICLE_ARMIN:Class;
		[Embed(source = "/particle/water.png")] public static const PARTICLE_WATER:Class;
		[Embed(source = "/particle/fish.png")] public static const PARTICLE_FISH:Class;
		[Embed(source = "/particle/bubbles.png")] public static const PARTICLE_BUBBLES:Class;
		
		// Backgrounds
		[Embed(source = "/background/mountains.png")] public static const BACKGROUND_MOUNTAINS:Class;
		[Embed(source = "/background/cliffs.png")] public static const BACKGROUND_CLIFFS:Class;
		
		// Menu
		[Embed(source = "/menu/background.png")] public static const MENU_BACKGROUND:Class;
		[Embed(source = "/menu/title.png")] public static const MENU_TITLE:Class;
		[Embed(source = "/menu/tutorial_button.png")] public static const MENU_TUTORIAL_BUTTON:Class;
		[Embed(source = "/menu/play_button.png")] public static const MENU_PLAY_BUTTON:Class;
	}
}
