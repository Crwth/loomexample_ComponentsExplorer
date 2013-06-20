package
{
	//MOVIECLIP import loom2d.display.MovieClip;
	import loom2d.display.Sprite;
	//import loom2d.display.StageAlign;
	import loom2d.display.StageScaleMode;
	import loom2d.errors.IllegalOperationError;
	import loom2d.events.Event;
	//import loom2d.ui.ContextMenu;
	//import loom2d.utils.getDefinitionByName;

	import feathers.system.DeviceCapabilities;

	//STARLING import loom2d.core.Starling;
	import loom2d.utils.HAlign;
	import loom2d.utils.VAlign;

	[SWF(width="960",height="640",frameRate="60",backgroundColor="#4a4137")]
	public class ComponentsExplorerWeb extends MovieClip
	{
		public function ComponentsExplorerWeb()
		{
			var menu:ContextMenu = new ContextMenu();
			menu.hideBuiltInItems();
			this.contextMenu = menu;
			
			if(this.stage)
			{
				this.stage.align = StageAlign.TOP_LEFT;
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
			}

			//pretends to be an iPhone Retina screen
			DeviceCapabilities.dpi = 326;
			DeviceCapabilities.screenPixelWidth = 960;
			DeviceCapabilities.screenPixelHeight = 640;
			
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}
		
		//STARLING private var _starling:Starling;
		
		private function start():void
		{
			this.gotoAndStop(2);
			this.graphics.clear();
			
			loom2d.handleLostContext = true;
			loom2d.multitouchEnabled = true;
			const MainType:Class = getDefinitionByName("feathers.examples.componentsExplorer.Main") as Class;
			this._starling = new Starling(MainType, this.stage);
			this._loom2d.enableErrorChecking = false;
			//this._loom2d.showStats = true;
			//this._loom2d.showStatsAt(HAlign.LEFT, VAlign.BOTTOM);
			this._loom2d.start();
		}
		
		private function loaderInfo_completeHandler(event:Event):void
		{
			this.start();
		}
	}
}