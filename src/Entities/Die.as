package Entities
{
	import starling.display.Sprite;

	public class Die extends Sprite{
		private var value:int;
		private var numberOfSides:int;
		
		/**
		 * @param numberOfSides - the number of sides on the dice, standard value 6.
		 */
		public function Die(numberOfSides:int=6){
			this.numberOfSides = numberOfSides;
			Roll();
		}

		/**
		 * @return Returns and integer n 1<=n<=numberOfSides, and sets the value of the die.
		 */
		public function Roll():int{
			return value = Math.ceil(Math.random()*numberOfSides);
		}

		public function getValue():int{
			return value;
		}
	}
}