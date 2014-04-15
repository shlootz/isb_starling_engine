package 
{
	import abstract.AbstractPool;
	import bridge.BridgeGraphics;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.core.starling.ViewportMode;
	import feathers.themes.MetalWorksMobileTheme;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
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
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import states.AllStates;
	import states.menuStates.MainMenuState;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class Main extends StarlingCitrusEngine 
	{
		public static var space:Space;
		
		public static var _bridgeGraphics:BridgeGraphics = new BridgeGraphics(
																		starling.utils.AssetManager,
																		signals.SignalsHub,
																		abstract.AbstractPool,
																		starling.animation.Juggler,
																		nape.space.Space
																		);
		
		/**
		 * 
		 */
		public function Main():void 
		{
			_baseWidth = 800;
			_baseHeight = 600;
			_viewportMode = ViewportMode.FULLSCREEN;
			_assetSizes = [1, 1.5, 2, 4, 5];
		}
		
		/**
		 * 
		 * @param	e
		 */
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			initSignals();
			initStarling();
		}		
		
		/**
		 * 
		 * @param	e
		 */
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
		}
		
		/**
		 * 
		 */
		private function initNape():void
		{
			_bridgeGraphics.space = new Space(new Vec2(0, 5));
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		/**
		 * 
		 */
		private function initState():void
		{
			state = new AllStates.LOADING_STATE;
		}
		
		/**
		 * 
		 */
		private function initStarling():void
		{
			setUpStarling(true);
		}
		
		/**
		 * 
		 */
		private function initSignals():void
		{
			var mainListenersVector:Vector.<Function> = new Vector.<Function>;
			mainListenersVector.push(changeState);
			
			(_bridgeGraphics.signalsManager as SignalsHub).addSignal(Signals.CHANGE_GAME_STATE, new Signal(), mainListenersVector);
		}
		
		/**
		 * 
		 */
		override public function handleStarlingReady():void
		{ 
			initState();
			initNape();
			
			(_bridgeGraphics.assetsManager as starling.utils.AssetManager).enqueue("../bin/assets/spritesheets/spriteSheetBackgrounds.png", 
													"../bin/assets/spritesheets/spriteSheetBackgrounds.xml",
													"../bin/assets/spritesheets/spriteSheetElements.png",
													"../bin/assets/spritesheets/spriteSheetElements.xml",
													"../bin/assets/spritesheets/spriteSheetElements.xml",
													"../bin/assets/spritesheets/spriteSheetPayTable.xml"
													);
			
			(_bridgeGraphics.assetsManager as starling.utils.AssetManager).loadQueue(function(ratio:Number):void
				{
					trace("Loading assets, progress:", ratio);
					if (ratio == 1)
					{	
						new MetalWorksMobileTheme();
						//juggler = _starling.juggler;
						_bridgeGraphics.juggler = _starling.juggler;
						_bridgeGraphics.signalsManager.dispatchSignal(Signals.CHANGE_GAME_STATE, "", AllStates.MAIN_MENU_STATE);
					}
				});
		}
		
		/**
		 * 
		 * @param	e
		 */
		private function loop(e:Event):void
		{
			_bridgeGraphics.space.step(1 / 60);
		}
		
		/**
		 * 
		 * @param	signalId
		 * @param	newState
		 */
		private function changeState(signalId:String, newState:Class):void
		{
			state = new newState;
		}
	}
	
}