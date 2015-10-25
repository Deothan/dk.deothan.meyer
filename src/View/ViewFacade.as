package View
{
	import starling.display.Sprite;
	import starling.events.Event;

	public class ViewFacade extends Sprite{
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
	}
}