package com.cash.command
{
   import com.adobe.cairngorm.commands.Command;
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.adobe.cairngorm.control.CairngormEventDispatcher;
   import com.cash.delegate.UserDelegate;
   import com.cash.event.RegisterEvent;
   import com.cash.model.UserModel;
   import com.cash.vo.User;
   
   import mx.controls.Alert;
   import mx.rpc.IResponder;

   public class RegisterCommand implements Command ,IResponder
   {
   	
   	  private var userModel:UserModel = UserModel.getInstance();
   	
      public function execute( event : CairngormEvent ) : void
      {
        	var userDelegate:UserDelegate = new UserDelegate(this);
        	var user:User = (event as RegisterEvent).getUser();
        	userDelegate.register(user);
      }
      
      public function result(data:Object):void{
      	CairngormEventDispatcher.getInstance().dispatchEvent(new CairngormEvent("closeRegisterForm"));
      	mx.controls.Alert.show("注册成功");
      }
      
      public function fault(info:Object):void{
      	mx.controls.Alert.show("用户名已存在");
      }
   }
}
