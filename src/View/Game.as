package View
{
	import flash.filesystem.File;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	public class Game extends Sprite{
		private var assetManager:AssetManager;

		public function Game(){
			assetManager = new AssetManager();
			var folder:File = File.applicationDirectory.resolvePath("Assets");
			assetManager.enqueue(folder);
			assetManager.loadQueue(progress);
		}

		private function progress( ratio:Number ):void{
			if( ratio == 1 ){
				start();
			}
		}

		private function start():void
		{
			var image:Image = new Image( assetManager.getTexture("1") );
			addChild( image );
		}
	}
}