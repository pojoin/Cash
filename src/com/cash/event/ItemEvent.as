package com.cash.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.cash.vo.Item;

	public class ItemEvent extends CairngormEvent
	{
		public static const ADDITEM_EVENT : String = "addItemEvent";
		public static const DELITEM_EVENT : String = "delItemEvent";
		public static const UPDATEITEM_EVENT : String = "updateItemEvent";
		public static const REFRESHITEM_EVENT : String = "refreshItemEvent";
		public static const LOADINGITEM_EVENT : String = "loadingItemEvent";
		
		private var item : Item;
		public function ItemEvent(type:String, item:Item = null)
		{
			super(type, false, false);
			this.item = item;
		}
		
		public function getItem():Item{
			return this.item;
		}
		
	}
}