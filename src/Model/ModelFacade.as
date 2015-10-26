package Model
{
	import Entities.Cup;
	
	import View.ViewFacade;

	public class ModelFacade{
		private static var instance:ModelFacade;
		private var isLifted:Boolean = false;
		private var meyerCup:Cup;

		/**
		 * Singleton instance.
		 */
		public static function GetInstance():ModelFacade{
			if(instance == null){
				instance = new ModelFacade();
			}
			return instance;
		}
		
		public function GetMeyerCup():Cup{
			return meyerCup;
		}
		
		public function SetMeyerCup(c:Cup):void{
			meyerCup = c;
		}
		
		/**
		 * @return returns true if the cup is lifted exposing the dice.
		 */
		public function IsCupLifted():Boolean{
			return isLifted;
		}
		
		public function ChangeCupState(state:Boolean):void{
			isLifted = state;
			ViewFacade.getInstance().CupStateChanged(isLifted);
		}
		
		public function RollMeyerCup():void{
				meyerCup.Roll();
				ViewFacade.getInstance().UpdateCup(meyerCup);
		}
	}
}