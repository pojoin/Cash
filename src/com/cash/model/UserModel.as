package com.cash.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.cash.vo.User;
	
	import mx.containers.ViewStack;

	[Bindable]
	public class UserModel implements ModelLocator
	{
		private static var _instance:UserModel;
		public var user:User = new User();  //用户信息
		private var viewStack:ViewStack;  //视图
		
		public static function getInstance():UserModel{
			if(_instance == null){
				_instance = new UserModel();
			}
			return _instance;
		}
		
		public function setViewStack(viewStack:ViewStack):void{
			this.viewStack = viewStack;
		}
		
		public function changeToMainScene():void{
			this.viewStack.selectedIndex = 1;
		}
		
		public function changeToLoginScene():void{
			this.viewStack.selectedIndex = 0;
		}
		
		
	}
}