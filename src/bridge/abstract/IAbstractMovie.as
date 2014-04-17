package bridge.abstract 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractMovie extends IAbstractDisplayObject
	{
		function get currentFrame () : int;
		function set currentFrame (value:int) : void;
		function get currentTime () : Number;

		function get fps () : Number;
		function set fps (value:Number) : void;

		function get isComplete () : Boolean;

		function get isPlaying () : Boolean;

		function get loop () : Boolean;
		function set loop (value:Boolean) : void;
		
		function get numFrames () : int;

		function get totalTime () : Number;

		function addNewFrame(texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void

		function addNewFrameAt(frameID:uint, texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void

		function advanceTime (passedTime:Number) : void;

		function getFrameDuration (frameID:int) : Number;

		function getFrameSound (frameID:int) : Sound;

		function getTextureFromFrame(frameID:uint):IAbstractTexture
		
		function pause () : void;

		function play () : void;

		function removeFrameAt (frameID:int) : void;

		function setFrameDuration (frameID:int, duration:Number) : void;

		function setFrameSound (frameID:int, sound:Sound) : void;

		function setTextureToFrame(frameID:uint, texture:IAbstractTexture):void

		function stop () : void;
	}
	
}