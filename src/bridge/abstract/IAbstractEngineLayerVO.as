package bridge.abstract 
{
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	/**
	 * The layer proxy manages a dictionary of layers.
	 * Creates and retrieves lauers.
	 * @see bridge.abstract.IAbstractLayer
	 */
	public interface IAbstractEngineLayerVO 
	{
		/**
		 * Adds a layer at the specified depth and with the specified layout xml
		 * @param	layerName
		 */
		function addLayer(layerName:String, depth:uint = 0, xml:XML = null, addToStage:Boolean = true):void
		/**
		 * 
		 * @param	layerName
		 * @return IAbstractLayer
		 * @see bridge.abstract.IAbstractLayer
		 */
		function retrieveLayer(layerName:String):IAbstractLayer
		/**
		 * @return Returns the layers dictionary
		 */
		function get layers():Dictionary
	}
	
}