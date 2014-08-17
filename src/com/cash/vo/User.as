package com.cash.vo
{
	import flash.utils.ByteArray;
	
	[Bindable]
	[Table(name="user")]
	public class User
	{
		[Id]
		[Column(name="id")]
		public var userId:int;
		
		public var loginName:String;
		
		public var nickName:String;
		
		public var password:String;
		
		public var email:String;
		
		public var phone:String;
		
		public var birthday:String;
		
		public var pic:ByteArray;
		
		public var createTime:Date;

	}
}