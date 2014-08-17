package com.cash.vo
{
	import flash.utils.ByteArray;
	
	[Bindable]
	[Table(name="item")]
	public class Item
	{
		[Id]
		[Column(name="id")]
		public var itemid:int;
		
		public var name:String;
		
		public var parentId:int;
		
		public var remark:String;
		
		public var creatUserId:Number;
		
		public var sn:int;
		
		public var creatTime:Date;

	}
}