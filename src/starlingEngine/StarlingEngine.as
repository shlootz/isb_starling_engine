package starlingEngine
{
	import abstract.AbstractPool;
	import bridge.abstract.IAbstractDisplayObject;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.IAbstractState;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
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
	import starling.display.DisplayObject;
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
		private var _space:Space;
		private var _currentState:EngineState;
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
			initNape();
			
			_currentState = requestState();
			state = _currentState;
			
			_initCompleteCallback.call();
			_engineStage = starling.stage;
		}
		
		/**
		 * 
		 */
		private function initNape():void
		{
			//_space = new Space(new Vec2(0, 5));
			//addEventListener(Event.ENTER_FRAME, loop);
		}
		
		/**
		 * 
		 * @param	e
		 */
		public function loop(e:Event):void
		{
			_space.step(1 / 60);
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
		public function requestLayer(name:String):EngineLayer
		{
			return new EngineLayer(name);
		}
		
		/**
		 * 
		 * @param	newState
		 * @param	transitionEffect
		 */
		public function tranzitionToState(newState:IAbstractState, transitionEffect:IAbstractStateTransition = null):void
		{
			if (transitionEffect != null)
			{
				transitionEffect.injectOnTransitionComplete(tranzitionToStateComplete);
				futureState = newState as IState;
				transitionEffect.doTransition(state as IAbstractDisplayObject, futureState as IAbstractDisplayObject);
			}
			else
			{
				_currentState = newState as EngineState;
				state = _currentState;
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
			_currentState = futureState as EngineState;
			state = _currentState;
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
		
		/**
		 * 
		 */
		public function initLayers(inputLayers:Dictionary, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut = null):void
		{
			_layers = inputLayers;
			
			var orderedLayers:Vector.<EngineLayer> = new Vector.<EngineLayer>();
			
			for (var k:Object in _layers) 
			{
				var child:EngineLayer = _layers[k] as EngineLayer;
				orderedLayers.push(child);
			}
			
			orderedLayers.sort(sortDepths);
			
			for (var j:uint = 0; j < orderedLayers.length; j++ )
			{
				if (_currentState.getChildByName(orderedLayers[j].name) == null)
				{
					trace("add "+orderedLayers[j].name);
					_currentState.addChildAt(orderedLayers[j], j);
					
					if (inTransition != null)
					{
						inTransition.injectOnTransitionComplete(tranzitionToLayerInComplete);
						inTransition.doTransition(orderedLayers[j] as EngineLayer, null);
					}
				}
			}
		}
		
		/**
		 * 
		 * @param	a
		 * @param	b
		 * @return
		 */
		private function sortDepths(a:EngineLayer, b:EngineLayer):int
		{
			var depth1:uint = (a as EngineLayer).layerDepth;
			var depth2:uint = (b as EngineLayer).layerDepth;
			
			if (depth1 < depth2) 
			{ 
				return -1; 
			} 
			else if (depth1 > depth2) 
			{ 
				return 1; 
			} 
			else 
			{ 
				return 0; 
			} 
		}
		
		/**
		 * 
		 * @param	inLayers
		 * @param	outLayers
		 */
		public function updateLayers(inLayers:Vector.<IAbstractLayer> = null, outLayers:Vector.<IAbstractLayer> = null, inTransition:IAbstractLayerTransitionIn = null, outTransition:IAbstractLayerTransitionOut = null ):void
		{
			if (inLayers != null)
			{
				for (var i:uint = 0; i < inLayers.length; i++ )
				{
					insertLayerInDictionary(inLayers[i]);
				}
			}
			
			if (outLayers != null)
			{
				for (var j:uint = 0; j < outLayers.length; j++ )
				{
					removeLayerFromDictionary(outLayers[j]);
					_currentState.removeChild(outLayers[j] as EngineLayer);
					
					if (outTransition != null)
					{
						outTransition.injectOnTransitionComplete(tranzitionToLayerOutComplete);
						outTransition.doTransition(outLayers[j] as EngineLayer, null);
					}
				}
			}
			
			initLayers(_layers, inTransition, outTransition);
		}
		
		/**
		 * 
		 */
		public function tranzitionToLayerInComplete():void
		{
			
		}
		
		/**
		 * 
		 */
		public function tranzitionToLayerOutComplete():void
		{
			
		}
		
		/**
		 * 
		 * @param	layer
		 */
		private function insertLayerInDictionary(layer:IAbstractLayer):void
		{
			var alreadyExisting:Boolean = false;
			
			for (var k:Object in _layers) 
			{
				var child:IAbstractLayer = _layers[k] as IAbstractLayer;
				if (child.layerName == layer.layerName)
				{
					alreadyExisting = true;
				}
			}
			
			if (!alreadyExisting)
			{
				_layers[layer.layerName] = layer;
			}
		}
		
		/**
		 * 
		 * @param	layer
		 */
		private function removeLayerFromDictionary(layer:IAbstractLayer):void
		{
			for (var k:Object in _layers) 
			{
				var child:IAbstractLayer = _layers[k] as IAbstractLayer;
				if (child.layerName == layer.layerName)
				{
					delete _layers[layer.layerName];
				}
			}
		}
		
		/**
		 * 
		 */
		public function get layers():Dictionary
		{
			return _layers
		}
		
		/**
		 * 
		 * @param	layer1
		 * @param	layer2
		 */
		public function swapLayers(layer1:IAbstractLayer, layer2:IAbstractLayer):void
		{
			_currentState.swapChildren(layer1 as DisplayObject, layer2 as DisplayObject);
		}
		
	}
	
}