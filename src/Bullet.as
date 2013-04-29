package  
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import Player;
	import net.flashpunk.graphics.Image;
	
	
	/**
	 * ...
	 * @author Atl Arredondo
	 */
	public class Bullet extends Entity 
	{
		public const Bullet_Speed:int = 250;
		public function Bullet(xp:int, yp:int)
	
		{
			x = xp;
			y = yp;
			
			type = "bullet";
			
			graphic  = new Image( new BitmapData(4, 4, true, 0xffffffff));
		}
		
		override public function update():void 
		{
			super.update();
			
			x += FP.elapsed * Bullet_Speed;
			
			if (x > FP.width)
			{
				this.world.remove(this);
			}
			
			
		}
	}

}