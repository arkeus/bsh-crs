package io.arkeus.bsh.game.transition {
	import io.axel.Ax;
	import io.axel.state.AxState;

	public class TransitionManager {
		private static var fading:Boolean = false;
		
		public static function fade(state:AxState, fadeOutTime:Number = 0.25, fadeInTime:Number = 0.25):void {
			if (fading) {
				return;
			}
			fading = true;
			Ax.camera.fadeOut(fadeOutTime, 0xff000000, function():void {
				Ax.camera.reset();
				Ax.states.change(state);
				Ax.camera.fadeIn(fadeInTime, function():void {
					fading = false;
				});
			});
		}
	}
}
