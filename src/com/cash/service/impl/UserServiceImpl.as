package com.cash.service.impl
{
	import com.cash.dao.UserDao;
	import com.cash.dao.impl.UserDaoImpl;
	import com.cash.service.UserService;
	import com.cash.vo.User;
	
	import mx.collections.ArrayCollection;

	public class UserServiceImpl implements UserService
	{
		private var userDao:UserDao = new UserDaoImpl();

		public function addUser(user:User):void
		{
			user.createTime = new Date();
			this.userDao.add(user);
		}
		
		public function delUser(user:User):void
		{
			this.userDao.del(user);
		}
		
		public function findUser(loginnam:String, password:String):User
		{
			var user:User = null;
			var condition:String = " loginName='" + loginnam + "' and password='" + password + "'";
			var userList:ArrayCollection =  this.userDao.search(condition);
			if(userList != null && userList.length > 0){
				user = userList.getItemAt(0) as User;
			}
			condition = null;
			userList = null;
			return user;
		}
		
		public function isExists(loginName:String):Boolean
		{
			var condition:String = " loginname='" + loginName + "'";
			var userList:ArrayCollection = this.userDao.search(condition);
			if(userList != null && userList.length > 0){
				condition = null;
				userList = null;
				return true;
			}
			condition = null;
			userList = null;
			return false;
		}
		
	}
}