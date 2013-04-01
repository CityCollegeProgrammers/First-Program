package  
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;

	
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Entity 
	{
		//Adding the Image file
		[Embed(source = "../assets/enemy.png")]private const ENEMY_GRAPHIC:Class;
		var image:Image;

		public function Enemy() 
		{
			//Set up the image into the graphic of the entity	
			image = new Image(ENEMY_GRAPHIC);
			graphic = image;

			//Set up location to the Entity
			x = FP.rand(FP.screen.width);
			y = FP.rand(FP.screen.height);

			//The name that we are going to use to call it
			type = "enemy";
			
			//Set up hitbox, x,y, origin of the setbox coordinates.
			setHitbox(32, 32,0, 0);

		}
			
		
	}

}