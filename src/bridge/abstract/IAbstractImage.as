package bridge.abstract 
{
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	/**
	 * An Image is a quad with a texture mapped onto it.
	 * 
	 *   <p>The Image class is the Engine equivalent of Flash's Bitmap class. Instead of 
	 * BitmapData, Engine uses textures to represent the pixels of an image. To display a 
	 * texture, you have to map it onto a quad - and that's what the Image class is for.</p><p>As "Image" inherits from "Quad", you can give it a color. For each pixel, the resulting  
	 * color will be the result of the multiplication of the color of the texture with the color of 
	 * the quad. That way, you can easily tint textures with a certain color. Furthermore, images 
	 * allow the manipulation of texture coordinates. That way, you can move a texture inside an 
	 * image without changing any vertex coordinates of the quad. You can also use this feature
	 * as a very efficient way to create a rectangular mask.</p>
	 */
	public interface IAbstractImage extends IAbstractDisplayObject
	{
		
	}
	
}