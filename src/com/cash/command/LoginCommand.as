package com.cash.command
{
   import com.adobe.cairngorm.commands.Command;
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.cash.delegate.UserDelegate;
   import com.cash.event.LoginEvent;
   import com.cash.model.UserModel;
   import com.cash.vo.User;
   
   import mx.controls.Alert;
   import mx.rpc.IResponder;

   public class LoginCommand implements Command, IResponder
   {
 
 	  private var userModel:UserModel = UserModel.getInstance();
      public function execute( event : CairngormEvent ) : void
      {
         var userDelegate:UserDelegate = new UserDelegate(this);
         var user:User = (event as LoginEvent).getUser();
         userDelegate.login(user);
      }
      
      public function result(data:Object):void{
      	this.userModel.user = (data as User);
      	this.userModel.changeToMainScene();
      }
      
      public function fault(info:Object):void{
      	mx.controls.Alert.show("登录失败");
      }
   }
}
