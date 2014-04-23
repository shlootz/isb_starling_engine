package starlingEngine.elements 
{
	import bridge.abstract.IAbstractLayer;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineLayer extends EngineState implements IAbstractLayer
	{	
		private var _layerName:String;
		
		/**
		 * 
		 * @param	layerName
		 */
		public function EngineLayer(name:String) 
		{
			_layerName = name;
		}
		
		/**
		 * 
		 */
		public function set layerName(name:String):void
		{
			_layerName = name;
		}
		
		/**
		 * 
		 */
		public function get layerName():String
		{
			return _layerName;
		}
	}
	
}