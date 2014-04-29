package starlingEngine
{
	import abstract.AbstractPool;
	import bridge.abstract.IAbstractDisplayObject;
	import bridge.abstract.IAbstractEngineLayerVO;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.IAbstractMovie;
	import bridge.abstract.IAbstractSprite;
	import bridge.abstract.IAbstractState;
	import bridge.abstract.IAbstractTexture;
	import bridge.abstract.IAbstractTextField;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import bridge.abstract.ui.IAbstractButton;
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
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starlingEngine.elements.EngineImage;
	import starlingEngine.elements.EngineLayer;
	import starlingEngine.elements.EngineLayerLayoutElementVo;
	import starlingEngine.elements.EngineLayerVO;
	import starlingEngine.elements.EngineMovie;
	import starlingEngine.elements.EngineSprite;
	import starlingEngine.elements.EngineState;
	import starlingEngine.elements.EngineTextField;
	import starlingEngine.elements.EngineTexture;
	import starlingEngine.events.EngineEvent;
	import starlingEngine.ui.EngineButton;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class StarlingEngine extends StarlingCitrusEngine implements IEngine
	{		
		
		public static const ENGINE_IMAGE:String = "image";
		public static const ENGINE_MOVIE_CLIP:String = "movie";
		public static const ENGINE_FLV:String = "flv";
		public static const ENGINE_BUTTON:String = "button";
		
		private var _initCompleteCallback:Function;
		private var _engineStage:Stage;
		private var _layers:Dictionary = new Dictionary(true);
		private var _space:Space;
		private var _currentState:IAbstractState;
		private var _assetsManager:starling.utils.AssetManager;
		private var _signalsHub:SignalsHub;
		/**
		 * 
		 * @param	initCompleteCallback
		 * @param	baseWidth
		 * @param	baseHeight
		 * @param	viewportMode
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
		 * @param	assetsManager
		 */
		public function injectAssetsManager(assetsManager:Object):void
		{
			_assetsManager = assetsManager as starling.utils.AssetManager;
		}
		
		/**
		 * 
		 * @param	signalsHub
		 */
		public function injectSignalsHub(signalsHub:Object):void
		{
			_signalsHub = signalsHub as SignalsHub;
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
			state = _currentState as IState;
			
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
		 * @TODO this function still return null for some reason
		 * @param	name
		 * @return
		 */
		public function requestTexture(name:String ):IAbstractTexture
		{
			var t:IAbstractTexture = new EngineTexture() as IAbstractTexture;
			t = _assetsManager.getTexture(name) as IAbstractTexture;
			return t as IAbstractTexture;
		}
		
		/**
		 * 
		 * @param	texture
		 * @return
		 */
		public function requestImage(texture:Texture):IAbstractImage
		{
			var i:IAbstractImage = new EngineImage(texture) as IAbstractImage;
			return i;
		}
		
		/**
		 * 
		 * @param	textures
		 * @param	fps
		 * @return
		 */
		public function requestMovie(textures:Vector.<Texture>, fps:uint = 24):IAbstractMovie
		{
			var m:IAbstractMovie = new EngineMovie(textures, fps) as IAbstractMovie;
			return m;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestSprite():IAbstractSprite
		{
			var s:IAbstractSprite = new EngineSprite() as IAbstractSprite;
			return s;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestButton():IAbstractButton
		{
			var b:IAbstractButton = new EngineButton();
			return b;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestState():IAbstractState
		{
			return new EngineState() as IAbstractState;
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
		 * @return
		 */
		public function requestTextField(width:int, height:int, text:String, fontName:String="Verdana", fontSize:Number=12, color:uint=0, bold:Boolean=false):IAbstractTextField
		{
			var t:IAbstractTextField = new EngineTextField(width, height, text, fontName, fontSize, color, bold) as IAbstractTextField;
			return t;
		}
		
		/**
		 * 
		 * @return
		 */
		public function requestLayersVO():IAbstractEngineLayerVO
		{
			return new EngineLayerVO();
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
				state = _currentState as IState;
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
			state = _currentState as IState;
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
				if (_currentState.getChildByNameStr(orderedLayers[j].name) == null)
				{
					if (orderedLayers[j].addToStage)
					{
						_currentState.addNewChildAt(orderedLayers[j], j);
						drawLayerLayout(orderedLayers[j]);
						
						if (inTransition != null)
						{
							inTransition.injectOnTransitionComplete(tranzitionToLayerInComplete);
							inTransition.doTransition(orderedLayers[j] as EngineLayer, null);
						}
						else
						{
							tranzitionToLayerInComplete();
						}
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
		private function sortDepths(a:Object, b:Object):int
		{
			var depth1:uint = (a as Object).layerDepth;
			var depth2:uint = (b as Object).layerDepth;
			
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
					_currentState.removeChildAndDispose(outLayers[j] as EngineLayer);
					
					if (outTransition != null)
					{
						outTransition.injectOnTransitionComplete(tranzitionToLayerOutComplete);
						outTransition.doTransition(outLayers[j] as EngineLayer, null);
					}
					else
					{
						tranzitionToLayerOutComplete();
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
		 * @param	layer
		 */
		private function drawLayerLayout(layer:IAbstractLayer):void
		{
			var layoutDict:Dictionary = layer.layout;
			var layerElements:Vector.<EngineLayerLayoutElementVo> = new Vector.<EngineLayerLayoutElementVo>();
			
			for (var key:String in layoutDict)
			{
				layerElements.push(layoutDict[key] as EngineLayerLayoutElementVo);
			}
			
			layerElements.sort(sortDepths);
			
			if (layerElements.length > 0)
			{
				autoAddItems(layer, layerElements);
			}
		}
		
		/** @TODO width and height from layout. Currently it is commented below.
		 * 
		 * @param	layer
		 * @param	sortedElements
		 */
		private function autoAddItems(layer:IAbstractLayer, sortedElements:Vector.<EngineLayerLayoutElementVo>): void
		{
			for (var i:uint = 0; i < sortedElements.length; i++ )
			{
				switch (sortedElements[i].type) 
				{
					case ENGINE_IMAGE:
						var img:IAbstractImage = requestImage(_assetsManager.getTexture(sortedElements[i].name));
						layer.addNewChildAt(img, i);
						img.x = Number(sortedElements[i].x);
						img.y = Number(sortedElements[i].y);
						//img.width = Number(sortedElements[i].width);
						//img.height = Number(sortedElements[i].height);
						break;
						
					case ENGINE_BUTTON:
						var btn:IAbstractButton = requestButton();
						//var upSkin:IAbstractImage = requestImage(_assetsManager.getTexture(sortedElements[i].name));
						var upSkin:IAbstractMovie = requestMovie(_assetsManager.getTextures(sortedElements[i].name), sortedElements[i].fps);
						btn.idName = sortedElements[i].name;
						btn.upSkin_ = upSkin;
						
						layer.addNewChildAt(btn, i);
						btn.x = Number(sortedElements[i].x);
						btn.y = Number(sortedElements[i].y);
						//btn.width = Number(sortedElements[i].width);
						//btn.height = Number(sortedElements[i].height);
						(btn as IAbstractButton).addEventListener(EngineEvent.TRIGGERED, button_triggeredHandler);
						
						break;
						
					case ENGINE_MOVIE_CLIP:
						break;
						
					case ENGINE_FLV:
						break;
					default:
						break;
				}
			}
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function button_triggeredHandler(e:Object):void
		{
			_signalsHub.dispatchSignal(Signals.GENERIC_BUTTON_PRESSED, (e.currentTarget as EngineButton).idName, e);
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
			_currentState.swapChildrenF(layer1 as IAbstractLayer, layer2 as IAbstractLayer);
		}
		
		/**
		 * 
		 */
		public function cleanUp():void
		{
			_initCompleteCallback = null;
			_engineStage = null;
			
			for (var k:String in _layers)
			{
				_layers[k] = null
			}
			
			_layers = null;
			_space = null;
			_currentState = null; 
			_assetsManager = null;
			_signalsHub = null;
			
			state.destroy();
			if (futureState != null)
			{
				futureState.destroy();
			}
			
			super.destroy();
			
			trace(this + " -> destroyed");
		}
		
	}
	
}