package io.arkeus.bsh.game.transition {
	import io.axel.Ax;
	import io.axel.state.AxState;

	public class TransitionManager {
		public static function fade(state:AxState, fadeOutTime:Number = 0.25, fadeInTime:Number = 0.25):void {
			Ax.camera.fadeOut(fadeOutTime, 0xff000000, function():void {
				Ax.states.change(state);
				Ax.camera.fadeIn(fadeInTime);
			});
		}
	}
}
