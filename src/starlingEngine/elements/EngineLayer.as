package starlingEngine.elements 
{
	import bridge.abstract.IAbstractLayer;
	import flash.utils.Dictionary;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineLayer extends EngineState implements IAbstractLayer
	{	
		private var _layerName:String;
		private var _layerDepth:uint = 0;
		private var _layout:XML;
		private var _layoutDictionary:Dictionary = new Dictionary(true);
		private var _addToStage:Boolean = false;
		
		/**
		 * 
		 * @param	layerName
		 */
		public function EngineLayer(name:String, depth:uint = 0, layout:XML = null, addToStage:Boolean = true ) 
		{
			_layerName = name;
			_layerDepth = depth;
			_addToStage = addToStage;
			this.name = name;
			
			if (layout != null)
			{
				_layout = layout;
				parseLayout();
			}
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
		
		/**
		 * 
		 * @param	layout
		 */
		public function injectLayout(layout:XML, applyNow:Boolean = false):void
		{
			_layout = layout;
			
			if (applyNow)
			{
				applyLayout();
			}
		}
		
		/**
		 * 
		 */
		public function applyLayout():void
		{
			parseLayout();
		}
		
		/**
		 * 
		 */
		public function get layout():Dictionary
		{
			return _layoutDictionary;
		}
		
		/**
		 * 
		 */
		private function parseLayout():void
		{
			for (var i:uint = 0; i < _layout.children().length(); i++)
			{
				var name:String = String(_layout.child("Element")[i].attribute("name"));
				var type:String = _layout.child("Element")[i].attribute("type");
				var onStage:String = _layout.child("Element")[i].attribute("onStage");
				var x:String = _layout.child("Element")[i].attribute("x");
				var y:String = _layout.child("Element")[i].attribute("y");
				var w:String = _layout.child("Element")[i].attribute("width");
				var h:String = _layout.child("Element")[i].attribute("height");
				var fps:uint = uint(_layout.child("Element")[i].attribute("fps"));
				var depth:String = _layout.child("Element")[i].attribute("depth");
				
				var o:EngineLayerLayoutElementVo = new EngineLayerLayoutElementVo();
				o.name = name;
				o.type = type;
				o.onStage = onStage;
				o.x = Number(x);
				o.y = Number(y);
				o.width = Number(w);
				o.height = Number(h);
				o.fps = fps;
				o.layerDepth = Number(depth)
				
				_layoutDictionary[name] = o;
			}
		}
		
		/**
		 * 
		 */
		public function get addToStage():Boolean
		{
			return _addToStage;
		}
	}
	
}