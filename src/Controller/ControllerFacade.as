package Controller
{
	public class ControllerFacade{
		private static var instance:ControllerFacade;
		
		public function ControllerFacade(){
		}
		
		/**
		 * Singleton instance.
		 */
		public static function getInstance():ControllerFacade{
			if(instance == null){
				instance = new ControllerFacade();
			}
			return instance;
		}
	}
}