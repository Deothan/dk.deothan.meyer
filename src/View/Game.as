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
			assetManager.loadQueue(Progress);
		}

		private function Progress(ratio:Number):void{
			if(ratio == 1){
				Start();
			}
		}

		private function Start():void
		{
			var image:Image = new Image(assetManager.getTexture("1"));
			addChild(image);
		}
	}
}