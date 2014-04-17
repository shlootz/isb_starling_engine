package bridge.abstract 
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractEngineDisplayObjectContainer extends IAbstractDisplayObject
	{
		function get numChildren () : int;

		function addNewChild (child:IAbstractDisplayObject) : IAbstractDisplayObject;

		function addNewChildAt (child:IAbstractDisplayObject, index:int) : IAbstractDisplayObject;

		function broadcastEventWith (type:String, data:Object=null) : void;

		function containsChild (child:IAbstractDisplayObject) : Boolean;

		function getChildBounds (targetSpace:IAbstractDisplayObject, resultRect:Rectangle=null) : Rectangle;

		function getChildAtIndex (index:int) : IAbstractDisplayObject;

		function getChildByNameStr (name:String) : IAbstractDisplayObject;

		//function getChildEventListeners (object:IAbstractDisplayObject, eventType:String, listeners:Vector.<*>) : void;

		function getChildIndexNr (child:IAbstractDisplayObject) : int;

		//function hitTest (localPoint:Point, forTouch:Boolean=false) : IAbstractDisplayObject;

		function removeChildAndDispose (child:IAbstractDisplayObject, dispose:Boolean=false) : IAbstractDisplayObject;

		//function removeChildAt (index:int, dispose:Boolean=false) : IAbstractDisplayObject;
//
		//function removeChildren (beginIndex:int=0, endIndex:int=-1, dispose:Boolean=false) : void;
//
		//function setChildIndex (child:IAbstractDisplayObject, index:int) : void;
//
		//function sortChildren (compareFunction:Function) : void;
//
		//function swapChildren (child1:IAbstractDisplayObject, child2:IAbstractDisplayObject) : void;
//
		//function swapChildrenAt (index1:int, index2:int) : void;
	}
	
}