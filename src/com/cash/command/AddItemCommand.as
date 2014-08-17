package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.cash.delegate.ItemDelegate;
	import com.cash.event.ItemEvent;
	
	import mx.rpc.IResponder;

	public class AddItemCommand implements Command, IResponder
	{
		private var c:CairngormEventDispatcher = CairngormEventDispatcher.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var itemEvent : ItemEvent = event as ItemEvent;
			var itemDelegate : ItemDelegate = new ItemDelegate(this);
			itemDelegate.addItem(itemEvent.getItem());
		}
		
		public function result(data:Object):void
		{
			
		}
		
		public function fault(info:Object):void
		{
			trace("添加事项出错");
		}
		
	}
}