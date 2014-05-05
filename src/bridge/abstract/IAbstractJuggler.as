package bridge.abstract 
{
	
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public interface IAbstractJuggler 
	{
		/// The total life time of the juggler (in seconds).
		public function get elapsedTime () : Number;

		/// Adds an object to the juggler.
		public function add (object:IAnimatable) : void;

		/// Advances all objects by a certain time (in seconds).
		public function advanceTime (time:Number) : void;

		/// Determines if an object has been added to the juggler.
		public function contains (object:IAnimatable) : Boolean;

		/// Figures out if the juggler contains one or more tweens with a certain target.
		public function containsTweens (target:Object) : Boolean;

		/**
		 * Delays the execution of a function until delay seconds have passed.
		 * Creates an object of type 'DelayedCall' internally and returns it. Remove that object
		 * from the juggler to cancel the function call.
		 */
		public function delayCall (call:Function, delay:Number, ...rest) : starling.animation.DelayedCall;

		/// Removes all objects at once.
		public function purge () : void;

		/// Removes an object from the juggler.
		public function remove (object:IAnimatable) : void;

		/// Removes all tweens with a certain target.
		public function removeTweens (target:Object) : void;

		/**
		 * Utilizes a tween to animate the target object over time seconds. Internally,
		 * this method uses a tween instance (taken from an object pool) that is added to the
		 * juggler right away. This method provides a convenient alternative for creating 
		 * and adding a tween manually.
		 * 
		 *   Fill 'properties' with key-value pairs that describe both the 
		 * tween and the animation target. Here is an example:
		 * juggler.tween(object, 2.0, {
		 * transition: Transitions.EASE_IN_OUT,
		 * delay: 20, // -> tween.delay = 20
		 * x: 50      // -> tween.animate("x", 50)
		 * });
		 */
		public function tween (target:Object, time:Number, properties:Object) : void;
	}
	
}