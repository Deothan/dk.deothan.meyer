package View
{
	import Entities.Cup;
	import Entities.Die;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class ViewFacade extends Sprite{
		private static var instance:ViewFacade = new ViewFacade();
		private var screen:Sprite;
		
		public function ViewFacade(){
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		/**
		 * Initializes the View, and sets the startup screen.
		 */
		private function initialize(event:Event):void{
			loadScreen(Game);
		}
		
		/**
		 * Singleton instance.
		 */
		public static function getInstance():ViewFacade{
			return instance;
		}
		
		public function UpdateCup(c:Cup):void{	
			(screen as Game).UpdateDice(c);	
		}
		
		public function CupStateChanged(isLifted:Boolean):void{
			(screen as Game).UpdateTopCup(isLifted);
		}
		
		
		/**
		 * @param newScreen:Class - Changes the current screen.
		 */
		public function loadScreen( newScreen:Class ):void{
			if(screen != null && contains(screen)){
				removeChild(screen, true);
			}
			
			screen = new newScreen();
			addChild(screen);
		}
	}
}