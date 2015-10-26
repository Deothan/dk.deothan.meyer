package View
{
	import flash.filesystem.File;
	
	import Controller.ControllerFacade;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class Game extends Sprite{
		private var assetManager:AssetManager;
		private var image:Image;
		private var image2:Image;
		private var rollButton:Button;

		public function Game(){
			assetManager = new AssetManager();
			var folder:File = File.applicationDirectory.resolvePath("Assets");
			assetManager.enqueue(folder);
			assetManager.loadQueue(Progress);
		}

		private function Progress(ratio:Number):void{
			if(ratio == 1){
				Start();
			}
		}

		private function Start():void
		{
			rollButton = new Button(assetManager.getTexture("1"));
			rollButton.addEventListener(Event.TRIGGERED, rollButtonTriggered);
			addChild(rollButton);
			
		}
		
		public function setNewImage(nr:int):void{
			trace(nr);
			removeChild(rollButton);
			rollButton = new Button(assetManager.getTexture(nr.toString()));
			rollButton.addEventListener(Event.TRIGGERED, rollButtonTriggered);
			addChild(rollButton);
		}
		
		private function rollButtonTriggered():void{
			ControllerFacade.getInstance().Roll();
		}
	}
}