package starlingEngine
{
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class StarlingEngineClassDefinitions 
	{
		
		public static const IMAGE:String = "imageDefinition";
		public static const MOVIE_CLIP:String = "movieClipDefinition";
		
		private var _engineClassDefinitions:Dictionary = new Dictionary();
		
		public function StarlingEngineClassDefinitions() 
		{
			_engineClassDefinitions[IMAGE] = getDefinitionByName("starling.display.Image") as Class;
			_engineClassDefinitions[MOVIE_CLIP] = getDefinitionByName("starling.display.MovieClip") as Class;
		}
		
		public function getClassDefinitionByName(name:String):Class
		{
			return _engineClassDefinitions[name]
		}
		
	}

}