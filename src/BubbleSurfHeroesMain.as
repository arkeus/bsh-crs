package {
	import io.arkeus.bsh.game.GameState;
	import io.axel.Ax;

	[SWF(width = "800", height = "576", backgroundColor = "#000000")]
	// 400x288 = 25 x 18
	
	public class BubbleSurfHeroesMain extends Ax {
		public function BubbleSurfHeroesMain() {
			super(GameState, 800, 600, 2);
		}
	}
}
