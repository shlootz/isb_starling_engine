package starlingEngine.elements 
{
	import bridge.abstract.IAbstractDisplayObject;
	import bridge.abstract.IAbstractSprite;
	import flash.geom.Rectangle;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineSprite extends Sprite implements IAbstractSprite
	{
		/**
		 * 
		 */
		public function EngineSprite() 
		{
			super();
		}
		/**
		 * 
		 * @param	child
		 * @return
		 */
		public function addNewChild(child:IAbstractDisplayObject):IAbstractDisplayObject
		{
			return super.addChild(child as DisplayObject) as IAbstractDisplayObject;
		}
		/**
		 * 
		 * @param	child
		 * @param	index
		 * @return
		 */
		public function addNewChildAt (child:IAbstractDisplayObject, index:int) : IAbstractDisplayObject
		{
			return super.addChildAt(child as DisplayObject, index) as IAbstractDisplayObject;
		}
		/**
		 * 
		 * @param	child
		 * @return
		 */
		public function containsChild (child:IAbstractDisplayObject) : Boolean
		{
			return super.contains(child as DisplayObject);
		}
		/**
		 * 
		 * @param	targetSpace
		 * @param	resultRect
		 * @return
		 */
		public function getChildBounds (targetSpace:IAbstractDisplayObject, resultRect:Rectangle = null) : Rectangle
		{
			return super.getBounds(targetSpace as DisplayObject, resultRect);
		}
		/**
		 * 
		 * @param	index
		 * @return
		 */
		public function getChildAtIndex (index:int) : IAbstractDisplayObject
		{
			return super.getChildAt(index) as IAbstractDisplayObject;
		}
		/**
		 * 
		 * @param	name
		 * @return
		 */
		public function getChildByNameStr (name:String) : IAbstractDisplayObject
		{
			return super.getChildByName(name) as IAbstractDisplayObject;
		}
		/**
		 * 
		 * @param	child
		 * @return
		 */
		public function getChildIndexNr (child:IAbstractDisplayObject) : int
		{
			return super.getChildIndex(child as DisplayObject);
		}
		/**
		 * 
		 * @param	child
		 * @param	dispose
		 * @return
		 */
		public function removeChildAndDispose (child:IAbstractDisplayObject, dispose:Boolean = false) : IAbstractDisplayObject
		{
			return super.removeChild(child as DisplayObject, dispose) as IAbstractDisplayObject;
		}
		
	}

}