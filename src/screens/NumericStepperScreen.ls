package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	//NUMERICSTEPPER import feathers.controls.NumericStepper;
	import feathers.controls.PanelScreen;
	//SLIDER import feathers.controls.Slider;
	import feathers.events.FeathersEventType;
	import feathers.examples.componentsExplorer.data.NumericStepperSettings;
	import feathers.examples.componentsExplorer.data.SliderSettings;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;

	//STARLING import loom2d.core.Starling;
	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]
	[Event(name="showSettings",type="loom2d.events.Event")]

	public class NumericStepperScreen extends PanelScreen
	{
		public static const SHOW_SETTINGS:String = "showSettings";

		public function NumericStepperScreen()
		{
			super();
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		public var settings:NumericStepperSettings;

		//NUMERICSTEPPER private var _stepper:NumericStepper;
		private var _backButton:Button;
		private var _settingsButton:Button;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//NUMERICSTEPPER this._stepper = new NumericStepper();
			//NUMERICSTEPPER this._stepper.minimum = 0;
			//NUMERICSTEPPER this._stepper.maximum = 100;
			//NUMERICSTEPPER this._stepper.value = 50;
			//NUMERICSTEPPER this._stepper.step = this.settings.step;
			//NUMERICSTEPPER this._stepper.addEventListener(Event.CHANGE, slider_changeHandler);
			const stepperLayoutData:AnchorLayoutData = new AnchorLayoutData();
			stepperLayoutData.horizontalCenter = 0;
			stepperLayoutData.verticalCenter = 0;
			//NUMERICSTEPPER this._stepper.layoutData = stepperLayoutData;
			//NUMERICSTEPPER this.addChild(this._stepper);

			this.headerProperties.title = "Numeric Stepper";

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
			trace("numeric stepper change:", this._stepper.value);
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