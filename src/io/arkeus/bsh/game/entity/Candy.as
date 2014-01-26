package io.arkeus.bsh.game.entity {
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.utils.Registry;
	import io.arkeus.bsh.utils.SoundSystem;
	import io.axel.particle.AxParticleSystem;

	public class Candy extends Entity {
		public function Candy(x:uint, y:uint) {
			super(x, y, Resource.CANDY);
			velocity.a = 360;
		}
		
		override public function update():void {
			if (overlaps(Registry.hero)) {
				AxParticleSystem.emit("candy", center.x, center.y);
				SoundSystem.play("candy");
				Registry.game.getCandy();
				destroy();
			}
			super.update();
		}
	}
}
