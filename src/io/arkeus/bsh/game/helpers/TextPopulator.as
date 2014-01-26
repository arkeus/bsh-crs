package io.arkeus.bsh.game.helpers {
	import io.arkeus.bsh.game.GameState;
	import io.arkeus.bsh.game.world.World;
	import io.arkeus.bsh.game.world.water.Sea;
	import io.axel.text.AxText;

	public class TextPopulator {
		private static const SCROLL_FACTOR:Number = 0.5;
		
		private var level:uint;
		
		public function TextPopulator(level:uint) {
			this.level = level;
		}
		
		public function populate(state:GameState):void {
			switch (level) {
				case 0: populateTutorialTexts(state); break;
				case 1: populateLevel1Texts(state); break;
			}
		}
		
		private function populateTutorialTexts(state:GameState):void {
			createTopText(state, 12, 0, "Press @[ffba62][W]@[], @[ffba62][Z]@[], or @[ffba62][UP]@[] to jump.");
			createTopText(state, 24, 1, "Press @[ffba62][S]@[] or @[ffba62][DOWN]@[] to dive.");
			createBottomText(state, 30, 0, "Press @[ffba62][R]@[] to quickly restart.");
			createTopText(state, 40, 0, "Hold jump to continue jumping.");
			createTopText(state, 46, -3, "Hold dive when you hit the water to keep your momentum.");
			createTopText(state, 72, 0, "Collect the @[d5abff]candy@[]!");
			createTopText(state, 80, -1, "There are @[ff3333]no checkpoints@[], only fun.");
		}
		
		private function populateLevel1Texts(state:GameState):void {
			
		}
		
		private function createTopText(state:GameState, x:uint, yOffset:int, string:String):void {
			createText(state, x, Sea.level - 64 + yOffset * 16, string);
		}
		
		private function createBottomText(state:GameState, x:uint, yOffset:int, string:String):void {
			createText(state, x, Sea.level + 48 + yOffset * 16, string);
		}
		
		private function createText(state:GameState, x:uint, y:int, string:String):void {
			var text:AxText = new AxText((x * World.TILE_SIZE), y, null, string);
			text.scroll.x = SCROLL_FACTOR;
			state.add(text);
		}
	}
}
