package Entities
{
	import starling.display.Sprite;

	public class Cup extends Sprite{
		private var dice:Array;
		
		/**
		 * @param numberOfDice - The number of dice in the cup.
		 * @param numberOfSides - The number of sides on each dice.
		 */
		public function Cup(numberOfDice:int, numberOfSides:int=6){
			dice = new Array(numberOfDice);
			
			for(var i:int=0; i<numberOfDice; i++){
				dice[i]= new Die().setNumberOfSides(numberOfSides);
			}
		}
		
		public function Roll():Array{
			for each(var d:Die in dice){
				d.Roll();
			}
			
			return dice;
		}
	}
}