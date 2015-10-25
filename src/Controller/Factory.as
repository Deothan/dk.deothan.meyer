package Controller
{
	import Entities.Cup;
	import Entities.Die;

	public class Factory{
		public function createMeyerCup():Cup{
			return new Cup(2);
		}
		
		public function createCup():Cup{
			return new Cup(0);
		}
		
		public function createCustomDie(numberOfSides:int):Die{
			return new Die(numberOfSides);
		}
		
		public function createDie():Die{
			return new Die();
		}
	}
}