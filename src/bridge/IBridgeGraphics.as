package bridge 
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IBridgeGraphics 
	{
		/**
		 * 
		 */
		function graphicsEngineInited():void
		/**
		 * 
		 */
		function get engine():Object
		/**
		 * 
		 */
		function get injectedClasses():Dictionary
		/**
		 * 
		 */
		function get assetsManager():Object
		/**
		 * 
		 */
		function get signalsManager():Object
		/**
		 * 
		 */
		function get poolClass():Class
		/**
		 * 
		 */
		function set juggler(val:Object):void
		/**
		 * 
		 */
		function get juggler():Object
		/**
		 * 
		 */
		function get defaultJuggler():Object
		/**
		 * 
		 */
		function get space():Object
		/**
		 * 
		 */
		function set space(val:Object):void
		/**
		 * 
		 * @param	name
		 * @return
		 */
		function requestImage(name:String):Object
		/**
		 * 
		 * @param	prefix
		 * @param	fps
		 * @return
		 */
		function requestMovie(prefix:String, fps:uint = 24):Object
		/**
		 * 
		 * @param	child
		 */
		function addChild(child:Object):void
	}
	
}