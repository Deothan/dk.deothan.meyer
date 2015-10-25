package Model
{
	public class ModelFacade{
		private static var instance:ModelFacade;
		
		public function ModelFacade(){
		}
		
		/**
		 * Singleton instance.
		 */
		public static function getInstance():ModelFacade{
			if(instance == null){
				instance = new ModelFacade();
			}
			return instance;
		}
	}
}