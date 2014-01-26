package io.arkeus.bsh.game {
	import io.arkeus.bsh.asset.Particle;
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.entity.Hero;
	import io.arkeus.bsh.game.helpers.Timer;
	import io.arkeus.bsh.game.transition.TransitionManager;
	import io.arkeus.bsh.game.world.World;
	import io.arkeus.bsh.game.world.WorldBuilder;
	import io.arkeus.bsh.game.world.background.Background;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.arkeus.bsh.utils.Registry;
	import io.axel.Ax;
	import io.axel.base.AxRect;
	import io.axel.collision.AxGroupCollider;
	import io.axel.input.AxKey;
	import io.axel.state.AxState;
	import io.axel.text.AxText;

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
			Registry.game = this;
			Ax.background.hex = 0xa8ecff;
			
			collider = new AxGroupCollider;
			world = new WorldBuilder(level).build();
			
			sea = new Sea(world.width, world.height);
			
			add(new Background(Sea.level - 93, Resource.BACKGROUND_MOUNTAINS, 0.3));
			add(sea.below);
			add(new Background(world.height - 140, Resource.BACKGROUND_CLIFFS, 0.6, 0.3));
			add(Particle.initialize());
			add(world);
			add(hero = new Hero(Registry.flag > 0 ? Registry.flag : 64, Math.floor(world.height / 2 / World.TILE_SIZE - 1) * World.TILE_SIZE));
			
			add(new Timer(5, Ax.viewHeight - 13));
			
			world.x = 192;
			//192x144
			Ax.camera.follow(hero, new AxRect(48, Ax.viewHeight / 2, 48, 16));
			Ax.camera.setBounds(0, 0, world.width + Ax.viewWidth * 3, world.height);
			//Ax.camera.follow(hero);
			
			Registry.hero = hero;
		}
		
		override public function update():void {
			super.update();
			
			if (Ax.keys.down(AxKey.D)) {
				Ax.zoom += Ax.dt / 5;
			}
			
			if (Ax.keys.pressed(AxKey.R)) {
				hero.kill();
			}
			
			hero.collideWithWater();
			Ax.collide(hero, world, heroCollide, collider);
		}
		
		private function heroCollide(hero:Hero, tile:World):void {
			if (hero.touching & RIGHT) {
				hero.kill();
			}
		}
		
		public function die():void {
			timers.add(0.5, function():void { TransitionManager.fade(new GameState) });
		}
	}
}
