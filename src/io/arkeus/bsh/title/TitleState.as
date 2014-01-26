package io.arkeus.bsh.title {
	import io.arkeus.bsh.asset.Resource;
	import io.arkeus.bsh.game.GameState;
	import io.arkeus.bsh.game.transition.TransitionManager;
	import io.axel.Ax;
	import io.axel.base.AxButton;
	import io.axel.render.AxBlendMode;
	import io.axel.sprite.AxSprite;
	import io.axel.state.AxState;

	public class TitleState extends AxState {
		private var title:AxSprite;
		private var tutorial:AxButton;
		private var play:AxButton;
		
		override public function create():void {
			add(new AxSprite(0, 0, Resource.MENU_BACKGROUND));
			
			timers.add(1.5, function():void {
				Ax.camera.flash(0.25);
				add(title = new AxSprite(0, 0, Resource.MENU_TITLE));
				title.blend = AxBlendMode.TRANSPARENT_TEXTURE;
				title.origin.x = title.width / 2;
				title.origin.y = 19;
				
				var titleGrow:Function;
				var titleShrink:Function = function():void { title.effects.grow(2, 0.95, 0.95, titleGrow); };
				titleGrow = function():void { title.effects.grow(2, 1.05, 1.05, titleShrink); };
				titleGrow();
				
				add(tutorial = new AxButton(29, 156, Resource.MENU_TUTORIAL_BUTTON, 77, 17));
				tutorial.onClick(function():void {
					TransitionManager.fade(new GameState(0), 1, 1);
				});
				add(play = new AxButton(153, 156, Resource.MENU_PLAY_BUTTON, 77, 17));
				play.onClick(function():void {
					TransitionManager.fade(new GameState(1), 1, 1);
				});
			});
		}
	}
}
