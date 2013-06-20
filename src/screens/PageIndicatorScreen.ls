package feathers.examples.componentsExplorer.screens
{
	import feathers.controls.Button;
	//PAGEINDICATOR import feathers.controls.PageIndicator;
	import feathers.controls.PanelScreen;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.system.DeviceCapabilities;

	//STARLING import loom2d.core.Starling;
	import loom2d.display.DisplayObject;
	import loom2d.events.Event;

	[Event(name="complete",type="loom2d.events.Event")]

	public class PageIndicatorScreen extends PanelScreen
	{
		public function PageIndicatorScreen()
		{
			this.addEventListener(FeathersEventType.INITIALIZE, initializeHandler);
		}

		private var _backButton:Button;
		//PAGEINDICATOR private var _pageIndicator:PageIndicator;

		protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();

			//PAGEINDICATOR this._pageIndicator = new PageIndicator();
			//PAGEINDICATOR this._pageIndicator.pageCount = 5;
			//PAGEINDICATOR this._pageIndicator.addEventListener(Event.CHANGE, pageIndicator_changeHandler);
			const pageIndicatorLayoutData:AnchorLayoutData = new AnchorLayoutData();
			pageIndicatorLayoutData.left = 0;
			pageIndicatorLayoutData.right = 0;
			pageIndicatorLayoutData.verticalCenter = 0;
			//PAGEINDICATOR this._pageIndicator.layoutData = pageIndicatorLayoutData;
			//PAGEINDICATOR this.addChild(this._pageIndicator);

			this.headerProperties.title = "Page Indicator";

			if(!DeviceCapabilities.isTablet(loom2d.current.nativeStage))
			{
				this._backButton = new Button();
				this._backButton.nameList.add(Button.ALTERNATE_NAME_BACK_BUTTON);
				this._backButton.label = "Back";
				this._backButton.addEventListener(Event.TRIGGERED, backButton_triggeredHandler);

				this.headerProperties['leftItems'] = [ this._backButton ];

				this.backButtonHandler = this.onBackButton;
			}
		}

		private function onBackButton():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}

		private function pageIndicator_changeHandler(event:Event):void
		{
			trace("page indicator change:", this._pageIndicator.selectedIndex);
		}

		private function backButton_triggeredHandler(event:Event):void
		{
			this.onBackButton();
		}
	}
}
