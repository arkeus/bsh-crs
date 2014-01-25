package io.arkeus.bsh.game {
	import io.axel.state.AxState;
	import io.axel.text.AxText;

	public class GameState extends AxState {
		override public function create():void {
			add(new AxText(10, 10, null, "Hello World"));
		}
	}
}
