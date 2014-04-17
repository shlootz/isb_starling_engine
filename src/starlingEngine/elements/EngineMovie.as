package starlingEngine.elements 
{
	import bridge.abstract.IAbstractMovie;
	import bridge.abstract.IAbstractTexture;
	import flash.media.Sound;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineMovie extends MovieClip implements IAbstractMovie
	{
		
		public function EngineMovie(vector:Vector.<Texture>, fps:uint = 24) 
		{
			super(vector, fps);
		}
		
		public function addNewFrame(texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void
		{
			super.addFrame(texture as Texture, sound, duration);
		}
		
		public function addNewFrameAt(frameID:uint, texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void
		{
			super.addFrameAt(frameID, texture as EngineTexture, sound, duration);
		}
		
		public function getTextureFromFrame(frameID:uint):IAbstractTexture
		{
			return super.getFrameTexture(frameID) as IAbstractTexture
		}
		
		public function setTextureToFrame(frameID:uint, texture:IAbstractTexture):void
		{
			super.setFrameTexture(frameID, texture as EngineTexture);
		}
	}

}