package com.cash.event
{
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.cash.vo.Info;

   public class InfoEvent extends CairngormEvent 
   {
      public static const ADDINFO_EVENT : String = "addInfoEvent";
      public static const DELINFO_EVENT : String = "delInfoEvent";
      public static const UPDATEINFO_EVENT : String = "updateInfoEvent";
      public static const REFRESH_EVENT : String = "refreshInfoEvent";
      public static const LOADiNFO_EVENT : String = "loadInfoEvent";
		
	  private var info:Info;
      public function InfoEvent(eventName:String,info:Info = null)
      {
         super( eventName, false, false );
         this.info = info;
      }
      
      public function getInfo():Info{
      	return this.info;
      }

   }
}
