package bridge.abstract 
{
	import flash.net.NetStream;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractVideo extends IAbstractSprite
	{
		/**
		 * 
		 * @param	path
		 */
		function addVideoPath(path:String):void
		
		/**
		 * 
		 */
		function pause():void
		
		/**
		 * 
		 */
		function resume():void
		
		/**
		 * 
		 */
		function stop():void
		
		/**
		 * s
		 */
		function get stream():NetStream
	}
	
}