package {
	import io.arkeus.bsh.init.InitializationState;
	import io.axel.Ax;
	
	// 400x288 = 25 x 18
	// 256x192 = 16x12
	
	public class BubbleSurfHeroesMain extends Ax {
		public function BubbleSurfHeroesMain() {
			super(InitializationState, 768, 576, 3);
		}
		
		override public function create():void {
			Ax.background.hex = 0x000000;
			//Ax.debugger.active = true;
			Ax.debuggerEnabled = true;
		}
	}
}
