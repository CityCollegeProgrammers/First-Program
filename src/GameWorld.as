package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Atl Arredondo
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			//add(new Level());
			add(new Player());
			add(new Enemy ());
			add(new Enemy ());
			add(new Enemy ());
			super.begin();
		}
		
	}

}