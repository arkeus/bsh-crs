package io.arkeus.bsh.init {
	import io.arkeus.bsh.game.transition.TransitionManager;
	import io.arkeus.bsh.title.TitleState;
	import io.axel.state.AxState;

	public class InitializationState extends AxState {
		override public function create():void {
			TransitionManager.fade(new TitleState, 0.1, 1);
		}
	}
}
