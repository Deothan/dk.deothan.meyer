package View
{
	import starling.display.Sprite;

	public class ScreenManager extends Sprite{
		private var screen:Sprite;
		
		public function loadScreen( newScreen:Class ):void{
			if(screen != null && contains(screen)){
				removeChild(screen, true);
			}

			screen = new newScreen();
			addChild(screen);
		}
		
		public function GetScreen():Sprite{
			return screen;
		}
	}
}