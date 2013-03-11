package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Atl Arredondo
	 */
	
	public class Player extends Entity 
	{
		var image:Image = new Image (new BitmapData(32, 32, true, 0xffffffff));
		var _v:Point = new Point;
		
		public function Player() 
		{
			graphic = image;
			
			
		}
		
		override public function update():void 
		{
			movementUpdate();
			var movement:Point = new Point;
			if (Input.check(Key.UP)) movement.y--;
			if (Input.check(Key.DOWN)) movement.y++;
			if (Input.check(Key.RIGHT)) movement.x++;
			if (Input.check(Key.LEFT)) movement.x--;
			
			_v.x = 200* FP.elapsed * movement.x;
			_v.y = 200 * FP.elapsed * movement.y;
			
			
			super.update();
		}
		private function movementUpdate ():void
		{
			x += _v.x;
			y += _v.y;
		}
	}

}