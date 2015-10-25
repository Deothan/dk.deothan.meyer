package Controller
{
	import Entities.Cup;
	import Entities.Die;

	public class Factory{
		public function CreateMeyerCup():Cup{
			return new Cup(2);
		}
		
		public function CreateCup():Cup{
			return new Cup(0);
		}
		
		public function CreateCustomDie(numberOfSides:int):Die{
			return new Die(numberOfSides);
		}
		
		public function CreateDie():Die{
			return new Die();
		}
	}
}