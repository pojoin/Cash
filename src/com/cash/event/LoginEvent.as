package com.cash.event
{
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.cash.vo.User;
   
   import flash.events.Event;

   public class LoginEvent extends CairngormEvent 
   {
      public static const LOGIN_EVENT : String = "login";
      private var user:User = null;

      public function LoginEvent(user:User)
      {
         super( LOGIN_EVENT);
         this.user = user;
      }

      public override function clone() : Event
      {
         return new LoginEvent(user);
      }
      
      public function getUser():User{
      	return this.user;
      }
   }
}
