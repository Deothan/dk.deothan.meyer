package View
{
	import starling.display.Sprite;
	import starling.events.Event;
	import Entities.Cup;

	public class ViewFacade extends Sprite{
		private static var instance:ViewFacade;
		private var screenManager:ScreenManager;
		
		public function ViewFacade(){
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		/**
		 * Initializes the View, and sets the startup screen.
		 */
		private function initialize(event:Event):void{
			screenManager = new ScreenManager();
			addChild(screenManager);
			
			screenManager.loadScreen(Game);
		}
		
		/**
		 * Singleton instance.
		 */
		public static function getInstance():ViewFacade{
			if(instance == null){
				instance = new ViewFacade();
			}
			return instance;
		}
		
		public function UpdateCup(c:Cup):void{		
			
		}
	}
}