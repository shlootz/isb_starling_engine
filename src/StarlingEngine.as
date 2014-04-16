package 
{
	import abstract.AbstractPool;
	import bridge.BridgeGraphics;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.core.starling.ViewportMode;
	import flash.events.Event;
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
	import starling.display.Stage;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class StarlingEngine extends StarlingCitrusEngine 
	{		
		private var _initCompleteCallback:Function;
		
		public var engineStage:Stage;
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
		 * @param	e
		 */
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
		}
		
		private function initEngine():void
		{
			setUpStarling(true);
		}
		
		/**
		 * 
		 */
		override public function handleStarlingReady():void
		{ 
			initNape();
			_initCompleteCallback.call();
			engineStage = starling.stage;
			//_bridgeGraphics.juggler = _starling.juggler;
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
		private function loop(e:Event):void
		{
			//_bridgeGraphics.space.step(1 / 60);
		}
		
		/**
		 * 
		 */
		public function get graphicsBridge():BridgeGraphics
		{
			//return _bridgeGraphics;
			return null
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
		
		public function requestImage(texture:Texture):Image
		{
			var i:Image = new Image(texture);
			return i;
		}
		
		public function requestMovie(textures:Vector.<Texture>, fps:uint = 24):Image
		{
			var m:MovieClip = new MovieClip(textures, fps);
			return m;
		}
		
		
	}
	
}