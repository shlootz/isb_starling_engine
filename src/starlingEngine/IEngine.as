package  starlingEngine
{
	import bridge.abstract.IAbstractEngine;
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.IAbstractMovie;
	import bridge.abstract.IAbstractSprite;
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
	public interface IEngine extends IAbstractEngine
	{
		/**
		 * 
		 * @param	texture
		 * @return
		 */
		function requestImage(texture:Texture):IAbstractImage
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return
		 */
		function requestMovie(textures:Vector.<Texture>, fps:uint = 24):IAbstractMovie
		
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