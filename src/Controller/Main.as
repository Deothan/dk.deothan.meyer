package Controller  
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.geom.Rectangle;
	
	
	import starling.core.Starling;
	
	public class Main extends Sprite{
		public function Main(){
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			
			var screenWidth:int = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight);
			
			var starlingInstance:Starling = new Starling(Loader, stage, viewPort);
			starlingInstance.stage.stageWidth = 1080;
			starlingInstance.stage.stageHeight = 1920;
			starlingInstance.start();
		}
	}
}