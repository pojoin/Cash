package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.cash.delegate.InfoDelegate;
	import com.cash.event.PageEvent;
	
	import mx.rpc.IResponder;

	public class DelInfoCommand implements Command, IResponder
	{
		private var c:CairngormEventDispatcher = CairngormEventDispatcher.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var infoDelegate:InfoDelegate = new InfoDelegate(this);
			var infoList:Array = event.data as Array;
			infoDelegate.delInfo(infoList);
		}
		
		public function result(data:Object):void
		{
			c.dispatchEvent(new PageEvent(PageEvent.INFO_PAGECHANGE_EVENT));
			
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}