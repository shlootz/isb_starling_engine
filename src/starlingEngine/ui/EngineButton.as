package starlingEngine.ui 
{
	import bridge.abstract.ui.IAbstractButton;
	import feathers.controls.Button;
	import starling.display.DisplayObject;
	import starling.events.Event;
	/**
	 * ...
	 * @author Alex Popescu
	 */
	public class EngineButton extends Button implements IAbstractButton
	{
		
		public function EngineButton() 
		{
			super();
		}
		
		override public function get autoFlatten () : Boolean
		{
			return super.autoFlatten;
		}
		override public function set autoFlatten (value:Boolean) : void
		{
			super.autoFlatten = value;
		}

		override protected function get currentState () : String
		{
			return super.currentState;
		}
		override protected function set currentState (value:String) : void
		{
			super.currentState = value;
		}

		override public function get defaultIcon () : DisplayObject
		{
			return super.defaultIcon;
		}
		override public function set defaultIcon (value:DisplayObject) : void
		{
			super.defaultIcon = value;
		}

		override public function get defaultLabelProperties () : Object
		{
			return super.defaultLabelProperties;
		}
		override public function set defaultLabelProperties (value:Object) : void
		{
			super.defaultLabelProperties = value;
		}

		override public function get defaultSelectedIcon () : DisplayObject
		{
			return super.defaultSelectedIcon;
		}
		override public function set defaultSelectedIcon (value:DisplayObject) : void
		{
			super.defaultSelectedIcon = value;
		}

		override public function get defaultSelectedLabelProperties () : Object
		{
			return super.defaultSelectedLabelProperties;
		}
		override public function set defaultSelectedLabelProperties (value:Object) : void
		{
			super.defaultSelectedLabelProperties = value;
		}

		override public function get defaultSelectedSkin () : DisplayObject
		{
			return super.defaultSelectedSkin;
		}
		override public function set defaultSelectedSkin (value:DisplayObject) : void
		{
			super.defaultSelectedSkin = value;
		}

		override public function get defaultSkin () : DisplayObject
		{
			return super.defaultSkin;
		}
		override public function set defaultSkin (value:DisplayObject) : void
		{
			super.defaultSkin = value;
		}

		override public function get disabledIcon () : DisplayObject
		{
			return super.disabledIcon;
		}
		override public function set disabledIcon (value:DisplayObject) : void
		{
			super.disabledIcon = value;
		}

		override public function get disabledLabelProperties () : Object
		{
			return super.disabledLabelProperties;
		}

		override public function get disabledSkin () : DisplayObject
		{
			return super.disabledSkin;
		}
		override public function set disabledSkin (value:DisplayObject) : void
		{
			super.disabledSkin = value;
		}

		override public function get downIcon () : DisplayObject
		{
			return super.downIcon;
		}
		override public function set downIcon (value:DisplayObject) : void
		{
			super.downIcon = value;
		}

		override public function get downLabelProperties () : Object
		{
			return super.downLabelProperties;
		}
		override public function set downLabelProperties (value:Object) : void
		{
			super.downLabelProperties = value;
		}

		override public function get downSkin () : DisplayObject
		{
			return super.downSkin;
		}
		override public function set downSkin (value:DisplayObject) : void
		{
			super.downSkin = value;
		}

		override public function get gap () : Number
		{
			return super.gap;
		}
		override public function set gap (value:Number) : void
		{
			super.gap = value;
		}

		override public function get horizontalAlign () : String
		{
			return super.horizontalAlign;
		}
		override public function set horizontalAlign (value:String) : void
		{
			super.horizontalAlign = value;
		}

		override public function get hoverIcon () : DisplayObject
		{
			return super.hoverIcon;
		}
		override public function set hoverIcon (value:DisplayObject) : void
		{
			super.hoverIcon = value;
		}

		override public function get hoverLabelProperties () : Object
		{
			return super.hoverLabelProperties;
		}
		override public function set hoverLabelProperties (value:Object) : void
		{
			super.hoverLabelProperties = value;
		}

		override public function get hoverSkin () : DisplayObject
		{
			return super.hoverSkin;
		}
		override public function set hoverSkin (value:DisplayObject) : void
		{
			super.hoverSkin = value;
		}

		override public function get iconOffsetX () : Number
		{
			return super.iconOffsetX;
		}
		override public function set iconOffsetX (value:Number) : void
		{
			super.iconOffsetX = value;
		}

		override public function get iconOffsetY () : Number
		{
			return super.iconOffsetY;
		}
		override public function set iconOffsetY (value:Number) : void
		{
			super.iconOffsetY = value;
		}

		override public function get iconPosition () : String
		{
			return super.iconPosition;
		}
		override public function set iconPosition (value:String) : void
		{
			super.iconPosition = value;
		}

		override public function set isEnabled (value:Boolean) : void
		{
			super.isEnabled = value;
		}

		override public function get isLongPressEnabled () : Boolean
		{
			return super.isLongPressEnabled;
		}
		override public function set isLongPressEnabled (value:Boolean) : void
		{
			super.isLongPressEnabled = value;
		}

		override public function get isSelected () : Boolean
		{
			return super.isSelected;
		}
		override public function set isSelected (value:Boolean) : void
		{
			super.isSelected = value;
		}

		override public function get isToggle () : Boolean
		{
			return super.isToggle;
		}
		override public function set isToggle (value:Boolean) : void
		{
			super.isToggle = value;
		}

		override public function get label () : String
		{
			return super.label;
		}
		override public function set label (value:String) : void
		{
			super.label = value;
		}

		override public function get labelFactory () : Function
		{
			return super.labelFactory;
		}
		override public function set labelFactory (value:Function) : void
		{
			super.labelFactory = value;
		}

		override public function get labelOffsetX () : Number
		{
			return super.labelOffsetX;
		}
		override public function set labelOffsetX (value:Number) : void
		{
			super.labelOffsetX = value;
		}

		override public function get labelOffsetY () : Number
		{
			return super.labelOffsetY;
		}
		override public function set labelOffsetY (value:Number) : void
		{
			super.labelOffsetY = value;
		}

		override public function get longPressDuration () : Number
		{
			return super.longPressDuration;
		}
		override public function set longPressDuration (value:Number) : void
		{
			super.longPressDuration = value;
		}

		override public function get padding () : Number
		{
			return super.padding;
		}
		override public function set padding (value:Number) : void
		{
			super.padding = value;
		}

		override public function get paddingBottom () : Number
		{
			return super.paddingBottom;
		}
		override public function set paddingBottom (value:Number) : void
		{
			super.paddingBottom = value;
		}

		override public function get paddingLeft () : Number
		{
			return super.paddingLeft;
		}
		override public function set paddingLeft (value:Number) : void
		{
			super.paddingLeft = value;
		}

		override public function get paddingRight () : Number
		{
			return super.paddingRight;
		}
		override public function set paddingRight (value:Number) : void
		{
			super.paddingRight = value;
		}

		override public function get paddingTop () : Number
		{
			return super.paddingTop;
		}
		override public function set paddingTop (value:Number) : void
		{
			super.paddingTop = value;
		}

		override public function get selectedDisabledIcon () : DisplayObject
		{
			return super.selectedDisabledIcon;
		}
		override public function set selectedDisabledIcon (value:DisplayObject) : void
		{
			super.selectedDisabledIcon = value;
		}

		override public function get selectedDisabledLabelProperties () : Object
		{
			return super.selectedDisabledLabelProperties;
		}
		override public function set selectedDisabledLabelProperties (value:Object) : void
		{
			super.selectedDisabledLabelProperties = value;
		}

		override public function get selectedDisabledSkin () : DisplayObject
		{
			return super.selectedDisabledSkin;
		}
		override public function set selectedDisabledSkin (value:DisplayObject) : void
		{
			super.selectedDisabledSkin = value;
		}

		override public function get selectedDownIcon () : DisplayObject
		{
			return super.selectedDownIcon;
		}
		override public function set selectedDownIcon (value:DisplayObject) : void
		{
			super.selectedDownIcon = value;
		}

		override public function get selectedDownLabelProperties () : Object
		{
			return super.selectedDownLabelProperties;
		}
		override public function set selectedDownLabelProperties (value:Object) : void
		{
			super.selectedDownLabelProperties = value;
		}

		override public function get selectedDownSkin () : DisplayObject
		{
			return super.selectedDownSkin;
		}
		override public function set selectedDownSkin (value:DisplayObject) : void
		{
			super.selectedDownSkin = value;
		}

		override public function get selectedHoverIcon () : DisplayObject
		{
			return super.selectedHoverIcon;
		}
		override public function set selectedHoverIcon (value:DisplayObject) : void
		{
			super.selectedHoverIcon = value;
		}

		override public function get selectedHoverLabelProperties () : Object
		{
			return super.selectedHoverLabelProperties;
		}
		override public function set selectedHoverLabelProperties (value:Object) : void
		{
			super.selectedHoverLabelProperties = value;
		}

		override public function get selectedHoverSkin () : DisplayObject
		{
			return super.selectedHoverSkin;
		}
		override public function set selectedHoverSkin (value:DisplayObject) : void
		{
			super.selectedHoverSkin = value;
		}

		override public function get selectedUpIcon () : DisplayObject
		{
			return super.selectedUpIcon;
		}
		override public function set selectedUpIcon (value:DisplayObject) : void
		{
			super.selectedUpIcon = value;
		}

		override public function get selectedUpLabelProperties () : Object
		{
			return super.selectedUpLabelProperties;
		}
		override public function set selectedUpLabelProperties (value:Object) : void
		{
			super.selectedUpLabelProperties = value;
		}

		override public function get selectedUpSkin () : DisplayObject
		{
			return super.selectedUpSkin;
		}
		override public function set selectedUpSkin (value:DisplayObject) : void
		{
			super.selectedUpSkin = value;
		}

		override protected function get stateNames () : Vector.<String>
		{
			return super.stateNames;
		}

		override public function get stateToIconFunction () : Function
		{
			return super.stateToIconFunction;
		}
		override public function set stateToIconFunction (value:Function) : void
		{
			super.stateToIconFunction = value;
		}

		override public function get stateToLabelPropertiesFunction () : Function
		{
			return super.stateToLabelPropertiesFunction;
		}
		override public function set stateToLabelPropertiesFunction (value:Function) : void
		{
			super.stateToLabelPropertiesFunction = value;
		}

		override public function get stateToSkinFunction () : Function
		{
			return super.stateToSkinFunction;
		}
		override public function set stateToSkinFunction (value:Function) : void
		{
			super.stateToSkinFunction = value;
		}

		override public function get upIcon () : DisplayObject
		{
			return super.upIcon;
		}
		override public function set upIcon (value:DisplayObject) : void
		{
			super.upIcon = value;
		}

		override public function get upLabelProperties () : Object
		{
			return super.upLabelProperties;
		}
		override public function set upLabelProperties (value:Object) : void
		{
			super.upLabelProperties = value;
		}

		override public function get upSkin () : DisplayObject
		{
			return super.upSkin;
		}
		override public function set upSkin (value:DisplayObject) : void
		{
			super.upSkin = value;
		}

		override public function get verticalAlign () : String
		{
			return super.verticalAlign;
		}
		override public function set verticalAlign (value:String) : void
		{
			super.verticalAlign = value;
		}

		override protected function autoSizeIfNeeded () : Boolean
		{
			return super.autoSizeIfNeeded();
		}

		override protected function button_removedFromStageHandler (event:Event) : void
		{
			super.button_removedFromStageHandler(event);
		}

		override protected function createLabel () : void
		{
			super.createLabel();
		}

		override protected function draw () : void
		{
			super.draw();
		}

		override protected function focusInHandler (event:Event) : void
		{
			super.focusInHandler(event);
		}

		override protected function focusOutHandler (event:Event) : void
		{
			super.focusOutHandler(event);
		}

		override protected function layoutContent () : void
		{
			super.layoutContent();
		}

		override protected function longPress_enterFrameHandler (event:Event) : void
		{
			super.longPress_enterFrameHandler(event);
		}

		override protected function positionLabelAndIcon () : void
		{
			super.positionLabelAndIcon();
		}

		override protected function positionSingleChild (displayObject:DisplayObject) : void
		{
			super.positionSingleChild(displayObject);
		}

		override protected function refreshIcon () : void
		{
			super.refreshIcon();
		}

		override protected function refreshLabel () : void
		{
			super.refreshLabel();
		}

		override protected function refreshLabelStyles () : void
		{
			super.refreshLabelStyles();
		}

		override protected function refreshMaxLabelWidth (forMeasurement:Boolean) : void
		{
			super.refreshMaxLabelWidth(forMeasurement);
		}

		override protected function refreshSkin () : void
		{
			super.refreshSkin();
		}

		override protected function scaleSkin () : void
		{
			super.scaleSkin();
		}
		
	}

}