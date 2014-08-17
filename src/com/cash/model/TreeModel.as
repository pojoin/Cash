package com.cash.model
{
	import mx.collections.ArrayCollection;
	[Bindable]
	public class TreeModel
	{
		private static var _instance:TreeModel;
		public var treeDate:ArrayCollection; //树形菜单的数据
		public static function getInstance():TreeModel{
			if(_instance == null){
				_instance = new TreeModel();
			}
			return _instance;
		}

	}
}