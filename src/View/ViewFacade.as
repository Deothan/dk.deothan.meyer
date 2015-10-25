package View
{
	import starling.display.Sprite;
	import starling.events.Event;

	public class ViewFacade extends Sprite{
		private var screenManager:Game;
		
		public function ViewFacade(){
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		private function initialize(event:Event):void{
			screenManager = new Game();
			addChild(screenManager);
		}
	}
}