package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.cash.delegate.InfoDelegate;
	import com.cash.event.InfoEvent;
	import com.cash.event.PageEvent;
	import com.cash.vo.Info;
	
	import mx.rpc.IResponder;

	public class UpdateInfoCommand implements Command, IResponder
	{

		private var c:CairngormEventDispatcher = CairngormEventDispatcher.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var info:Info = ( event as InfoEvent).getInfo();
			var infoDelegate:InfoDelegate = new InfoDelegate(this);
			infoDelegate.updateInfo(info);
			info = null;
		}
		
		public function result(data:Object):void
		{
			c.dispatchEvent(new CairngormEvent("closeEditInfoForm"));
			c.dispatchEvent(new PageEvent(PageEvent.INFO_PAGECHANGE_EVENT));
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}