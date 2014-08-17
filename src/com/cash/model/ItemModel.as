package com.cash.model
{
	import com.cash.vo.Item;
	
	[Bindable]
	public class ItemModel
	{
		private static var _instance:ItemModel;
		
		public var item:Item;
		
		public static function getInstance():ItemModel{
			if(_instance == null){
				_instance = new ItemModel();
			}
			return _instance;
		}

	}
}