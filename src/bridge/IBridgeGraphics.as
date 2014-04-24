package bridge 
{
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.IAbstractMovie;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import citrus.objects.complex.box2dstarling.Bridge;
	import flash.utils.Dictionary;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractSprite;
	import bridge.abstract.IAbstractState;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
	import starlingEngine.IEngine;
	
	/**
	 * ...
	 * @author Alex Popescu
	 * @version 1.0.0
	 *  
	 * <p>The BridgeGraphics class represents the linkage between the logic end of the app and the actual
	 * display. The display itself can differ: DisplayList, Stage3D, etc. It uses a collection of abstract
	 * interfaces that make the actual liasion.</p>
	 * 
	 * <p>It is recommended to store the Bridge instance as a member variable, to make sure
     * that the Garbage Collector does not destroy it. This is how to instatiate it:</p>
	 * 
	 * <pre>var bridge:IBridgeGraphics = new BridgeGraphics(GraphicsEngine,AssetManager,SignalsHub,AbstractPool,Juggler,Space);</pre>
	 * 
	 * <p>The first paramater is the class of the actual Graphics Engine. The second paramater is the
	 * class for the assets manager - sometimes the assets manager can be included in the graphics
	 * engine itself, eg. StarlingEngine. The third paramater is the signals manager class that makes
	 * the entire communication throughout the graphics bridge and engine. The forth paramater is the
	 * class for an abstract pool. The fifth paramater is the juggler - it is a container for animations.
	 * The sixth paramater is the space for physics.</p>
	 * 
	 * <p>The bridge is actually injected with the above so that there is no direct connection with the 
	 * engine, making the access to methods allowed only via interfaces</p>
	 * 
	 * <p>The bridge makes all the necessary instantiations and dispatches a native signal when the system
	 * is up and running - e.g. for StarlingEngine: Signals :: trying to dispatch GEstarlingReady</p>
	 */
	public interface IBridgeGraphics
	{
		/** Callback from the engine to mark the succesful init of the engine.
		 * It will further dispatch a signal Signals.STARLING_READY
		 */
		function graphicsEngineInited():void
		/**
		 * @return Returns the instance of the engine.
		 */
		
		function get engine():IEngine
		/**
		 * @return Returns a dictionary containing the list of injected classes. The defaults are:
		 * 			<li>graphicsEngine</li>
		 * 			<li>assetsManager</li>
		 * 			<li>signalsManager</li>
		 * 			<li>pool</li>
		 * 			<li>juggler</li>
		 * 			<li>space</li>
		 */
		function get injectedClasses():Dictionary
		
		/**
		 * @return Returns the instance of the assets manager.
		 * 
		 * @TODO Build an interface for the assets manager
		 */
		function get assetsManager():Object
		
		/**
		 * @return Returns the instance of the signals manager.
		 * 
		 * @TODO Build an interface for the signals manager.
		 */
		function get signalsManager():Object
		
		/**
		 * @return Returns the class for the abstract pool.
		 */
		function get poolClass():Class
		
		/**
		 * Sets a new juggler
		 * 
		 * @TODO Build an interface for the juggler
		 */
		function set juggler(val:Object):void
		
		/**
		 * @return Returns the class for the custom juggler
		 * 
		 * @TODO Build an interface for the juggler
		 */
		function get juggler():Object
		
		/**
		 * @return Returns the class for the default juggler
		 * 
		 * @TODO Build an interface for the juggler
		 */
		function get defaultJuggler():Object
		
		/**
		 * @return Returns the class for the physics space.
		 * 
		 * @TODO Build an interface for the space
		 */
		function get space():Object
		
		/** Sets a custom physics space
		 * 
		 * @TODO Build an interface for the space
		 */
		function set space(val:Object):void
		
		/** Request an image
		 * 
		 * @param	name
		 * @return Returns an @see bridge.abstract.IAbstractImage
		 */
		function requestImage(name:String):IAbstractImage
		
		/** Uses a prefix to build an animation from images in an atlas.
		 * 
		 * @param	prefix - retrieves all the images from an atlas using this prefix
		 * @param	fps - sets the frames per second that the movie clip will play at independently
		 * @return Returns an @see bridge.abstract.IAbstractMovie
		 */
		function requestMovie(prefix:String, fps:uint = 24):IAbstractMovie
		
		/** Build an empty sprite
		 * 
		 * @return Returns an @see bridge.abstract.IAbstractSprite
		 */
		function requestSprite():IAbstractSprite
		
		/** Builds an empty state
		 * 
		 * @return Returns an @see bridge.abstract.IAbstractState
		 */
		function requestState():IAbstractState
		
		/** Makes the transition to a new state
		 * 
		 * @param	newState @see bridge.abstract.IAbstractState
		 * @param	transitionEffect @see bridge.abstract.transitions.IAbstractStateTransition
		 */
		function tranzitionToState(newState:IAbstractState, transitionEffect:IAbstractStateTransition = null):void
		
		/** Initializes the first default layers
		 * 
		 * @param	inputLayers
		 */
		function initLayers(inputLayers:Dictionary, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut = null):void
		
		/** Receives 2 vectors of @see  bridge.abstract.IAbstractLayer and updates the layers in the current state
		 * 
		 * @param	inLayers
		 * @param	outLayers
		 */
		function updateLayers(inLayers:Vector.<IAbstractLayer> = null, outLayers:Vector.<IAbstractLayer> = null, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut = null ):void
		
		/** Swaps layer1 with layer2
		 * 
		 * @param	layer1 @see  bridge.abstract.IAbstractLayer
		 * @param	layer2 @see  bridge.abstract.IAbstractLayer
		 */
		function swapLayers(layer1:IAbstractLayer, layer2:IAbstractLayer):void
		
		/**
		 * @return Returns a Dictionary containing all the current state layers
		 */
		function get layers():Dictionary
		
		/** Adds child to the default Stage
		 * 
		 * @param	child
		 */
		function addChild(child:Object):void
	}
	
}