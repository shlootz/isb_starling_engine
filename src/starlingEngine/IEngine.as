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
	 * 
	 * IEngine interface contains only the tight coupled methods.
	 * All the generic methods are in the @see bridge.abstract.IAbstractEngine
	 * <p>In order to implement a new graphics engine, follow these steps:
	 * <li>build an IEngine containing the coupled methods</li> 
	 * <li>extend the IAbstractEngine</li> 
	 * <li>build the business logig implementing IEngine</li> 
	 * </p>
	 */
	public interface IEngine extends IAbstractEngine
	{
		/**
		 * 
		 * @param	texture
		 * @return @see bridge.abstract.IAbstractImage
		 */
		function requestImage(texture:Texture):IAbstractImage
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return@see bridge.abstract.IAbstractMovie
		 */
		function requestMovie(textures:Vector.<Texture>, fps:uint = 24):IAbstractMovie
		
		/**
		 * @TODO build a abstractization for Juggler
		 * @return Returns the engine Juggler
		 */
		function get juggler():Juggler
		
		/**
		 * Returns the instance of the default stage used by the engine.
		 * <b>!warning! this will add children on top of any existing state or layer, including the performance stats</b>
		 * @TODO build a abstractization for Stage
		 * @return Returns the engine stage
		 */
		function get engineStage():Stage
	}
	
}