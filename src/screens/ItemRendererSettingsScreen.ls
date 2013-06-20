package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	import feathers.controls.GroupedList;
	import feathers.controls.PanelScreen;
	//PICKERLIST import feathers.controls.PickerList;
	//TOGGLESWITCH import feathers.controls.ToggleSwitch;
	import feathers.controls.renderers.BaseDefaultItemRenderer;
	import feathers.data.HierarchicalCollection;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.examples.componentsExplorer.data.ItemRendererSettings;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]

	public class ItemRendererSettingsScreen extends PanelScreen
	{
		private static const GAP_LABEL_INFINITE:String = "Fill Available Space";
		private static const GAP_LABEL_DEFAULT:String = "No Fill";

		public function ItemRendererSettingsScreen()
		{
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		public var settings:ItemRendererSettings;

		private var _list:GroupedList;
		private var _backButton:Button;
		//PICKERLIST private var _gapPicker:PickerList;
		//TOGGLESWITCH private var _hasIconToggle:ToggleSwitch;
		//TOGGLESWITCH private var _hasAccessoryToggle:ToggleSwitch;
		//PICKERLIST private var _layoutOrderPicker:PickerList;
		//PICKERLIST private var _iconPositionPicker:PickerList;
		//PICKERLIST private var _accessoryPositionPicker:PickerList;
		//PICKERLIST private var _accessoryTypePicker:PickerList;
		//PICKERLIST private var _accessoryGapPicker:PickerList;
		//PICKERLIST private var _horizontalAlignPicker:PickerList;
		//PICKERLIST private var _verticalAlignPicker:PickerList;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//TOGGLESWITCH this._hasIconToggle = new ToggleSwitch();
			//TOGGLESWITCH this._hasIconToggle.isSelected = this.settings.hasIcon;
			//TOGGLESWITCH this._hasIconToggle.addEventListener(Event.CHANGE, hasIconToggle_changeHandler);

			//PICKERLIST this._iconPositionPicker = new PickerList();
			//PICKERLIST this._iconPositionPicker.typicalItem = Button.ICON_POSITION_RIGHT_BASELINE;
			/*PICKERLIST this._iconPositionPicker.dataProvider = new ListCollection(
			[
				Button.ICON_POSITION_TOP,
				Button.ICON_POSITION_RIGHT,
				Button.ICON_POSITION_BOTTOM,
				Button.ICON_POSITION_LEFT,
				Button.ICON_POSITION_LEFT_BASELINE,
				Button.ICON_POSITION_RIGHT_BASELINE
				//Button.ICON_POSITION_MANUAL,
			]);*/
			//PICKERLIST this._iconPositionPicker.listProperties.typicalItem = Button.ICON_POSITION_RIGHT_BASELINE;
			//PICKERLIST this._iconPositionPicker.selectedItem = this.settings.iconPosition;
			//PICKERLIST this._iconPositionPicker.addEventListener(Event.CHANGE, iconPositionPicker_changeHandler);

			//PICKERLIST this._gapPicker = new PickerList();
			/*PICKERLIST this._gapPicker.dataProvider = new ListCollection(
			[
				{ label: GAP_LABEL_INFINITE, value: true },
				{ label: GAP_LABEL_DEFAULT, value: false }
			]);*/
			//PICKERLIST this._gapPicker.typicalItem = this._gapPicker.dataProvider.getItemAt(0);
			//PICKERLIST this._gapPicker.listProperties.typicalItem = this._gapPicker.dataProvider.getItemAt(0);
			//PICKERLIST this._gapPicker.selectedItem = this._gapPicker.dataProvider.getItemAt(this.settings.useInfiniteGap ? 0 : 1);
			//PICKERLIST this._gapPicker.addEventListener(Event.CHANGE, gapPicker_changeHandler);

			//TOGGLESWITCH this._hasAccessoryToggle = new ToggleSwitch();
			//TOGGLESWITCH this._hasAccessoryToggle.isSelected = this.settings.hasAccessory;
			//TOGGLESWITCH this._hasAccessoryToggle.addEventListener(Event.CHANGE, hasAccessoryToggle_changeHandler);

			//PICKERLIST this._accessoryTypePicker = new PickerList();
			//PICKERLIST this._accessoryTypePicker.typicalItem = ItemRendererSettings.ACCESSORY_TYPE_DISPLAY_OBJECT;
			/*PICKERLIST this._accessoryTypePicker.dataProvider = new ListCollection(
			[
				ItemRendererSettings.ACCESSORY_TYPE_DISPLAY_OBJECT,
				ItemRendererSettings.ACCESSORY_TYPE_TEXTURE,
				ItemRendererSettings.ACCESSORY_TYPE_LABEL
			]);*/
			//PICKERLIST this._accessoryTypePicker.listProperties.typicalItem = ItemRendererSettings.ACCESSORY_TYPE_DISPLAY_OBJECT;
			//PICKERLIST this._accessoryTypePicker.selectedItem = this.settings.accessoryType;
			//PICKERLIST this._accessoryTypePicker.addEventListener(Event.CHANGE, accessoryTypePicker_changeHandler);

			//PICKERLIST this._accessoryPositionPicker = new PickerList();
			//PICKERLIST this._accessoryPositionPicker.typicalItem = BaseDefaultItemRenderer.ACCESSORY_POSITION_BOTTOM;
			/*PICKERLIST this._accessoryPositionPicker.dataProvider = new ListCollection(
			[
				BaseDefaultItemRenderer.ACCESSORY_POSITION_TOP,
				BaseDefaultItemRenderer.ACCESSORY_POSITION_RIGHT,
				BaseDefaultItemRenderer.ACCESSORY_POSITION_BOTTOM,
				BaseDefaultItemRenderer.ACCESSORY_POSITION_LEFT
				//BaseDefaultItemRenderer.ACCESSORY_POSITION_MANUAL
			]);*/
			//PICKERLIST this._accessoryPositionPicker.listProperties.typicalItem = BaseDefaultItemRenderer.ACCESSORY_POSITION_BOTTOM;
			//PICKERLIST this._accessoryPositionPicker.selectedItem = this.settings.accessoryPosition;
			//PICKERLIST this._accessoryPositionPicker.addEventListener(Event.CHANGE, accessoryPositionPicker_changeHandler);

			//PICKERLIST this._accessoryGapPicker = new PickerList();
			/*PICKERLIST this._accessoryGapPicker.dataProvider = new ListCollection(
			[
				{ label: GAP_LABEL_INFINITE, value: true },
				{ label: GAP_LABEL_DEFAULT, value: false }
			]);*/
			//PICKERLIST this._accessoryGapPicker.typicalItem = this._accessoryGapPicker.dataProvider.getItemAt(0);
			//PICKERLIST this._accessoryGapPicker.listProperties.typicalItem = this._accessoryGapPicker.dataProvider.getItemAt(0);
			//PICKERLIST this._accessoryGapPicker.selectedItem = this._accessoryGapPicker.dataProvider.getItemAt(this.settings.useInfiniteAccessoryGap ? 0 : 1);
			//PICKERLIST this._accessoryGapPicker.addEventListener(Event.CHANGE, accessoryGapPicker_changeHandler);

			//PICKERLIST this._layoutOrderPicker = new PickerList();
			//PICKERLIST this._layoutOrderPicker.typicalItem = BaseDefaultItemRenderer.LAYOUT_ORDER_LABEL_ACCESSORY_ICON;
			/*PICKERLIST this._layoutOrderPicker.dataProvider = new ListCollection(
			[
				BaseDefaultItemRenderer.LAYOUT_ORDER_LABEL_ICON_ACCESSORY,
				BaseDefaultItemRenderer.LAYOUT_ORDER_LABEL_ACCESSORY_ICON
			]);*/
			//PICKERLIST this._layoutOrderPicker.listProperties.typicalItem = BaseDefaultItemRenderer.LAYOUT_ORDER_LABEL_ACCESSORY_ICON;
			//PICKERLIST this._layoutOrderPicker.selectedItem = this.settings.layoutOrder;
			//PICKERLIST this._layoutOrderPicker.addEventListener(Event.CHANGE, layoutOrderPicker_changeHandler);

			//PICKERLIST this._horizontalAlignPicker = new PickerList();
			/*PICKERLIST this._horizontalAlignPicker.dataProvider = new ListCollection(
			[
				Button.HORIZONTAL_ALIGN_LEFT,
				Button.HORIZONTAL_ALIGN_CENTER,
				Button.HORIZONTAL_ALIGN_RIGHT
			]);*/
			//PICKERLIST this._horizontalAlignPicker.typicalItem = Button.HORIZONTAL_ALIGN_CENTER;
			//PICKERLIST this._horizontalAlignPicker.listProperties.typicalItem = Button.HORIZONTAL_ALIGN_CENTER;
			//PICKERLIST this._horizontalAlignPicker.selectedItem = this.settings.horizontalAlign;
			//PICKERLIST this._horizontalAlignPicker.addEventListener(Event.CHANGE, horizontalAlignPicker_changeHandler);

			//PICKERLIST this._verticalAlignPicker = new PickerList();
			/*PICKERLIST this._verticalAlignPicker.dataProvider = new ListCollection(
			[
				Button.VERTICAL_ALIGN_TOP,
				Button.VERTICAL_ALIGN_MIDDLE,
				Button.VERTICAL_ALIGN_BOTTOM
			]);*/
			//PICKERLIST this._verticalAlignPicker.typicalItem = Button.VERTICAL_ALIGN_MIDDLE;
			//PICKERLIST this._verticalAlignPicker.listProperties.typicalItem = Button.VERTICAL_ALIGN_MIDDLE;
			//PICKERLIST this._verticalAlignPicker.selectedItem = this.settings.verticalAlign;
			//PICKERLIST this._verticalAlignPicker.addEventListener(Event.CHANGE, verticalAlignPicker_changeHandler);

			this._list = new GroupedList();
			this._list.nameList.add(GroupedList.ALTERNATE_NAME_INSET_GROUPED_LIST);
			this._list.isSelectable = false;
			this._list.dataProvider = new HierarchicalCollection(
			[
				{
					header: "Layout",
					children:
					[
						{ label: "layoutOrder", accessory: this._layoutOrderPicker },
						{ label: "horizontalAlign", accessory: this._horizontalAlignPicker },
						{ label: "verticalAlign", accessory: this._verticalAlignPicker }
					]
				},
				{
					header: "Icon",
					children:
					[
						{ label: "Has Icon", accessory: this._hasIconToggle },
						{ label: "iconPosition", accessory: this._iconPositionPicker },
						{ label: "gap", accessory: this._gapPicker }
					]
				},
				{
					header: "Accessory",
					children:
					[
						{ label: "Has Accessory", accessory: this._hasAccessoryToggle },
						{ label: "Accessory Type", accessory: this._accessoryTypePicker },
						{ label: "accessoryPosition", accessory: this._accessoryPositionPicker },
						{ label: "accessoryGap", accessory: this._accessoryGapPicker }
					]
				}
			]);
			this._list.layoutData = new AnchorLayoutData(0, 0, 0, 0);
			this._list.clipContent = false;
			this._list.autoHideBackground = true;
			this.addChild(this._list);

			this._backButton = new Button();
			this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
			this._backButton.label = "Back";
			this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

			this.headerProperties.title = "Item Renderer Settings";
			this.headerProperties['leftItems'] = [ this._backButton ];

			this.backButtonHandler = this.onBackButton;
		}

		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}

		private function hasIconToggle_changeHandler(event:Event):void
		{
			this.settings.hasIcon = this._hasIconToggle.isSelected
		}

		private function iconPositionPicker_changeHandler(event:Event):void
		{
			this.settings.iconPosition = this._iconPositionPicker.selectedItem as String;
		}

		private function gapPicker_changeHandler(event:Event):void
		{
			this.settings.useInfiniteGap = this._gapPicker.selectedIndex == 0;
		}

		private function hasAccessoryToggle_changeHandler(event:Event):void
		{
			this.settings.hasAccessory = this._hasAccessoryToggle.isSelected
		}

		private function accessoryTypePicker_changeHandler(event:Event):void
		{
			this.settings.accessoryType = this._accessoryTypePicker.selectedItem as String;
		}

		private function accessoryPositionPicker_changeHandler(event:Event):void
		{
			this.settings.accessoryPosition = this._accessoryPositionPicker.selectedItem as String;
		}

		private function accessoryGapPicker_changeHandler(event:Event):void
		{
			this.settings.useInfiniteAccessoryGap = this._accessoryGapPicker.selectedIndex == 0;
		}

		private function layoutOrderPicker_changeHandler(event:Event):void
		{
			this.settings.layoutOrder = this._layoutOrderPicker.selectedItem as String;
		}

		private function horizontalAlignPicker_changeHandler(event:Event):void
		{
			this.settings.horizontalAlign = this._horizontalAlignPicker.selectedItem as String;
		}

		private function verticalAlignPicker_changeHandler(event:Event):void
		{
			this.settings.verticalAlign = this._verticalAlignPicker.selectedItem as String;
		}

		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
	}
}
