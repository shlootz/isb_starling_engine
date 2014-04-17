package bridge.abstract 
{
	import flash.geom.Rectangle;
	import flash.geom.Matrix;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractDisplayObject 
	{
		/**
		 * 
		 */
		function set x(val:Number):void
		/**
		 * 
		 */
		function get x():Number
		/**
		 * 
		 */
		function set y(val:Number):void
		/**
		 * 
		 */
		function get y():Number
		/**
		 * 
		 */
		function set rotation(val:Number):void
		/**
		 * 
		 */
		function get rotation():Number
		/**
		 * 
		 */
		function set alpha(val:Number):void
		/**
		 * 
		 */
		function get alpha():Number
		/**
		 * 
		 */
		function set scaleX(val:Number):void
		/**
		 * 
		 */
		function get scaleX():Number
		/**
		 * 
		 */
		function set scaleY(val:Number):void
		/**
		 * 
		 */
		function get scaleY():Number
		/**
		 * 
		 */
		function get blendMode () : String;
		/**
		 * 
		 */
		function set blendMode (value:String) : void;
		/**
		 * 
		 */
		function get bounds () : Rectangle;
		/**
		 * 
		 */
		function get height () : Number;
		/**
		 * 
		 */
		function set height (value:Number) : void;
		/**
		 * 
		 */
		function get name () : String;
		/**
		 * 
		 */
		function set name (value:String) : void;
		/**
		 * 
		 */
		//function get parent () : DisplayObjectContainer;
		/**
		 * 
		 */
		function get pivotX () : Number;
		/**
		 * 
		 */
		function set pivotX (value:Number) : void;
		/**
		 * 
		 */
		function get pivotY () : Number;
		/**
		 * 
		 */
		function set pivotY (value:Number) : void;
		/**
		 * 
		 */
		//function get root () : IAbstractDisplayObject;
		/**
		 * 
		 */
		function get skewX () : Number;
		/**
		 * 
		 */
		function set skewX (value:Number) : void;
		/**
		 * 
		 */
		function get skewY () : Number;
		/**
		 * 
		 */
		function set skewY (value:Number) : void;
		/**
		 * 
		 */
		function get touchable () : Boolean;
		/**
		 * 
		 */
		function set touchable (value:Boolean) : void;
		/**
		 * 
		 */
		function get transformationMatrix () : Matrix;
		/**
		 * 
		 */
		function set transformationMatrix (matrix:Matrix) : void;
		/**
		 * 
		 */
		function get useHandCursor () : Boolean;
		/**
		 * 
		 */
		function set useHandCursor (value:Boolean) : void;
		/**
		 * 
		 */
		function get visible () : Boolean;
		/**
		 * 
		 */
		function set visible (value:Boolean) : void;
		/**
		 * 
		 */
		function get width () : Number;
		/**
		 * 
		 */
		function set width (value:Number) : void;
		/**
		 * 
		 * @param	type
		 * @param	listener
		 */
		function addEventListener (type:String, listener:Function) : void;
		/**
		 * 
		 * @param	hAlign
		 * @param	vAlign
		 */
		function alignPivot (hAlign:String="center", vAlign:String="center") : void;
		/**
		 * 
		 */
		function dispose () : void;
		/**
		 * 
		 */
		//function getBounds (targetSpace:IAbstractDisplayObject, resultRect:Rectangle=null) : Rectangle;
		/**
		 * 
		 */
		//function getTransformationMatrix (targetSpace:IAbstractDisplayObject, resultMatrix:Matrix=null) : Matrix;
		/**
		 * 
		 * @param	globalPoint
		 * @param	resultPoint
		 * @return
		 */
		function globalToLocal (globalPoint:Point, resultPoint:Point=null) : Point;
		/**
		 * 
		 */
		//function hitTest (localPoint:Point, forTouch:Boolean=false) : IAbstractDisplayObject;
		/**
		 * 
		 * @param	localPoint
		 * @param	resultPoint
		 * @return
		 */
		function localToGlobal (localPoint:Point, resultPoint:Point=null) : Point;
		/**
		 * 
		 * @param	type
		 * @param	listener
		 */
		function removeEventListener (type:String, listener:Function) : void;
		/**
		 * 
		 * @param	type
		 */
		function removeEventListeners (type:String=null) : void;
		/**
		 * 
		 * @param	dispose
		 */
		function removeFromParent (dispose:Boolean=false) : void;
		/**
		 * 
		 */
		//function setParent (value:DisplayObjectContainer) : void;
	}
	
}