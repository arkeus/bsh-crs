package io.arkeus.bsh.init {
	import io.arkeus.bsh.game.transition.TransitionManager;
	import io.arkeus.bsh.title.TitleState;
	import io.arkeus.bsh.utils.SoundSystem;
	import io.axel.state.AxState;

	public class InitializationState extends AxState {
		override public function create():void {
			SoundSystem.initialize();
			TransitionManager.fade(new TitleState, 0.1, 1);
		}
	}
}
