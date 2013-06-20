package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.PanelScreen;
	//PICKERLIST import feathers.controls.PickerList;
	//TOGGLESWITCH import feathers.controls.ToggleSwitch;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.examples.componentsExplorer.data.GroupedListSettings;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]

	public class GroupedListSettingsScreen extends PanelScreen
	{
		public function GroupedListSettingsScreen()
		{
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		public var settings:GroupedListSettings;

		private var _list:List;
		private var _backButton:Button;

		//PICKERLIST private var _stylePicker:PickerList;
		//TOGGLESWITCH private var _isSelectableToggle:ToggleSwitch;
		//TOGGLESWITCH private var _hasElasticEdgesToggle:ToggleSwitch;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//PICKERLIST this._stylePicker = new PickerList();
			/*PICKERLIST this._stylePicker.dataProvider = new ListCollection(
			[
				GroupedListSettings.STYLE_NORMAL,
				GroupedListSettings.STYLE_INSET
			]);*/
			//PICKERLIST this._stylePicker.typicalItem = GroupedListSettings.STYLE_NORMAL;
			//PICKERLIST this._stylePicker.listProperties.typicalItem = GroupedListSettings.STYLE_NORMAL;
			//PICKERLIST this._stylePicker.selectedItem = this.settings.style;
			//PICKERLIST this._stylePicker.addEventListener(Event.CHANGE, stylePicker_changeHandler);

			//TOGGLESWITCH this._isSelectableToggle = new ToggleSwitch();
			//TOGGLESWITCH this._isSelectableToggle.isSelected = this.settings.isSelectable;
			//TOGGLESWITCH this._isSelectableToggle.addEventListener(Event.CHANGE, isSelectableToggle_changeHandler);

			//TOGGLESWITCH this._hasElasticEdgesToggle = new ToggleSwitch();
			//TOGGLESWITCH this._hasElasticEdgesToggle.isSelected = this.settings.hasElasticEdges;
			//TOGGLESWITCH this._hasElasticEdgesToggle.addEventListener(Event.CHANGE, hasElasticEdgesToggle_changeHandler);

			this._list = new List();
			this._list.isSelectable = false;
			this._list.dataProvider = new ListCollection(
			[
				{ label: "Group Style", accessory: this._stylePicker },
				{ label: "isSelectable", accessory: this._isSelectableToggle },
				{ label: "hasElasticEdges", accessory: this._hasElasticEdgesToggle },
			]);
			this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this._list.clipContent = false;
			this._list.autoHideBackground = true;
			this.addChild(this._list);

			this._backButton = new Button();
			this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
			this._backButton.label = "Back";
			this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

			this.headerProperties.title = "List Settings";
			this.headerProperties['leftItems'] = [ this._backButton ];

			this.backButtonHandler = this.onBackButton;
		}

		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}

		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}

		private function stylePicker_changeHandler(event:Event):void
		{
			this.settings.style = this._stylePicker.selectedItem as String;
		}

		private function isSelectableToggle_changeHandler(event:Event):void
		{
			this.settings.isSelectable = this._isSelectableToggle.isSelected;
		}

		private function hasElasticEdgesToggle_changeHandler(event:Event):void
		{
			this.settings.hasElasticEdges = this._hasElasticEdgesToggle.isSelected;
		}
	}
}
