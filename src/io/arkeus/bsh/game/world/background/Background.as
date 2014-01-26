package io.arkeus.bsh.game.world.background {
	import io.axel.sprite.AxParallaxSprite;

	public class Background extends AxParallaxSprite {
		public function Background(y:uint, graphic:Class, scrollX:Number, alpha:Number = 1) {
			super(0, y, graphic);
			
			parallaxMode = HORIZONTAL;
			scroll.x = scrollX;
			this.alpha = alpha;
		}
	}
}
