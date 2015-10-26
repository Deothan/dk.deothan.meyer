package View
{
	import flash.filesystem.File;
	
	import Controller.ControllerFacade;
	
	import Entities.Cup;
	import Entities.Die;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class Game extends Sprite{
		private var assetManager:AssetManager;
		private var cupBottom:Image;
		private var cupTop:Image;
		private var table:Image;
		private var die1:Image;
		private var die2:Image;
		private var rollButton:Button;
		private var hideButton:Button;

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
			table = new Image(assetManager.getTexture("table"));
			addChild(table);
			
			cupBottom = new Image(assetManager.getTexture("cup"));
			cupBottom.x = stage.stageWidth/2-cupBottom.width/2;
			cupBottom.y = stage.stageHeight/2-cupBottom.height/2;
			addChild(cupBottom);
			
			die1 = new Image(assetManager.getTexture("1"));
			die1.x = stage.stageWidth/2 - die1.width + 90;
			die1.y = stage.stageHeight/2 - die1.height/2 + 20;
			die1.rotation = 45;
			addChild(die1);
			
			die2 = new Image(assetManager.getTexture("2"));
			die2.x = stage.stageWidth/2 + 100;
			die2.y = stage.stageHeight/2 - die2.height/2 + 150;
			die2.rotation = 10;
			addChild(die2);
			
			cupTop = new Image(assetManager.getTexture("cup"));
			cupTop.x = stage.stageWidth/2-cupBottom.width/2;
			cupTop.y = stage.stageHeight/2-cupBottom.height/2;
			cupTop.alpha = 0;
			addChild(cupTop);
			
			rollButton = new Button(assetManager.getTexture("button"), "Roll");
			rollButton.fontSize = 70;
			rollButton.addEventListener(Event.TRIGGERED, RollButtonTriggered);
			rollButton.x = stage.stageWidth/2 - rollButton.width/2 - 300;
			rollButton.y = stage.stageHeight/2 + 600;
			addChild(rollButton);
			
			hideButton = new Button(assetManager.getTexture("button"), "Hide");
			hideButton.fontSize = 70;
			hideButton.addEventListener(Event.TRIGGERED, HideButtonTriggered);
			hideButton.x = stage.stageWidth/2 - hideButton.width/2 + 300;
			hideButton.y = stage.stageHeight/2 + 600;
			addChild(hideButton);
			
		}
		
		public function UpdateDice(c:Cup):void{
			die1.texture = assetManager.getTexture((c.GetDice()[0] as Die).GetValue().toString())
			die2.texture = assetManager.getTexture((c.GetDice()[1] as Die).GetValue().toString());
		}
		
		public function UpdateTopCup(isLifted:Boolean):void{
			if(isLifted)
				cupTop.alpha = 1;
			else
				cupTop.alpha = 0;
		}
		
		private function RollButtonTriggered():void{
			ControllerFacade.getInstance().Roll();
		}
		
		private function HideButtonTriggered():void{
			ControllerFacade.getInstance().ChangeCupState();
		}
	}
}