package Controller
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import View.ViewFacade;
	
	import starling.core.Starling;
	
	[SWF(width="1024", height="768", backgroundColor="#00CC00")]
	public class Main extends Sprite{
		public function Main(){
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var starlingInstance:Starling = new Starling(ViewFacade, stage);
			starlingInstance.start();
		}
	}
}