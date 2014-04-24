package  
{
	import abstract.AbstractPool;
	import away3d.controllers.SpringController;
	import bridge.abstract.events.IAbstractEvent;
	import bridge.abstract.IAbstractDisplayObject;
	import bridge.abstract.IAbstractEngineLayerProxy;
	import bridge.abstract.IAbstractImage;
	import bridge.abstract.IAbstractLayer;
	import bridge.abstract.IAbstractMovie;
	import bridge.abstract.IAbstractSprite;
	import bridge.abstract.IAbstractState;
	import bridge.abstract.IAbstractTexture;
	import bridge.abstract.IAbstractVideo;
	import bridge.abstract.transitions.IAbstractLayerTransitionIn;
	import bridge.abstract.transitions.IAbstractLayerTransitionOut;
	import bridge.abstract.transitions.IAbstractStateTransition;
	import bridge.abstract.ui.IAbstractButton;
	import bridge.BridgeGraphics;
	import bridge.IBridgeGraphics;
	import citrus.core.starling.StarlingCitrusEngine;
	import com.greensock.TweenLite;
	import feathers.controls.Button;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.geom.Rectangle;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import nape.space.Space;
	import signals.Signals;
	import signals.SignalsHub;
	import starling.animation.Juggler;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import starlingEngine.elements.EngineLayer;
	import starlingEngine.elements.EngineLayerProxy;
	import starlingEngine.elements.EngineTexture;
	import starlingEngine.elements.EngineVideo;
	import starlingEngine.events.EngineEvent;
	import starlingEngine.StarlingEngine;
	import starlingEngine.transitions.EngineLayerTransitionIn;
	import starlingEngine.transitions.EngineLayerTransitionOut;
	import starlingEngine.transitions.EngineStateTransition;
	import starlingEngine.ui.EngineButton;
	import starlingEngine.video.display.Video;
	import starlingEngine.video.events.VideoEvent;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class test extends Sprite
	{	
		private var _bridgeGraphics:IBridgeGraphics = new BridgeGraphics(
																		StarlingEngine,
																		starling.utils.AssetManager,
																		signals.SignalsHub,
																		abstract.AbstractPool,
																		starling.animation.Juggler,
																		nape.space.Space
																		);
		
		public function test() 
		{	
			var btn:Sprite = new Sprite();
			btn.graphics.beginFill(0x000000);
			btn.graphics.drawRect(10, 50, 20, 20);
			btn.graphics.endFill();
			addChild(btn);
			btn.addEventListener(MouseEvent.CLICK, doStuff);
			addChild(_bridgeGraphics.engine as DisplayObject);
		}
		
		private function doStuff(e:MouseEvent):void
		{
			loadAssets();
		}
		
		private function loadAssets():void
		{
			(_bridgeGraphics.assetsManager).enqueue("../bin/assets/spritesheets/spriteSheetBackgrounds.png", 
													"../bin/assets/spritesheets/spriteSheetBackgrounds.xml",
													"../bin/assets/spritesheets/spriteSheetElements.png",
													"../bin/assets/spritesheets/spriteSheetElements.xml",
													"../bin/assets/spritesheets/spriteSheetElements.xml",
													"../bin/assets/spritesheets/spriteSheetPayTable.xml"
													);
			
			(_bridgeGraphics.assetsManager).loadQueue(function(ratio:Number):void
				{
					trace("Loading assets, progress:", ratio);
					if (ratio == 1)
					{	
						//showThings();
						buildUI();
					}
				});
		}
		
		private function buildUI():void
		{
			var uiHolder:IAbstractSprite = _bridgeGraphics.requestSprite();
			_bridgeGraphics.addChild(uiHolder);
			
			var button:EngineButton = new EngineButton();
			button.downSkin_ = _bridgeGraphics.requestImage("Spin-Button-Down") as IAbstractDisplayObject;
			button.upSkin_ = _bridgeGraphics.requestImage("Spin-Button") as IAbstractDisplayObject;
			button.hoverSkin_ = _bridgeGraphics.requestImage("Spin-Button-Hover") as IAbstractDisplayObject;
			button.useHandCursor = true;
			
			button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
			
			uiHolder.addNewChild(button as IAbstractDisplayObject);
		}
		
		private function button_triggeredHandler(e:Event):void
		{
			showThings();
		}
		
		private function showThings():void
		{
			var sprite:IAbstractSprite = _bridgeGraphics.requestSprite();
			_bridgeGraphics.addChild(sprite)
						
			var img:IAbstractImage = _bridgeGraphics.requestImage("Background");
			sprite.addNewChild(img);
			img.x = 150
						
			var mc:IAbstractMovie = _bridgeGraphics.requestMovie("Bet", 30);
			mc.x = 0;
			mc.y = 0;
						
			sprite.x = 150;
			sprite.y = 150;
			sprite.rotation = .1;
			_bridgeGraphics.defaultJuggler.add(mc);
						
			var layersProxy:IAbstractEngineLayerProxy = new EngineLayerProxy();
			layersProxy.addLayer("Layer 1", 0);
			layersProxy.addLayer("Layer 2", 1);
			layersProxy.addLayer("Layer 3", 2);
			layersProxy.addLayer("Layer 4", 3);
						
			layersProxy.retrieveLayer("Layer 3").addNewChild(mc);
						
			_bridgeGraphics.initLayers(layersProxy.layers);
						
			var transIn:IAbstractLayerTransitionIn = new EngineLayerTransitionIn();
			var transOut:IAbstractLayerTransitionOut = new EngineLayerTransitionOut();
						
			var outLayers:Vector.<IAbstractLayer> = new Vector.<IAbstractLayer>;
			outLayers.push(layersProxy.retrieveLayer("Layer 2"));
						
			var newLayer:IAbstractLayer = new EngineLayer("Tzeapa", 0);
			newLayer.addNewChild(_bridgeGraphics.requestImage("Preloader-Background"));
						
			var inLayers:Vector.<IAbstractLayer> = new Vector.<IAbstractLayer>;
			inLayers.push(newLayer);
						
			_bridgeGraphics.updateLayers(inLayers, null, transIn, transOut);
						
			var state2:IAbstractState = _bridgeGraphics.requestState();
			var stateTransition:IAbstractStateTransition = new EngineStateTransition();
			_bridgeGraphics.tranzitionToState(state2, stateTransition);
				
			var video:IAbstractVideo = new EngineVideo();
			video.addVideoPath("../bin/assets/test.flv");
			state2.addNewChild(video);
			
		}
		
	}

}