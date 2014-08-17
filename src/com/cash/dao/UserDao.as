package com.cash.dao
{
	import com.cash.vo.User;
	
	import mx.collections.ArrayCollection;
	
	public interface UserDao
	{
		//添加
		 function add(user:User):void;
		//删除
		 function del(user:User):void;
		//更新
		 function update(user:User):void;
		//查找
		 function findById(id:int):User;
		//查找所有
		 function findAll():ArrayCollection;
		//条件查询
		 function search(condition:String):ArrayCollection;
	}
}