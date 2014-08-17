package com.cash.event
{
   import com.adobe.cairngorm.control.CairngormEvent;

   public class PageEvent extends CairngormEvent 
   {
      public static const INFO_PAGECHANGE_EVENT : String = "Info_PageChange";
      public static const ITEM_PAGECHANGE_EVENT : String = "Item_PageChange";
      public static const USER_PAGECHANGE_EVENT : String = "User_PageChange";

	  private var eventName:String;
      public function PageEvent(eventName:String)
      {
         super( eventName);
         this.eventName = eventName;
      }
      
      public function getEventName():String{
      	return this.eventName;
      }

   }
}
