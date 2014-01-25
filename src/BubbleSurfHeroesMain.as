package {
	import io.arkeus.bsh.game.GameState;
	import io.axel.Ax;

	[SWF(width = "768", height = "576", backgroundColor = "#000000")]
	// 400x288 = 25 x 18
	// 192x128 = 16x12
	
	public class BubbleSurfHeroesMain extends Ax {
		public function BubbleSurfHeroesMain() {
			super(GameState, 768, 576, 3);
		}
		
		override public function create():void {
			Ax.background.hex = 0xa8ecff;
			Ax.debugger.active = true;
			Ax.debuggerEnabled = true;
		}
	}
}
