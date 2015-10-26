package Controller
{
	import Model.ModelFacade;

	public class ControllerFacade{
		private static var instance:ControllerFacade;
		private var factory:Factory = new Factory();
		
		public function ControllerFacade(){
			StartNewGame();
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
		
		public function StartNewGame():void{
			ModelFacade.GetInstance().SetMeyerCup(factory.CreateMeyerCup());
		}
		
		public function Roll():void{
			if(ModelFacade.GetInstance().IsCupLifted())
				ModelFacade.GetInstance().RollMeyerCup();
		}
		
		public function ChangeCupState():void{
			if(ModelFacade.GetInstance().IsCupLifted())
				ModelFacade.GetInstance().ChangeCupState(false);
			else
				ModelFacade.GetInstance().ChangeCupState(true);
		}
	}
}