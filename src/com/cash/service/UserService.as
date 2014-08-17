package com.cash.service
{
	import com.cash.vo.User;
	
	public interface UserService
	{
		//添加用户
		function addUser(user:User):void;
		//删除用户
		function delUser(user:User):void;
		//查找用户
		function findUser(logiNnam:String,password:String):User;
		//查看用户名是否存在 true存在  false不存在
		function isExists(loginName:String):Boolean;
		
	}
}