package bridge.abstract 
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractEngineLayerProxy 
	{
		/**
		 * 
		 * @param	layerName
		 */
		function addLayer(layerName:String):void
		/**
		 * 
		 * @param	layerName
		 * @return
		 */
		function retrieveLayer(layerName:String):IAbstractLayer
		/**
		 * 
		 */
		function get layers():Dictionary
	}
	
}