package {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getDefinitionByName;
	
	[SWF(width = "768", height = "576", backgroundColor = "#000000")]

	public class BubbleSurfHeroes extends MovieClip {
		[Embed(source="/entity/hero_armin.png")] protected var LOADING:Class;
		
		private var siteLocked:Boolean = true;
		private var allowedURLs:Array = [
			"Users/Lee",
			"axel.io",
			"arkeus.itch.io",
			"itchio",
		];
		
		public function BubbleSurfHeroes() {
			stop();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var allowed:Boolean = false;
			for each(var url:String in allowedURLs) {
				if (root.loaderInfo.url.indexOf(url) >= 0) {
					allowed = true;
				}
			}
			
			if (!allowed && siteLocked) {
				navigateToURL(new URLRequest("http://arkeus.io"), "_self");
				throw new Error("Invalid");
			}
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private var loading:Bitmap, percent:TextField;
		private function create():void {
			loading = new LOADING;
			loading.x = root.loaderInfo.width / 2 - loading.width / 2;
			loading.y = root.loaderInfo.height / 2 - 11;
			addChild(loading);
			
			var tf:TextFormat = new TextFormat;
			tf.size = 16;
			tf.align = TextFormatAlign.CENTER;
			tf.color = 0xffffff;
			
			percent = new TextField;
			percent.x = root.loaderInfo.width / 2 - 20;
			percent.y = root.loaderInfo.height / 2 + 10;
			percent.width = 46;
			percent.defaultTextFormat = tf;
			addChild(percent);
		}
		
		private var created:Boolean = false;
		private function onEnterFrame(event:Event):void {
			if (!created) {
				create();
				created = true;
			} else {
				percent.text = Math.floor((loaderInfo.bytesLoaded / loaderInfo.bytesTotal) * 100) + "%";
				if (framesLoaded >= totalFrames) {
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					removeChild(loading);
					removeChild(percent);
					nextFrame();
					addChild(new (getDefinitionByName("BubbleSurfHeroesMain") as Class));
				}
			}
		}
	}
}
