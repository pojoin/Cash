package com.cash.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ItemTreeEvent extends CairngormEvent
	{
		public static const  LOADITEMTREEDATA : String = "loadItemTreeData";
		public function ItemTreeEvent(type:String)
		{
			super(type, false, false);
		}
		
	}
}