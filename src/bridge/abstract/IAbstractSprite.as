package bridge.abstract 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractSprite extends IAbstractEngineDisplayObjectContainer
	{
		function get clipRect () : Rectangle;
		function set clipRect (value:Rectangle) : void;

		function get isFlattened () : Boolean;

		function flatten () : void;

		function unflatten () : void;
	}
	
}