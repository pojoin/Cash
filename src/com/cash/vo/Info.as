package com.cash.vo
{
	import flash.utils.ByteArray;
	
	[Bindable]
	[Table(name="info")]
	public class Info
	{
		[Id]
		[Column(name="id")]
		public var infoId:int;
		
		public var money:String;
		
		public var type:String;
		
		public var itemId:int;
		
		public var remark:String;
		
		public var time:String;
		
		public var createTime:String;
		
		public var createUserId:int;

	}
}