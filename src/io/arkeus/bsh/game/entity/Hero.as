package io.arkeus.bsh.game.entity {
	import io.arkeus.bsh.asset.Resource;

	public class Hero extends Entity {
		public function Hero() {
			super(x, y, Resource.HERO_ARMIN, 24, 24);
			
			with (animations) {
				add("run", [0, 1, 0, 2], 4);
				play("run");
			}
		}
	}
}
