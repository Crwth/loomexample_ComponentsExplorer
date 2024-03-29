package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.List;
	//NUMERICSTEPPER import feathers.controls.NumericStepper;
	import feathers.controls.PanelScreen;
	//PICKERLIST import feathers.controls.PickerList;
	//SLIDER import feathers.controls.Slider;
	//TOGGLESWITCH import feathers.controls.ToggleSwitch;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.examples.componentsExplorer.data.NumericStepperSettings;
	import feathers.examples.componentsExplorer.data.SliderSettings;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]

	public class NumericStepperSettingsScreen extends PanelScreen
	{
		public function NumericStepperSettingsScreen()
		{
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		public var settings:NumericStepperSettings;

		private var _list:List;
		private var _backButton:Button;
		//NUMERICSTEPPER private var _stepStepper:NumericStepper;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//NUMERICSTEPPER this._stepStepper = new NumericStepper();
			//NUMERICSTEPPER this._stepStepper.minimum = 1;
			//NUMERICSTEPPER this._stepStepper.maximum = 20;
			//NUMERICSTEPPER this._stepStepper.step = 1;
			//NUMERICSTEPPER this._stepStepper.value = this.settings.step;
			//NUMERICSTEPPER this._stepStepper.addEventListener(Event.CHANGE, stepStepper_changeHandler);

			this._list = new List();
			this._list.isSelectable = false;
			this._list.dataProvider = new ListCollection(
			[
				{ label: "step", accessory: this._stepStepper },
			]);
			this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this._list.clipContent = false;
			this._list.autoHideBackground = true;
			this.addChild(this._list);

			this._backButton = new Button();
			this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
			this._backButton.label = "Back";
			this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

			this.headerProperties.title = "Numeric Stepper Settings";
			this.headerProperties['leftItems'] = [ this._backButton ];

			this.backButtonHandler = this.onBackButton;
		}

		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}

		private function stepStepper_changeHandler(event:Event):void
		{
			this.settings.step = this._stepStepper.value;
		}

		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
	}
}
