package  bridge
{
	import bridge.abstract.IAbstractEngine;
	import bridge.abstract.IAbstractEngineLayerVO;
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
	import bridge.abstract.IAbstractTexture;
	import bridge.abstract.IAbstractTextField;
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
		 * @param	assetsManager
		 */
		function injectAssetsManager(assetsManager:Object):void
		
		/**
		 * 
		 * @param	signalsHub
		 */
		function injectSignalsHub(signalsHub:Object):void
		 
		/**
		 * Inits the default signals for outter communication
		 */
		function initSignals():void
		
		/**
		 * 
		 * @param	name
		 * @return
		 */
		function requestTexture(name:String):IAbstractTexture
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
		 * 
		 * @param	width
		 * @param	height
		 * @param	text
		 * @param	fontName
		 * @param	fontSize
		 * @param	color
		 * @param	bold
		 * @return
		 */
		function requestTextField(width:int, height:int, text:String, fontName:String="Verdana", fontSize:Number=12, color:uint=0, bold:Boolean=false):IAbstractTextField
		
		/**
		 * 
		 * @return
		 */
		function requestLayersVO():IAbstractEngineLayerVO;
		
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
		
		/**
		 * 
		 */
		function cleanUp():void
	}
	
}