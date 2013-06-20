package
{
	import feathers.examples.componentsExplorer.Main;

	//LOADER import loom2d.display.Loader;
	import loom2d.display.Sprite;
	//import loom2d.display.StageAlign;
	//import loom2d.display.StageOrientation;
	import loom2d.display.StageScaleMode;
	import loom2d.events.Event;
	//import loom2d.filesystem.File;
	//import loom2d.filesystem.FileMode;
	//import loom2d.filesystem.FileStream;
	//import loom2d.geom.Rectangle;
	//import loom2d.system.Capabilities;
	//import loom2d.utils.ByteArray;

	//STARLING import loom2d.core.Starling;

	[SWF(width="960",height="640",frameRate="60",backgroundColor="#4a4137")]
	public class ComponentsExplorer extends Sprite
	{
		public function ComponentsExplorer()
		{
			if(this.stage)
			{
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
				this.stage.align = StageAlign.TOP_LEFT;
			}
			this.mouseEnabled = this.mouseChildren = false;
			this.showLaunchImage();
			this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
		}

		//STARLING private var _starling:Starling;
		//LOADER private var _launchImage:Loader;
		private var _savedAutoOrients:Boolean;

		private function showLaunchImage():void
		{
			var filePath:String;
			var isPortraitOnly:Boolean = false;
			if(Capabilities.manufacturer.indexOf("iOS") >= 0)
			{
				if(Capabilities.screenResolutionX == 1536 && Capabilities.screenResolutionY == 2048)
				{
					var isCurrentlyPortrait:Boolean = this.stage.orientation == StageOrientation.DEFAULT || this.stage.orientation == StageOrientation.UPSIDE_DOWN;
					filePath = isCurrentlyPortrait ? "Default-Portrait@2x.png" : "Default-Landscape@2x.png";
				}
				else if(Capabilities.screenResolutionX == 768 && Capabilities.screenResolutionY == 1024)
				{
					isCurrentlyPortrait = this.stage.orientation == StageOrientation.DEFAULT || this.stage.orientation == StageOrientation.UPSIDE_DOWN;
					filePath = isCurrentlyPortrait ? "Default-Portrait.png" : "Default-Landscape.png";
				}
				else if(Capabilities.screenResolutionX == 640)
				{
					isPortraitOnly = true;
					if(Capabilities.screenResolutionY == 1136)
					{
						filePath = "Default-568h@2x.png";
					}
					else
					{
						filePath = "Default@2x.png";
					}
				}
				else if(Capabilities.screenResolutionX == 320)
				{
					isPortraitOnly = true;
					filePath = "Default.png";
				}
			}

			if(filePath)
			{
				var file:File = File.applicationDirectory.resolvePath(filePath);
				if(file.exists)
				{
					var bytes:ByteArray = new ByteArray();
					var stream:FileStream = new FileStream();
					stream.open(file, FileMode.READ);
					stream.readBytes(bytes, 0, stream.bytesAvailable);
					stream.close();
					this._launchImage = new Loader();
					this._launchImage.loadBytes(bytes);
					this.addChild(this._launchImage);
					this._savedAutoOrients = this.stage.autoOrients;
					this.stage.autoOrients = false;
					if(isPortraitOnly)
					{
						this.stage.setOrientation(StageOrientation.DEFAULT);
					}
				}
			}
		}

		private function loaderInfo_completeHandler(event:Event):void
		{
			loom2d.handleLostContext = true;
			loom2d.multitouchEnabled = true;
			this._starling = new Starling(Main, this.stage);
			this._loom2d.enableErrorChecking = false;
			//this._loom2d.showStats = true;
			//this._loom2d.showStatsAt(HAlign.LEFT, VAlign.BOTTOM);
			this._loom2d.start();
			if(this._launchImage)
			{
				this._loom2d.addEventListener("rootCreated", starling_rootCreatedHandler);
			}

			this.stage.addEventListener(Event.RESIZE, stage_resizeHandler, false, int.MAX_VALUE, true);
			this.stage.addEventListener(Event.DEACTIVATE, stage_deactivateHandler, false, 0, true);
		}

		private function starling_rootCreatedHandler(event:Object):void
		{
			if(this._launchImage)
			{
				this.removeChild(this._launchImage);
				this._launchImage.unloadAndStop(true);
				this._launchImage = null;
				this.stage.autoOrients = this._savedAutoOrients;
			}
		}

		private function stage_resizeHandler(event:Event):void
		{
			this._loom2d.stage.stageWidth = this.stage.stageWidth;
			this._loom2d.stage.stageHeight = this.stage.stageHeight;

			const viewPort:Rectangle = this._loom2d.viewPort;
			viewPort.width = this.stage.stageWidth;
			viewPort.height = this.stage.stageHeight;
			try
			{
				this._loom2d.viewPort = viewPort;
			}
			catch(error:Error) {}
			//this._loom2d.showStatsAt(HAlign.LEFT, VAlign.BOTTOM);
		}

		private function stage_deactivateHandler(event:Event):void
		{
			this._loom2d.stop();
			this.stage.addEventListener(Event.ACTIVATE, stage_activateHandler, false, 0, true);
		}

		private function stage_activateHandler(event:Event):void
		{
			this.stage.removeEventListener(Event.ACTIVATE, stage_activateHandler);
			this._loom2d.start();
		}

	}
}