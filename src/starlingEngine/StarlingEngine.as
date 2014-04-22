package starlingEngine
{
	import abstract.AbstractPool;
	import bridge.abstract.IAbstractDisplayObject;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractState;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import bridge.BridgeGraphics;
	import citrus.core.IState;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.core.starling.ViewportMode;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import nape.geom.Vec2;
	import nape.space.Space;
	import nape.util.ShapeDebug;
	import org.osflash.signals.Signal;
	import signals.ISignalsHub;
	import signals.Signals;
	import signals.SignalsHub;
	import starling.animation.Juggler;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Stage;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starlingEngine.elements.EngineImage;
	import starlingEngine.elements.EngineLayer;
	import starlingEngine.elements.EngineMovie;
	import starlingEngine.elements.EngineSprite;
	import starlingEngine.elements.EngineState;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class StarlingEngine extends StarlingCitrusEngine implements IEngine
	{		
		private var _initCompleteCallback:Function;
		private var _engineStage:Stage;
		private var _layers:Dictionary = new Dictionary(true);
		/**
		 * 
		 */
		public function StarlingEngine(initCompleteCallback:Function, baseWidth:int = 800, baseHeight:int = 600, viewportMode:String = ViewportMode.FULLSCREEN):void 
		{
			_baseWidth = baseWidth;
			_baseHeight = baseHeight;
			_viewportMode = viewportMode;
			_assetSizes = [1, 1.5, 2];
			
			_initCompleteCallback = initCompleteCallback;
		}
		
		/**
		 * 
		 * @param	e
		 */
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			initEngine();
		}		
		
		/**
		 * 
		 */
		public function initEngine():void
		{
			setUpStarling(true);
		}
		
		/**
		 * 
		 */
		override public function handleStarlingReady():void
		{ 
			//state = new TestState();
			initNape();
			_initCompleteCallback.call();
			_engineStage = starling.stage;
		}
		
		/**
		 * 
		 */
		private function initNape():void
		{
			//space = new Space(new Vec2(0, 5));
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		/**
		 * 
		 * @param	e
		 */
		public function loop(e:Event):void
		{
			//_bridgeGraphics.space.step(1 / 60);
		}
		
		/**
		 * 
		 * @param	newJuggler
		 */
		public function addJuggler(newJuggler:Object):void
		{
			starling.juggler.add(newJuggler as Juggler);
		}
		
		/**
		 * 
		 * @param	juggler
		 */
		public function removeJuggler(juggler:Object):void
		{
			starling.juggler.remove(juggler as Juggler);
		}
		
		/**
		 * 
		 * @param	texture
		 * @return
		 */
		public function requestImage(texture:Texture):EngineImage
		{
			var i:EngineImage = new EngineImage(texture);
			return i;
		}
		
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return
		 */
		public function requestMovie(textures:Vector.<Texture>, fps:uint = 24):EngineMovie
		{
			var m:EngineMovie = new EngineMovie(textures, fps);
			return m;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestSprite():EngineSprite
		{
			var s:EngineSprite = new EngineSprite();
			return s;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestState():EngineState
		{
			return new EngineState();
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestLayer():EngineLayer
		{
			return new EngineLayer();
		}
		
		/**
		 * 
		 * @param	newState
		 */
		public function tranzitionToState(newState:IAbstractState, transitionEffect:IAbstractStateTransition = null):void
		{
			//(newState as StarlingState).initialize();
			
			if (transitionEffect != null)
			{
				transitionEffect.injectOnTransitionComplete(tranzitionToStateComplete);
				futureState = newState as IState;
				transitionEffect.doTransition(state as IAbstractDisplayObject, futureState as IAbstractDisplayObject);
			}
			else
			{
				state = newState as StarlingState;
				(state as StarlingState).initialize();
			}
		}
		
		/**
		 * 
		 * @param	oldState
		 * @param	newState
		 */
		private function tranzitionToStateComplete():void
		{
			state = futureState;
		}
		
		/**
		 * 
		 */
		public function get juggler():Juggler
		{
			return starling.juggler;
		}
		
		/**
		 * 
		 */
		public function get engineStage():Stage
		{
			return _engineStage;
		}
		
	}
	
}