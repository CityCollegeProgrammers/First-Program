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
			add(new Player());
			super.begin();
		}
		
	}

}