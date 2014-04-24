package bridge.abstract 
{
	import bridge.abstract.transitions.IAbstractStateTransition;
	import flash.events.Event;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import flash.utils.Dictionary
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractEngine 
	{
		/**
		 * 
		 */
		function initEngine():void
		/**
		 * 
		 * @param	e
		 */
		function loop(e:Event):void
		/**
		 * 
		 * @param	newJuggler
		 */
		function addJuggler(newJuggler:Object):void
		/**
		 * 
		 * @param	juggler
		 */
		function removeJuggler(juggler:Object):void
		
		/**
		 * 
		 * @return
		 */
		function requestSprite():IAbstractSprite
		
		/**
		 * 
		 * @return
		 */
		function requestState():IAbstractState
		
		/**
		 * 
		 * @param	newState
		 */
		function tranzitionToState(newState:IAbstractState, transitionEffect:IAbstractStateTransition = null):void
		
		/**
		 * 
		 */
		function get layers():Dictionary
		
		/**
		 * 
		 * @param	inputLayers
		 */
		function initLayers(inputLayers:Dictionary, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut = null):void
		
		/**
		 * 
		 * @param	layer1
		 * @param	layer2
		 */
		function swapLayers(layer1:IAbstractLayer, layer2:IAbstractLayer):void
		
		/**
		 * 
		 * @param	inLayers
		 * @param	outLayers
		 */
		function updateLayers(inLayers:Vector.<IAbstractLayer> = null, outLayers:Vector.<IAbstractLayer> = null, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut= null):void
		
	}
	
}