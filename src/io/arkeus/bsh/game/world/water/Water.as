package io.arkeus.bsh.game.world.water {
	import io.axel.base.AxEntity;
	import io.axel.sprite.AxParallaxSprite;
	
	public class Water extends AxEntity {
		private var sprite:AxParallaxSprite;
		private var alpha:Number;
		private var updates:Boolean;
		
		public function Water(sprite:AxParallaxSprite, alpha:Number, updates:Boolean = false) {
			this.sprite = sprite;
			this.alpha = alpha;
			this.updates = updates;
		}
		
		override public function update():void {
			if (!updates) {
				return;
			}
			sprite.update();
		}
		
		override public function draw():void {
			sprite.alpha = alpha;
			sprite.draw();
		}
	}
}
