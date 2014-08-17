package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.cash.common.page.Pager;
	import com.cash.delegate.PageDelegate;
	import com.cash.event.PageEvent;
	import com.cash.model.PageModel;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class PageCommand implements Command, IResponder
	{

		private var pageModel:PageModel = PageModel.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var pageEvent:PageEvent = event as PageEvent;
			
			var pager:Pager = new Pager();
			pager.setPageNo(this.pageModel.pageNo);
			pager.setPageSize(this.pageModel.pageSize);
			
			var pageDelegate:PageDelegate = new PageDelegate(pager,this);
			
			if(pageEvent.getEventName() == PageEvent.INFO_PAGECHANGE_EVENT){
				pageDelegate.infoPageChange();
			}
			if(pageEvent.getEventName() == PageEvent.ITEM_PAGECHANGE_EVENT){
				pageDelegate.itemPageChage();
			}
			
			if(pageEvent.getEventName() == PageEvent.USER_PAGECHANGE_EVENT){
				pageDelegate.userPageChange();
			}
			
			pageEvent = null;
			pageDelegate = null;
			pager = null;
		}
		
		public function result(data:Object):void
		{
			var pager:Pager = data as Pager;
			this.pageModel.pageCount = pager.getPageCount();
			this.pageModel.resultCount = pager.getResultCount();
			this.pageModel.data = pager.getData();
			this.pageModel.initComboBoxData();
		}
		
		public function fault(info:Object):void
		{
			mx.controls.Alert.show("error");
		}
		
	}
}