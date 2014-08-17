package com.cash.event
{
   import com.adobe.cairngorm.control.CairngormEvent;
   import com.cash.vo.User;
   
   import flash.events.Event;

   public class RegisterEvent extends CairngormEvent 
   {
      public static const REGISTER_EVENT : String = "register";
      private var user:User;

      public function RegisterEvent(user:User)
      {
         super( REGISTER_EVENT);
         this.user = user;
      }

      public override function clone() : Event
      {
         return new RegisterEvent(user);
      }
      
      public function getUser():User{
      	return this.user;
      }
   }
}
