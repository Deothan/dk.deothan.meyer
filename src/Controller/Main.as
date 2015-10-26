package Controller
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import View.Loader;
	
	import starling.core.Starling;
	
	[SWF(width="1920", height="1080")]
	public class Main extends Sprite{
		public function Main(){
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			
			var starlingInstance:Starling = new Starling(Loader, stage);
			starlingInstance.start();
		}
	}
}