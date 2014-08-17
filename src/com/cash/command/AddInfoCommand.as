package com.cash.command
{
   import com.adobe.cairngorm.commands.Command;
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.adobe.cairngorm.control.CairngormEventDispatcher;
   import com.cash.delegate.InfoDelegate;
   import com.cash.event.InfoEvent;
   
   import mx.controls.Alert;
   import mx.rpc.IResponder;

      public class AddInfoCommand implements Command , IResponder
   {
 	  private var c:CairngormEventDispatcher = CairngormEventDispatcher.getInstance();
      public function execute( event : CairngormEvent ) : void
      {
         var infoEvent:InfoEvent = event as InfoEvent;
         var infoDelegate:InfoDelegate = new InfoDelegate(this);
         infoDelegate.addInfo(infoEvent.getInfo());
      }
      
      public function result(data:Object):void{
      	c.dispatchEvent(new CairngormEvent("closeInfoForm"));
      	c.dispatchEvent(new InfoEvent(InfoEvent.REFRESH_EVENT));
      }
      
      public function fault(info:Object):void{
      	mx.controls.Alert.show("信息添加失败");
      }
      
      
   }
}
