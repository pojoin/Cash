package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.cash.event.PageEvent;
	
	import mx.rpc.IResponder;

	public class RefreshInfoCommand implements Command, IResponder
	{

		public function execute(event:CairngormEvent):void
		{
			var pageEvent:PageEvent = new PageEvent(PageEvent.INFO_PAGECHANGE_EVENT);
			CairngormEventDispatcher.getInstance().dispatchEvent(pageEvent);
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}