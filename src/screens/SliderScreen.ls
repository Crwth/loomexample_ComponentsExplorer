package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.PanelScreen;
	//SLIDER import feathers.controls.Slider;
	import feathers.events.FeathersEventType;
	import feathers.examples.componentsExplorer.data.SliderSettings;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;

	//STARLING import loom2d.core.Starling;
	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]
	[Event(name="showSettings",type="loom2d.events.Event")]

	public class SliderScreen extends PanelScreen
	{
		public static const SHOW_SETTINGS:String = "showSettings";

		public function SliderScreen()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		public var settings:SliderSettings;

		//SLIDER private var _slider:Slider;
		private var _backButton:Button;
		private var _settingsButton:Button;
		private var _valueLabel:Label;
		
		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//SLIDER this._slider = new Slider();
			//SLIDER this._slider.minimum = 0;
			//SLIDER this._slider.maximum = 100;
			//SLIDER this._slider.value = 50;
			//SLIDER this._slider.step = this.settings.step;
			//SLIDER this._slider.page = this.settings.page;
			//SLIDER this._slider.direction = this.settings.direction;
			//SLIDER this._slider.liveDragging = this.settings.liveDragging;
			//SLIDER this._slider.addEventListener(Event.CHANGE, slider_changeHandler);
			const sliderLayoutData:AnchorLayoutData = new AnchorLayoutData();
			sliderLayoutData.horizontalCenter = 0;
			sliderLayoutData.verticalCenter = 0;
			//SLIDER this._slider.layoutData = sliderLayoutData;
			//SLIDER this.addChild(this._slider);
			
			this._valueLabel = new Label();
			//SLIDER this._valueLabel.text = this._slider.value.toString();
			const valueLabelLayoutData:AnchorLayoutData = new AnchorLayoutData();
			valueLabelLayoutData.left = 20 * this.dpiScale;
			//SLIDER valueLabelLayoutData.leftAnchorDisplayObject = this._slider;
			valueLabelLayoutData.verticalCenter = 0;
			valueLabelLayoutData.verticalCenterAnchorDisplayObject = this._slider;
			this._valueLabel.layoutData = valueLabelLayoutData;
			this.addChild(this._valueLabel);

			this.headerProperties.title = "Slider";

			if(!DeviceCapabilities.isTablet(loom2d.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "Back";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

				this.headerProperties['leftItems'] = [ this._backButton ];

				this.backButtonHandler = this.onBackButton;
			}

			this._settingsButton = new Button();
			this._settingsButton.label = "Settings";
			this._settingsButton.addEventListener(Event.TRIGGERED, settingsButton_triggeredHandler);

			this.headerProperties['rightItems'] = [ this._settingsButton ];
		}
		
		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		private function slider_changeHandler(event:Event):void
		{
			this._valueLabel.text = this._slider.value.toString();
		}
		
		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}

		private function settingsButton_triggeredHandler(event:Event):void
		{
			this.dispatchEventWith(SHOW_SETTINGS);
		}
	}
}