package io.arkeus.bsh.utils {
	import io.axel.Ax;
	import io.axel.sound.AxSound;

	public class SoundSystem {
		public static const VOLUME:Number = 0.5;

		public static var music:AxSound;
		public static var musicClass:Class;

		private static var sounds:Object = {};
		private static var initialized:Boolean = false;

		public static function playMusic(klass:Class):void {
			if (klass == musicClass || Ax.musicMuted) {
				return;
			} else if (music != null) {
				music.destroy();
				music.dispose();
			}
			musicClass = klass;
			music = Ax.playMusic(klass, VOLUME);
			music.volume = Ax.musicMuted ? 0 : VOLUME;
		}

		public static function play(soundName:String):void {
			if (sounds[soundName] == null || Ax.soundMuted) {
				return;
			}
			(sounds[soundName] as SfxrSynth).play();
		}

		public static function create(soundName:String, parameters:String):void {
			if (Ax.soundMuted) {
				return;
			}
			var sound:SfxrSynth = new SfxrSynth;
			sound.params.setSettingsString(parameters);
			sound.cacheSound();
			sounds[soundName] = sound;
		}

		public static function mute():void {
			Ax.musicMuted = true;
			Ax.soundMuted = true;
		}

		public static function unmute():void {
			Ax.musicMuted = false;
			Ax.soundMuted = false;
		}

		public static function toggleMute():Boolean {
			if (Ax.musicMuted) {
				unmute();
				return false;
			} else {
				mute();
				return true;
			}
		}

		public static function initialize():void {
			if (initialized) {
				return;
			}
			
			create("select", "3,,0.0123,,0.1683,0.3204,,-0.4979,,,,,,,,,,,1,,,,,0.5");
			create("start", "0,,0.0441,0.4278,0.3278,0.7172,,,,,,0.4244,0.6376,,,,,,1,,,,,0.5");
			create("splash", "3,,0.16,0.2401,0.44,0.84,,-0.28,-0.36,,,0.54,,,,0.71,0.1999,-0.2435,1,,,,,0.3");
			create("jump", "0,,0.2279,,0.2109,0.12,,0.26,,,,,,0.5883,,,,,1,,,0.2698,,0.55");
			create("candy", "0,,0.0529,0.4205,0.3962,0.71,,,,,,0.5171,0.5685,,,,,,1,,,,,0.6");
			create("flash", "3,,0.18,0.2653,0.33,0.81,,-0.2185,,,,,,,,0.4535,,,1,,,,,0.5");
			create("dive", "0,,0.26,,0.16,0.31,,-0.18,-0.3,,,,,0.2657,,,,,1,,,,,0.4");
			create("die", "3,,0.1453,0.56,0.55,0.13,,,,,,,,,,,-0.1124,-0.277,1,,,,,0.4");
		}
	}
}
