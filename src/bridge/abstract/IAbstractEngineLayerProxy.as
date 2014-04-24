package bridge.abstract 
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Alex Popescu
	 * 
	 * The layer proxy manages a dictionary of layers.
	 * Creates and retrieves lauers.
	 * @see bridge.abstract.IAbstractLayer
	 */
	public interface IAbstractEngineLayerProxy 
	{
		/**
		 * 
		 * @param	layerName
		 */
		function addLayer(layerName:String, depth:uint = 0):void
		/**
		 * 
		 * @param	layerName
		 * @return
		 */
		function retrieveLayer(layerName:String):IAbstractLayer
		/**
		 * @return Returns the layers dictionary
		 */
		function get layers():Dictionary
	}
	
}