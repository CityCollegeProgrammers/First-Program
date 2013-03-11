package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.FP;
	import net.flashpunk.Engine;
	
	/**
	 * ...
	 * @author Atl Arredondo
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			//Create a Window
			super(640, 480);
			
			FP.screen.scale = 1;
			
			FP.console.enable();
		}

		override public function init():void 
		{
			FP.world = new GameWorld();
			super.init();
			
		}
		
		
		
	}
	
}