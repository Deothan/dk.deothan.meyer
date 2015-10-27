package Controller 
{
	import starling.display.Sprite;
	import View.ViewFacade;

	public class Loader extends Sprite
	{
		/**
		 * Used to load the singleton instance of the ViewFacade.
		 */
		public function Loader(){
			addChild(ViewFacade.getInstance());
		}
	}
}