package io.arkeus.bsh.game.entity {
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.arkeus.bsh.utils.Registry;
	import io.axel.Ax;
	import io.axel.AxU;
	import io.axel.input.AxKey;
	import io.axel.particle.AxParticleSystem;

	public class Hero extends Entity {
		public static const SWIM_SPEED:uint = 96;
		public static const JUMP_SPEED:uint = 280;
		public static const GRAVITY:uint = 800;
		public static const ANGLE_ADJUST_SPEED:uint = 360;
		
		public var above:Boolean = true;
		public var dead:Boolean = false;
		
		private var targetAngle:Number = 0;
		
		public function Hero(x:uint, y:uint) {
			super(x, y, Resource.HERO_ARMIN, 24, 24);
			
			with (animations) {
				add("run", [0]);
				add("swim", [0, 1, 0, 2], 4);
				play("swim");
			}
			
			width = height = 16;
			offset.x = offset.y = 4;
			
			velocity.x = SWIM_SPEED;
			acceleration.y = GRAVITY;
			
			var self:Hero = this;
			timers.add(0.2, function():void {
				if (!above) {
					AxParticleSystem.emit("bubble", center.x, center.y);
				}
			}, 0);
			
			timers.add(0.1, function():void {
				if (above && touching & DOWN && self.y + height > Sea.level - 8) {
					AxParticleSystem.emit("surf", center.x, self.y + height);
				}
			}, 0);
			
			centerOrigin();
		}
		
		override public function update():void {
			if (!dead) {
				input();
				animation();
				physics();
			}
			super.update();
		}
		
		public function kill():void {
			if (dead) {
				return;
			}
			velocity.zero();
			acceleration.zero();
			dead = true;
			Registry.game.die();
			effects.grow(0.25, 4, 4).fadeOut(0.25);
			AxParticleSystem.emit("armin-die", center.x, center.y);
		}
		
		private function input():void {
			if (above && Ax.keys.down(AxKey.W) && touching & DOWN) {
				velocity.y = -JUMP_SPEED;
			} else if (!above && Ax.keys.down(AxKey.S) && touching & UP) {
				velocity.y = JUMP_SPEED;
			}
			
			if (Ax.keys.pressed(AxKey.SPACE)) {
				//Registry.flag = x;
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
			if (!above || touching & DOWN) {
				animations.play("swim");
			} else {
				animations.play("run");
			}
			
			targetAngle = Math.atan2(velocity.y, velocity.x) * 180 / Math.PI;
			targetAngle = AxU.clamp(targetAngle, -45, 45);
			
			if (angle > targetAngle) {
				angle -= ANGLE_ADJUST_SPEED * Ax.dt;
				if (angle < targetAngle) {
					angle = targetAngle;
				}
			} else if (angle < targetAngle) {
				angle += ANGLE_ADJUST_SPEED * Ax.dt;
				if (angle > targetAngle) {
					angle = targetAngle;
				}
			}
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
				if (velocity.y > 90) {
					AxParticleSystem.emit("splash", center.x, y + height);
				}
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
