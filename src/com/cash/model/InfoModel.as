package com.cash.model
{
	import com.cash.vo.Info;
	
	[Bindable]
	public class InfoModel
	{
		private static var _instance:InfoModel;
		
		public var info:Info;
		
		public static function getInstance():InfoModel{
			if(_instance == null){
				_instance = new InfoModel();
			}
			return _instance;
		}

	}
}