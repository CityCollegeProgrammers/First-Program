package  
{
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;

	
	/**
	 * ...
	 * @author Atl Arredondo
	 */
	public class Level extends Entity 
	{
		[Embed(source = "../assets/First_Level.oel", mimeType = "application/octet-stream")]
		public static const LVL_ONE:Class;
		
		[Embed(source = "../assets/tilemap.png")]
		private const TILES_GRAPHIC:Class;
		
		private var _tiles:Tilemap;
		private var _grid:Grid;
		private var xml:XML;
		
		
		
		public function Level() 
		{
			//To check Collisions(With the Player or the Enemies)
			type = "level";

			//Get all the data, to the variable XML
			this.xml = FP.getXML(LVL_ONE);
		}
		
		override public function added():void 
		{
			super.added();
			
			//load tiles  (Put the tiles  information(From the levlel file ) in one string, and import them to the entity)
			_tiles = new Tilemap(TILES_GRAPHIC, xml.@width, xml.@height, 32, 32);
			_tiles.loadFromString(xml.Tiles);
			
			//To see if the tiles get imported
			trace(xml.Tiles);
			
			
			// set graphic to graphiclist of tilesets, order matters!
			graphic = new Graphiclist(_tiles);

			//load the collision grid
			_grid = new Grid(xml.@width, xml.@height, 32, 32);
			_grid.loadFromString(xml.Grid, "");
			
			//Mask property of the Entity is now the Grid
			mask = _grid;

		}
	}

}