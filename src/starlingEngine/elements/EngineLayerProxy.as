package starlingEngine.elements 
{
	import bridge.abstract.IAbstractEngineLayerProxy;
	import bridge.abstract.IAbstractLayer;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineLayerProxy implements IAbstractEngineLayerProxy
	{
		
		private var _layers:Dictionary = new Dictionary(true);
		
		public function EngineLayerProxy() 
		{
			
		}
		
		/**
		 * 
		 * @param	layerName
		 */
		public function addLayer(layerName:String, depth:uint = 0, xml:XML = null):void
		{
			_layers[layerName] = new EngineLayer(layerName, depth, xml);
		}
		
		/**
		 * 
		 * @param	layerName
		 * @return
		 */
		public function retrieveLayer(layerName:String):IAbstractLayer
		{
			return _layers[layerName] as IAbstractLayer;
		}
		
		/**
		 * 
		 */
		public function get layers():Dictionary
		{
			return _layers
		}
		
	}

}