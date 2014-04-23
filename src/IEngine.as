package  
{
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import starling.animation.Juggler;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Stage;
	import starling.textures.Texture;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractState;
	import starlingEngine.elements.EngineImage;
	import starlingEngine.elements.EngineMovie;
	import starlingEngine.elements.EngineSprite;
	import starlingEngine.elements.EngineState;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IEngine
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
		 * @param	texture
		 * @return
		 */
		function requestImage(texture:Texture):EngineImage
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return
		 */
		function requestMovie(textures:Vector.<Texture>, fps:uint = 24):EngineMovie
		
		/**
		 * 
		 * @return
		 */
		function requestSprite():EngineSprite
		
		/**
		 * 
		 * @return
		 */
		function requestState():EngineState
		
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
		
		/**
		 * 
		 */
		function get juggler():Juggler
		
		/**
		 * 
		 */
		function get engineStage():Stage
	}
	
}