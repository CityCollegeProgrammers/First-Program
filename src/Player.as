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
		//Adding the image file
		[Embed(source="../assets/playerIMG.png")]private const PLAYER_GRAPHIC:Class;
		var image:Image;
		
		var _v:Point = new Point;
		
		public function Player() 
		{
			//Adding the image to the image variable.
			image = new Image(PLAYER_GRAPHIC);
			graphic = image;
			
			setHitbox(32, 32, 0, 0);
			type = "player"; 
			
			
		}
		
		override public function update():void 
		{
			movementUpdate();
			updateCollision();
			var movement:Point = new Point;
			if (Input.check(Key.UP)) movement.y--;
			if (Input.check(Key.DOWN)) movement.y++;
			if (Input.check(Key.RIGHT))movement.x++; 
			if (Input.check(Key.LEFT)) movement.x--; 
			
			_v.x = 200* FP.elapsed * movement.x;
			_v.y = 200 * FP.elapsed * movement.y;
			
			//To Check Collision
			if (collide("enemy", x, y))
			{
				trace("Collide on enemy");
				//image.color =0xff0000;

			}
			super.update();
		}
		private function movementUpdate ():void
		{
			x += _v.x;
			y += _v.y;
		}
		
		private function updateCollision ():void
		{
			//Collide Function, if it collide against enemy at the location x,y of the player)
			x += _v.x;
			if (collide("level", x, y))
			{
				if (FP.sign(_v.x) > 0)
				{
					_v.x = 0;
					x = Math.floor(x / 32) * 32 +32 - width;

				}
				else
				{
					//Moving to the left
					_v.x = 0
					x = Math.floor(x / 32) * 32 +32;
				}
			}
			
			
			if (collide("level", x, y))
			{
				if (FP.sign(_v.y) > 0)
				{
					//Moving Down
					_v.y = 0;
					y = Math.floor((y/ height) /32)* 32 +32 - height;

				}
				else
				{
					//Moving to the UP
					_v.y = 0
					y = Math.floor(y / 32) * 32 + 32;
				}
			}


		}
	}

}