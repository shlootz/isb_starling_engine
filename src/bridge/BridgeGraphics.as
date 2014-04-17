package bridge 
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import signals.ISignalsHub;
	import signals.Signals;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class BridgeGraphics implements IBridgeGraphics
	{
		
		public static const GRAPHICS_ENGINE:String = getQualifiedClassName+"graphicsEngine";
		public static const ASSETS_MANAGER:String = getQualifiedClassName+"assetsManager";
		public static const SIGNALS_MANAGER:String = getQualifiedClassName+"signalsManager";
		public static const POOL:String = getQualifiedClassName+"pool";
		public static const JUGGLER:String = getQualifiedClassName+"juggler";
		public static const SPACE:String = getQualifiedClassName+"space";
			
		public var display:Object;
		
		public var imageClass:Class;
		public var movieclipClass:Class;
		
		private var _injectedClasses:Dictionary = new Dictionary();
		private var _graphicsEngine:Object;
		private var _assetsManager:Object;
		private var _signalsManager:Object;
		private var _poolClass:Class;
		private var _juggler:Object;
		private var _space:Object;
		
		/**
		 * 
		 * @param	assetsManagerClass
		 * @param	signalsManagerClass
		 * @param	poolClass
		 * @param	juggler
		 * @param	space
		 */
		public function BridgeGraphics( 
										graphicsEngineClass:Class,
										assetsManagerClass:Class, 
										signalsManagerClass:Class, 
										poolClass:Class,
										juggler:Class = null,
										space:Class = null
									    ) 
		{
			_injectedClasses[GRAPHICS_ENGINE] = graphicsEngineClass;
			_injectedClasses[ASSETS_MANAGER] = assetsManagerClass;
			_injectedClasses[SIGNALS_MANAGER] = signalsManagerClass;
			_injectedClasses[POOL] = poolClass;
			_injectedClasses[JUGGLER] = juggler;
			_injectedClasses[SPACE] = space;
			
			_graphicsEngine = new graphicsEngineClass(graphicsEngineInited) as IEngine;
			_assetsManager = new assetsManagerClass();
			_signalsManager = new signalsManagerClass();
			_poolClass = poolClass;
			_juggler = new juggler();
			_space = new space();
		}
		
		/**
		 * 
		 */
		public function graphicsEngineInited():void
		{	
			_signalsManager.dispatchSignal(Signals.STARLING_READY, "", "");
			display = (_graphicsEngine as IEngine).engineStage;
			
			if (_juggler != null)
			{
				(_graphicsEngine as IEngine).addJuggler(_juggler)
			}
			
			if (space != null)
			{
				
			}
		}
		
		/**
		 * 
		 */
		public function get engine():Object
		{
			return _graphicsEngine;
		}
		
		/**
		 * 
		 */
		public function get injectedClasses():Dictionary
		{
			return _injectedClasses
		}
		
		/**
		 * 
		 */
		public function get assetsManager():Object
		{
			return _assetsManager;
		}
		
		/**
		 * 
		 */
		public function get signalsManager():Object
		{
			return _signalsManager;
		}
		
		/**
		 * 
		 */
		public function get poolClass():Class
		{
			return _poolClass;
		}
		
		/**
		 * 
		 */
		public function get juggler():Object
		{
			return _juggler;
		}
		
		/**
		 * 
		 */
		public function get defaultJuggler():Object
		{
			return (_graphicsEngine as IEngine).juggler;
		}
		
		/**
		 * 
		 */
		public function get space():Object
		{
			return _space;
		}
		
		/**
		 * 
		 */
		public function set juggler(val:Object):void
		{
			_juggler = juggler;
		}
		
		/**
		 * 
		 */
		public function set space(val:Object):void
		{
			_space = space;
		}
		
		/**
		 * 
		 * @param	name
		 * @return
		 */
		public function requestImage(name:String):Object
		{
			return (_graphicsEngine as IEngine).requestImage(_assetsManager.getTexture(name));
		}
		
		/**
		 * 
		 * @param	prefix
		 * @param	fps
		 * @return
		 */
		public function requestMovie(prefix:String, fps:uint = 24):Object
		{
			return (_graphicsEngine as IEngine).requestMovie(_assetsManager.getTextures(prefix), fps);
		}
		
		/**
		 * 
		 * @param	child
		 */
		public function addChild(child:Object):void
		{
			_graphicsEngine.engineStage.addChild(child);
		}
		
	}

}