package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.cash.delegate.InfoDelegate;
	
	import mx.rpc.IResponder;

	public class LoadInfoCommand implements Command, IResponder
	{

		public function execute(event:CairngormEvent):void
		{
			var infoDelegate:InfoDelegate = new InfoDelegate(this);
			
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}