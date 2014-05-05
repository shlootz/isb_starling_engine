package bridge.abstract 
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * An abstract pool receives any type of class to manage.
	 * @author Alex Popescu
	 */
	/**
	 * Object pooling: involves reusing objects over time. You create a defined number of objects during the initialization 
	 * of your application and store them inside a pool, such as an Array or Vector object. Once you are done with an object, 
	 * you deactivate it so that it does not consume CPU resources, and you remove all mutual references. However, you do not 
	 * set the references to null, which would make it eligible for garbage collection. You just put the object back into the 
	 * pool, and retrieve it when you need a new object.
	 */
	public class AbstractPool 
	{
		private var _id:String;
		private var _type:Class;
		private var _size:uint;
		//private var _pool:Vector.<*>; //if non SWC version
		private var _pool:Array;
		
		/**
		 * 
		 * @param	id
		 * @param	type
		 * @param	size
		 */
		public function AbstractPool(id:String,type:Class,size:uint) 
		{
			_id = id;
			_type = type;
			_size = size;
			
			ObjPool(size, type);
		}
		
		/**
		 * 
		 * @param	poolsize
		 * @param	_type
		 */
	    public function ObjPool(poolsize:uint, _type:Class):void
		{
			var className:String = getQualifiedClassName(_type);
			var vectorClass:Class  = Class(getDefinitionByName("Vector.<" + className + ">"));
			var i:uint = _size;
			//_pool = new vectorClass(poolsize); //if non SWC version
			_pool = new Array(poolsize);
			
			 while( --i > -1 ) 
                _pool[i] = new _type(); 
		}
		
		/**
		 * 
		 * @return Object
		 */
		public function getNewObject():Object
		{
			var newObj:Object;
			
			if (_pool.length == 0)
			{
				_pool.push(new Object());
			}
			
			newObj = _pool.shift();
			
			return newObj;
		}
		
		/**
		 * 
		 * @param	target
		 */
		public function returnToPool(target:Object):void
		{
			_pool.push(target);
		}
		
		/**
		 * 
		 * @param	newSpritesNumber
		 */
		public function growPool(newSpritesNumber:uint):void
		{
			var i:uint = _size;
			 while( --i > -1 ) 
                _pool.push(new _type()); 
		}
		
		/**
		 * 
		 * @param	target
		 */
		public function disposeObject(target:Object):void
		{
			target = null;
		}
		
		/**
		 * 
		 */
		public function emptyPool():void
		{
			var i:uint = _pool.length;
			 while( --i > -1 ) 
                _pool[i] = null;
			_pool.length = 0;
		}
	}
}