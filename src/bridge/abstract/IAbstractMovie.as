package bridge.abstract 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractMovie extends IAbstractDisplayObject
	{
		/**
		 * 
		 */
		function get currentFrame () : int;
		/**
		 * 
		 */
		function set currentFrame (value:int) : void;
		/**
		 * 
		 */
		function get currentTime () : Number;
		/**
		 * 
		 */
		function get fps () : Number;
		/**
		 * 
		 */
		function set fps (value:Number) : void;
		/**
		 * 
		 */
		function get isComplete () : Boolean;
		/**
		 * 
		 */
		function get isPlaying () : Boolean;
		/**
		 * 
		 */
		function get loop () : Boolean;
		/**
		 * 
		 */
		function set loop (value:Boolean) : void;
		/**
		 * 
		 */
		function get numFrames () : int;
		/**
		 * 
		 */
		function get totalTime () : Number;
		/**
		 * 
		 * @param	texture
		 * @param	sound
		 * @param	duration
		 */
		function addNewFrame(texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void
		/**
		 * 
		 * @param	frameID
		 * @param	texture
		 * @param	sound
		 * @param	duration
		 */
		function addNewFrameAt(frameID:uint, texture:IAbstractTexture, sound:Sound = null, duration:Number = -1):void
		/**
		 * 
		 * @param	passedTime
		 */
		function advanceTime (passedTime:Number) : void;
		/**
		 * 
		 * @param	frameID
		 * @return
		 */
		function getFrameDuration (frameID:int) : Number;
		/**
		 * 
		 * @param	frameID
		 * @return
		 */
		function getFrameSound (frameID:int) : Sound;
		/**
		 * 
		 * @param	frameID
		 * @return
		 */
		function getTextureFromFrame(frameID:uint):IAbstractTexture
		/**
		 * 
		 */
		function pause () : void;
		/**
		 * 
		 */
		function play () : void;
		/**
		 * 
		 * @param	frameID
		 */
		function removeFrameAt (frameID:int) : void;
		/**
		 * 
		 * @param	frameID
		 * @param	duration
		 */
		function setFrameDuration (frameID:int, duration:Number) : void;
		/**
		 * 
		 * @param	frameID
		 * @param	sound
		 */
		function setFrameSound (frameID:int, sound:Sound) : void;
		/**
		 * 
		 * @param	frameID
		 * @param	texture
		 */
		function setTextureToFrame(frameID:uint, texture:IAbstractTexture):void
		/**
		 * 
		 */
		function stop () : void;
	}
	
}