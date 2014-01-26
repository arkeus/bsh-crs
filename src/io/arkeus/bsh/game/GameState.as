package io.arkeus.bsh.game {
	import io.arkeus.bsh.asset.Particle;
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.entity.Hero;
	import io.arkeus.bsh.game.helpers.CandyCounter;
	import io.arkeus.bsh.game.helpers.TextPopulator;
	import io.arkeus.bsh.game.helpers.Timer;
	import io.arkeus.bsh.game.transition.TransitionManager;
	import io.arkeus.bsh.game.world.World;
	import io.arkeus.bsh.game.world.WorldBuilder;
	import io.arkeus.bsh.game.world.background.Background;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.arkeus.bsh.title.TitleState;
	import io.arkeus.bsh.utils.Registry;
	import io.arkeus.bsh.utils.SoundSystem;
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
		public var candies:uint = 0;
		public var hud:CandyCounter;

		private var collider:AxGroupCollider;

		public function GameState(level:uint = 1, restart:Boolean = false) {
			this.level = level;
			if (restart) {
				Registry.time = 0;
			}
		}

		override public function create():void {
			SoundSystem.playMusic(MusicGame);
			
			Registry.game = this;
			Ax.background.hex = 0xa8ecff;

			collider = new AxGroupCollider;
			world = new WorldBuilder(level).build();

			sea = new Sea(world.width, world.height);

			add(new Background(Sea.level - 94, Resource.BACKGROUND_MOUNTAINS, 0.3));
			add(sea.below);
			add(new Background(world.height - 141, Resource.BACKGROUND_CLIFFS, 0.6, 0.3));
			add(Particle.initialize());
			add(world);
			add(world.objects);
			add(hero = new Hero(Registry.flag > 0 ? Registry.flag : 64, Sea.level - 16));

			add(new Timer(3, Ax.viewHeight - 10));
			add(hud = new CandyCounter(world.objects.members.length));

			world.x = 192;
			//192x144
			Ax.camera.follow(hero, new AxRect(48, Ax.viewHeight / 2, 48, 16));
			Ax.camera.setBounds(0, 0, world.width + Ax.viewWidth * 2, world.height);
			//Ax.camera.follow(hero);

			new TextPopulator(level).populate(this);

			Registry.hero = hero;
		}

		override public function update():void {
			super.update();

			if (Ax.keys.pressed(AxKey.R)) {
				hero.kill();
			}

			if (Ax.keys.pressed(AxKey.ESCAPE)) {
				TransitionManager.fade(new TitleState, 1, 1);
			}

			if (hero.x > world.width + Ax.viewWidth * 2) {
				TransitionManager.fade(new TitleState, 1, 1);
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
			timers.add(0.5, function():void {
				TransitionManager.fade(new GameState(level))
			});
		}

		public function getCandy():void {
			candies++;
			hud.updateDisplay(candies);
		}
	}
}
