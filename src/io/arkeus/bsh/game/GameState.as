package io.arkeus.bsh.game {
	import flash.sampler.NewObjectSample;
	
	import io.arkeus.bsh.game.entity.Hero;
	import io.arkeus.bsh.game.world.World;
	import io.arkeus.bsh.game.world.WorldBuilder;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.axel.Ax;
	import io.axel.base.AxRect;
	import io.axel.collision.AxGroupCollider;
	import io.axel.input.AxKey;
	import io.axel.state.AxState;

	public class GameState extends AxState {
		public var level:uint;
		
		public var sea:Sea;
		public var world:World;
		public var hero:Hero;
		
		private var collider:AxGroupCollider;
		
		public function GameState(level:uint = 1) {
			this.level = level;
		}
		
		override public function create():void {
			collider = new AxGroupCollider;
			
			sea = new Sea;
			
			add(sea.below);
			add(world = new WorldBuilder(level).build());
			add(hero = new Hero(Math.floor(Ax.viewWidth / 2 / World.TILE_SIZE) * World.TILE_SIZE, Math.floor(Ax.viewHeight / 2 / World.TILE_SIZE - 1) * World.TILE_SIZE));
			add(sea.above);
			
			world.x = Ax.viewWidth;
			//192x144
			Ax.camera.follow(hero, new AxRect(48, Ax.viewHeight / 2, 48, 16));
			//Ax.camera.follow(hero);
		}
		
		override public function update():void {
			super.update();
			
			if (Ax.keys.down(AxKey.D)) {
				Ax.zoom += Ax.dt / 5;
			}
			
			hero.collideWithWater();
			Ax.collide(hero, world, heroCollide, collider);
		}
		
		private function heroCollide(hero:Hero, tile:World):void {
			if (hero.touching & RIGHT) {
				die();
			}
		}
		
		public function die():void {
			Ax.states.change(new GameState);
		}
	}
}
