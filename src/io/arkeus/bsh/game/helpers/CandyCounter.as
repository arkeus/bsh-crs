package io.arkeus.bsh.game.helpers {
	import io.arkeus.bsh.asset.Resource;
	import io.axel.Ax;
	import io.axel.base.AxGroup;
	import io.axel.sprite.AxSprite;
	import io.axel.text.AxText;

	public class CandyCounter extends AxGroup {
		private var icon:AxSprite;
		private var text:AxText;
		private var total:uint;
		
		public function CandyCounter(total:uint) {
			this.total = total;
			noScroll();
			add(icon = new AxSprite(Ax.viewWidth - 18, Ax.viewHeight - 11, Resource.HUD_CANDY));
			add(text = new AxText(icon.x - 82, icon.y + 1, null, "0/" + total, 80, "right"));
		}
		
		public function updateDisplay(candies:uint):void {
			text.text = candies + "/" + total;
		}
	}
}
