package  
{
	import flash.events.Event;
	import starling.animation.Juggler;
	import starling.display.Image;
	import starling.display.Stage;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IEngine
	{
		/**
		 * 
		 */
		function initEngine():void
		/**
		 * 
		 * @param	e
		 */
		function loop(e:Event):void
		/**
		 * 
		 * @param	newJuggler
		 */
		function addJuggler(newJuggler:Object):void
		/**
		 * 
		 * @param	juggler
		 */
		function removeJuggler(juggler:Object):void
		/**
		 * 
		 * @param	texture
		 * @return
		 */
		function requestImage(texture:Texture):Image
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return
		 */
		function requestMovie(textures:Vector.<Texture>, fps:uint = 24):Image
		/**
		 * 
		 */
		function get juggler():Juggler
		
		/**
		 * 
		 */
		function get engineStage():Stage
	}
	
}