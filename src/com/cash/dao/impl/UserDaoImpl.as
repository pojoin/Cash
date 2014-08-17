package com.cash.dao.impl
{
	import com.cash.common.util.EntityManager;
	import com.cash.dao.UserDao;
	import com.cash.vo.User;
	
	import mx.collections.ArrayCollection;

	public class UserDaoImpl implements UserDao
	{
		private var em:EntityManager = EntityManager.getInstance();
		
		public function add(user:User):void
		{
			em.save(user);
		}
		
		public function del(user:User):void
		{
			em.remove(user);
		}
		
		public function update(user:User):void
		{
			em.update(user);
		}
		
		public function findById(id:int):User
		{
			var user:User = null;
			var userCollection:ArrayCollection = this.search("id=" + id);
			if(userCollection != null && userCollection.length >0){
				user = userCollection.getItemAt(0) as User;
			}
			userCollection = null;
			return user;
		}
		
		public function findAll():ArrayCollection
		{
			return em.findAll(User);
		}
		
		public function search(condition:String):ArrayCollection
		{
			return em.search(User,condition);
		}
		
	}
}