package Entities
{
	import starling.display.Sprite;
	import starling.events.Event;

	public class Die extends Sprite{
		private var value:int;
		private var numberOfSides:int = 6;
		
		public function Die(){
			addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		
		private function initialize(event:Event):void{
			Roll();
		}
		
		/**
		 * @return Returns and integer n 1<=n<=numberOfSides, and sets the value of the die.
		 */
		public function Roll():int{
			return value = Math.ceil(Math.random()*numberOfSides);
		}
		
		/**
		 * @param number - The number of sides of the dice.
		 * Rolls the dice to avoid an unvalid value.
		 */
		public function setNumberOfSides(number:int):void{
			numberOfSides = number;
			Roll();
		}
		
		public function getValue():int{
			return value;
		}
	}
}