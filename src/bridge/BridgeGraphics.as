package bridge 
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	import signals.ISignalsHub;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class BridgeGraphics
	{
		public static const ASSETS_MANAGER:String = getQualifiedClassName+"assetsManager";
		public static const SIGNALS_MANAGER:String = getQualifiedClassName+"signalsManager";
		public static const POOL:String = getQualifiedClassName+"pool";
		public static const JUGGLER:String = getQualifiedClassName+"juggler";
		public static const SPACE:String = getQualifiedClassName+"space";
		
		private var _injectedClasses:Dictionary = new Dictionary();
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
		public function BridgeGraphics( assetsManagerClass:Class, 
										signalsManagerClass:Class, 
										poolClass:Class,
										juggler:Class = null,
										space:Class = null
									    ) 
		{
			_injectedClasses[ASSETS_MANAGER] = assetsManagerClass;
			_injectedClasses[SIGNALS_MANAGER] = signalsManagerClass;
			_injectedClasses[POOL] = poolClass;
			_injectedClasses[JUGGLER] = juggler;
			_injectedClasses[SPACE] = space;
			
			_assetsManager = new assetsManagerClass();
			_signalsManager = new signalsManagerClass();
			_poolClass = poolClass;
			_juggler = new juggler();
			_space = new space();
			
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
		
	}

}