package bridge.abstract 
{
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractTexture 
	{
		//function get base () : TextureBase;
//
		//function get format () : String;
//
		/**
		 * 
		 */
		function get frame () : Rectangle;
//
		/**
		 * 
		 */
		function get height () : Number;
//
		/**
		 * 
		 */
		function get mipMapping () : Boolean;
//
		/**
		 * 
		 */
		function get nativeHeight () : Number;
//
		/**
		 * 
		 */
		function get nativeWidth () : Number;
//
		/**
		 * 
		 */
		function get premultipliedAlpha () : Boolean;
//
		/**
		 * 
		 */
		function get repeat () : Boolean;
		/**
		 * 
		 */
		function set repeat (value:Boolean) : void;
//
		/**
		 * 
		 */
		function get scale () : Number;
//
		/**
		 * 
		 */
		function get width () : Number;
//
		/**
		 * 
		 * @param	texCoords
		 * @param	startIndex
		 * @param	stride
		 * @param	count
		 */
		function adjustTexCoords (texCoords:Vector.<Number>, startIndex:int=0, stride:int=0, count:int=-1) : void;
//
		/**
		 * 
		 */
		function dispose () : void;

	}
	
}