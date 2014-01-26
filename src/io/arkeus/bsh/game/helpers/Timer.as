package io.arkeus.bsh.game.helpers {
	import io.arkeus.bsh.utils.Registry;
	import io.axel.Ax;
	import io.axel.text.AxText;

	public class Timer extends AxText {
		public function Timer(x:uint, y:uint) {
			super(x, y, null, "00:00");
			timers.add(0.9, updateDisplay, 0);
			updateDisplay();
			noScroll();
		}
		
		override public function update():void {
			Registry.time += Ax.dt;
			super.update();
		}
		
		private function updateDisplay():void {
			var time:Number = Registry.time;
			var hours:uint = Math.floor(time / 3600);
			time -= hours * 3600;
			var minutes:uint = Math.floor(time / 60);
			time -= minutes * 60;
			var seconds:uint = Math.floor(time) % 60;
			text = (hours > 0 ? hours + ":" : "") + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
		}
	}
}
