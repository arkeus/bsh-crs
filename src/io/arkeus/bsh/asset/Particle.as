package io.arkeus.bsh.asset {
	import io.axel.particle.AxParticleEffect;
	import io.axel.particle.AxParticleSystem;
	import io.axel.render.AxBlendMode;
	
	public class Particle {		
		private static var group:ParticleGroup;
		
		public static function initialize():ParticleGroup {
			if (group != null) {
				return group;
			}
			
			var effect:AxParticleEffect;
			group = new ParticleGroup;
			
			effect = new AxParticleEffect("armin-die", Resource.PARTICLE_ARMIN, 2);
			effect.frameSize.x = effect.frameSize.y = 4;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 150;
			effect.x.min = -2; effect.x.max = 2;
			effect.y.min = -2; effect.y.max = 2;
			effect.xVelocity.min = -250; effect.xVelocity.max = 250;
			effect.yVelocity.min = -250; effect.yVelocity.max = 250;
			effect.lifetime.min = 0.5; effect.lifetime.max = 0.75;
			group.add(AxParticleSystem.register(effect));
			
			effect = new AxParticleEffect("candy", Resource.PARTICLE_CANDY, 2);
			effect.frameSize.x = effect.frameSize.y = 1;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 400;
			effect.x.min = -2; effect.x.max = 2;
			effect.y.min = -2; effect.y.max = 2;
			effect.xVelocity.min = -150; effect.xVelocity.max = 150;
			effect.yVelocity.min = -150; effect.yVelocity.max = 150;
			effect.lifetime.min = 0.5; effect.lifetime.max = 1;
			group.add(AxParticleSystem.register(effect));
			
			effect = new AxParticleEffect("splash", Resource.PARTICLE_WATER, 5);
			effect.frameSize.x = effect.frameSize.y = 1;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 100;
			effect.x.min = -8; effect.x.max = 8;
			effect.y.min = 0; effect.y.max = 0;
			effect.xVelocity.min = -90; effect.xVelocity.max = 150;
			effect.yVelocity.min = -250; effect.yVelocity.max = -100;
			effect.yAcceleration.min = effect.yAcceleration.max = 600;
			effect.lifetime.min = 1; effect.lifetime.max = 1;
			group.add(AxParticleSystem.register(effect));
			
			effect = new AxParticleEffect("surf", Resource.PARTICLE_WATER, 20);
			effect.frameSize.x = effect.frameSize.y = 1;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 20;
			effect.x.min = 0; effect.x.max = 0;
			effect.y.min = 0; effect.y.max = 0;
			effect.xVelocity.min = -90; effect.xVelocity.max = -10;
			effect.yVelocity.min = -250; effect.yVelocity.max = -100;
			effect.yAcceleration.min = effect.yAcceleration.max = 600;
			effect.lifetime.min = 1; effect.lifetime.max = 1;
			group.add(AxParticleSystem.register(effect));
			
			effect = new AxParticleEffect("fish", Resource.PARTICLE_FISH, 50);
			effect.frameSize.x = 12;
			effect.frameSize.y = 8;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 1;
			effect.x.min = 0; effect.x.max = 10;
			effect.y.min = 0; effect.y.max = 180;
			effect.xVelocity.min = -40; effect.xVelocity.max = 0;
			effect.yVelocity.min = 0; effect.yVelocity.max = 0;
			effect.lifetime.min = 4; effect.lifetime.max = 4;
			group.add(AxParticleSystem.register(effect));
			
			effect = new AxParticleEffect("bubble", Resource.PARTICLE_BUBBLES, 50);
			effect.frameSize.x = effect.frameSize.y = 4;
			effect.blend = AxBlendMode.BLEND;
			effect.amount = 1;
			effect.x.min = -2; effect.x.max = 2;
			effect.y.min = -2; effect.y.max = 2;
			effect.xVelocity.min = 0; effect.xVelocity.max = 0;
			effect.yVelocity.min = -15; effect.yVelocity.max = -5;
			effect.lifetime.min = 0.5; effect.lifetime.max = 0.75;
			group.add(AxParticleSystem.register(effect));
			
			return group;
		}
	}
}

