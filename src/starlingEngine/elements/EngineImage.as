package starlingEngine.elements 
{
	import bridge.abstract.IAbstractImage;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineImage extends Image implements IAbstractImage
	{
		
		public function EngineImage(texture:Texture) 
		{
			super(texture);
		}
		
	}

}