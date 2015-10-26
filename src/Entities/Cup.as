package Entities
{
	import starling.display.Sprite;

	public class Cup extends Sprite{
		private var dice:Array;
		private var isEmpty:Boolean = false;
		
		/**
		 * @param numberOfDice - The number of dice in the cup.
		 * @param numberOfSides - The number of sides on each dice.
		 */
		public function Cup(numberOfDice:int, numberOfSides:int=6){
			if(numberOfDice != 0)
				dice = new Array(numberOfDice);
			else
				isEmpty = true;
			
			for(var i:int=0; i<numberOfDice; i++){
				dice[i]= new Die(numberOfSides)
			}
		}
		
		/**
		 * Rolls the dice in the cup if there are any.
		 */
		public function Roll():void{
			if(!isEmpty){
				for each(var d:Die in dice){
				d.Roll();
				}
			}
		}
		
		public function GetDice():Array{
			return dice;
		}
	}
}