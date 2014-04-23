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
		private var _layerDepth:uint = 0;
		
		/**
		 * 
		 * @param	layerName
		 */
		public function EngineLayer(name:String, depth:uint = 0 ) 
		{
			_layerName = name;
			_layerDepth = depth;
			this.name = name;
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
		
		/**
		 * 
		 */
		public function get layerDepth():uint
		{
			return _layerDepth;
		}
		
		/**
		 * 
		 */
		public function set layerDepth(val:uint ):void
		{
			_layerDepth = val;
		}
	}
	
}