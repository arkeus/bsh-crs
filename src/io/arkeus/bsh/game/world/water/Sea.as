package io.arkeus.bsh.game.world.water {
	import io.arkeus.bsh.asset.Resource;
	import io.axel.Ax;
	import io.axel.sprite.AxParallaxSprite;

	public class Sea {
		public static var level:uint;
		
		public var above:Water;
		public var below:Water;
		
		public function Sea() {
			var sprite:AxParallaxSprite = new AxParallaxSprite(0, Ax.viewHeight / 2 - 2, Resource.WATER);
			sprite.parallaxMode = AxParallaxSprite.HORIZONTAL;
			
			above = new Water(sprite, 0.4, true);
			below = new Water(sprite, 1);
			
			level = Math.floor(Ax.viewHeight / 2);
			trace("LEVEL", level);
		}
	}
}
