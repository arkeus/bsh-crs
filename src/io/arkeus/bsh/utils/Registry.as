package io.arkeus.bsh.utils {
	import io.arkeus.bsh.game.GameState;
	import io.arkeus.bsh.game.entity.Hero;

	public class Registry {
		public static var game:GameState;
		public static var hero:Hero;
		public static var time:Number = 0;
		
		public static var flag:Number = 0;
	}
}
