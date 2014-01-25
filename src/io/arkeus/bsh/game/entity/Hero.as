package io.arkeus.bsh.game.entity {
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.axel.Ax;
	import io.axel.input.AxKey;

	public class Hero extends Entity {
		public static const SWIM_SPEED:uint = 100;
		public static const JUMP_SPEED:uint = 280;
		public static const GRAVITY:uint = 800;
		
		public var above:Boolean = true;
		
		public function Hero(x:uint, y:uint) {
			super(x + 100, y, Resource.HERO_ARMIN, 24, 24);
			
			with (animations) {
				add("run", [0, 1, 0, 2], 4);
				play("run");
			}
			
			width = height = 16;
			offset.x = offset.y = 4;
			
			velocity.x = SWIM_SPEED;
			acceleration.y = GRAVITY;
		}
		
		override public function update():void {
			trace(Math.floor(x / 16), Math.floor(y / 16), x, y);
			input();
			animation();
			physics();
			super.update();
		}
		
		private function input():void {
			if (above && Ax.keys.down(AxKey.W) && touching & DOWN) {
				velocity.y = -JUMP_SPEED;
			} else if (!above && Ax.keys.down(AxKey.S) && touching & UP) {
				velocity.y = JUMP_SPEED;
			}
			
			/*if (above && Ax.keys.down(AxKey.S) && touching & DOWN) {
				velocity.y = JUMP_SPEED;
				above = false
			} else if (!above && Ax.keys.down(AxKey.W) && touching & UP) {
				velocity.y = -JUMP_SPEED;
				above = true;
			}*/
		}
		
		private function animation():void {
			
		}
		
		private function physics():void {
			if (above) {
				acceleration.y = GRAVITY;
			} else {
				acceleration.y = -GRAVITY;
			}
		}
		
		public function collideWithWater():void {
			if (above && y + height > Sea.level && velocity.y > 0) {
				if (Ax.keys.down(AxKey.S)) {
					above = false;
					velocity.y = Math.max(velocity.y, JUMP_SPEED);
				} else {
					y = Sea.level - height;
					touching |= DOWN;
					velocity.y = 0;
				}
			} else if (!above && y < Sea.level && velocity.y < 0) {
				if (Ax.keys.down(AxKey.W)) {
					above = true;
					velocity.y = Math.min(velocity.y, -JUMP_SPEED);
				} else {
					y = Sea.level;
					touching |= UP;
					velocity.y = 0;
				}
			}
		}
	}
}
