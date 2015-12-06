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
		private var loadManager:AssetManager;
		private var cup:Image;
		private var table:Image;
		private var die1:Image;
		private var die2:Image;
		private var rollButton:Button;
		private var hideButton:Button;

		public function Game(){
			loadManager = new AssetManager();
			var folder:File = File.applicationDirectory.resolvePath("Assets/load");
			loadManager.enqueue(folder);
			loadManager.loadQueue(loadProgress);
			
			assetManager = new AssetManager();
			var folder2:File = File.applicationDirectory.resolvePath("Assets/images");
			assetManager.enqueue(folder2);
			assetManager.loadQueue(Progress);
		}

		private function Progress(ratio:Number):void{
			if(ratio == 1){
				Start();
			}
		}
		
		private function loadProgress(ratio:Number):void{
			if(ratio == 1){
				load();
			}
		}
		
		private function load():void{
			table = new Image(loadManager.getTexture("table"));
			addChild(table);
		}

		private function Start():void{	
			cup = new Image(assetManager.getTexture("cup"));
			cup.x = stage.stageWidth/2-cup.width/2;
			cup.y = stage.stageHeight/2-cup.height/2;
			addChild(cup);
			
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
			
			rollButton = new Button(assetManager.getTexture("button"), "Roll");
			rollButton.fontSize = 70;
			rollButton.addEventListener(Event.TRIGGERED, RollButtonTriggered);
			rollButton.x = stage.stageWidth/2 - rollButton.width/2 - 200;
			rollButton.y = stage.stageHeight/2 + 600;
			rollButton.alpha = 0.5;
			addChild(rollButton);
			
			hideButton = new Button(assetManager.getTexture("button"), "Hide");
			hideButton.fontSize = 70; 
			hideButton.addEventListener(Event.TRIGGERED, HideButtonTriggered);
			hideButton.x = stage.stageWidth/2 - hideButton.width/2 + 200;
			hideButton.y = stage.stageHeight/2 + 600;
			addChild(hideButton);
		}

		public function UpdateDice(c:Cup):void{
			die1.texture = assetManager.getTexture((c.GetDice()[0] as Die).GetValue().toString())
			die2.texture = assetManager.getTexture((c.GetDice()[1] as Die).GetValue().toString());
		}
		
		/**
		 * Updates the game so it looks like there is a top cup.
		 * To save memmory I change the dice to be invisible instead of covering them.
		 * Then I change the text on the button so it says Hide if the dice are visible or Show if they are not.
		 */
		public function UpdateTopCup(isLifted:Boolean):void{
			if(isLifted){
				hideButton.text = "Show"; 
				die1.alpha = 0;
				die2.alpha = 0;
				rollButton.alpha = 1;
			}
			else{
				hideButton.text = "Hide";
				die1.alpha = 1;
				die2.alpha = 1;
				rollButton.alpha = 0.5;
			}
		}
		
		private function RollButtonTriggered():void{
			ControllerFacade.getInstance().Roll();
		}
		
		private function HideButtonTriggered():void{
			ControllerFacade.getInstance().ChangeCupState();
		}
	}
}