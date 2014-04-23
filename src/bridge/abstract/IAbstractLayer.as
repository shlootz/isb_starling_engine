package bridge.abstract 
{
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractLayer extends IAbstractState
	{
		function set layerName(name:String):void
		function get layerName():String
	}
	
}