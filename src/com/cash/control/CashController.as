package com.cash.control
{
   import com.adobe.cairngorm.control.FrontController;
   import com.cash.command.AddInfoCommand;
   import com.cash.command.AddItemCommand;
   import com.cash.command.DelInfoCommand;
   import com.cash.command.LoadInfoCommand;
   import com.cash.command.LoadItemTreeDataCommand;
   import com.cash.command.LoginCommand;
   import com.cash.command.PageCommand;
   import com.cash.command.RefreshInfoCommand;
   import com.cash.command.RegisterCommand;
   import com.cash.command.UpdateInfoCommand;
   import com.cash.event.InfoEvent;
   import com.cash.event.ItemEvent;
   import com.cash.event.ItemTreeEvent;
   import com.cash.event.LoginEvent;
   import com.cash.event.PageEvent;
   import com.cash.event.RegisterEvent;

   public class CashController extends FrontController
   {
      private static var UUID : String = "1422eaac-9ba3-4328-b44d-597f464fa5bb";

      public function CashController()
      {
         initialiseCommands();
      }

      private function initialiseCommands() : void
      {
      	//信息
         addCommand( InfoEvent.ADDINFO_EVENT, AddInfoCommand ); //添加信息
         addCommand( InfoEvent.DELINFO_EVENT, DelInfoCommand ); //删除信息
         addCommand( InfoEvent.UPDATEINFO_EVENT, UpdateInfoCommand ); //更新信息
         addCommand( InfoEvent.REFRESH_EVENT, RefreshInfoCommand ) //刷新
         addCommand( InfoEvent.LOADiNFO_EVENT, LoadInfoCommand ) //加载信息
         
         //事项
         addCommand( ItemEvent.ADDITEM_EVENT,AddItemCommand ); // 添加事项
         
         
         addCommand( LoginEvent.LOGIN_EVENT, LoginCommand );  //登录
         addCommand( PageEvent.INFO_PAGECHANGE_EVENT, PageCommand );  //信息分页
         addCommand( PageEvent.ITEM_PAGECHANGE_EVENT, PageCommand );  //事项分页
         addCommand( PageEvent.USER_PAGECHANGE_EVENT, PageCommand );  //用户分页
         addCommand( RegisterEvent.REGISTER_EVENT, RegisterCommand ); //注册
         addCommand( ItemTreeEvent.LOADITEMTREEDATA, LoadItemTreeDataCommand );  //加载树数据
      }
   }
}
