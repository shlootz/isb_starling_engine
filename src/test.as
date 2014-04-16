package  
{
	import abstract.AbstractPool;
	import bridge.BridgeGraphics;
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import nape.space.Space;
	import signals.Signals;
	import signals.SignalsHub;
	import starling.animation.Juggler;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class test extends Sprite
	{
		private var _graphicsContainer:Sprite = new Sprite();
		private var _bridgeGraphics:BridgeGraphics = new BridgeGraphics(
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
			//_bridgeGraphics.start();
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
						//_bridgeGraphics.signalsManager.dispatchSignal(Signals.CHANGE_GAME_STATE, "", AllStates.MAIN_MENU_STATE);
						//trace(_bridgeGraphics.requestImage("Jackpot-Icon"));
						trace(_bridgeGraphics.requestMovie("Bet"));
						//_bridgeGraphics.display.addChild(_bridgeGraphics.requestMovie("Bet"));
						_bridgeGraphics.addChild(_bridgeGraphics.requestImage("Jackpot-Icon"))
						//trace(_bridgeGraphics.display);
					}
				});
		}
		
	}

}