package com.cash.model
{
	import com.cash.vo.User;
	
	[Bindable]
	public class Global
	{
		private static var _instance:Global;
		public var currentUser:User;
		
		public static function getInstance():Global{
			if(_instance == null){
				_instance = new Global();
			}
			return _instance;
		}
		
		

	}
}