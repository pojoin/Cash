package com.cash.dao.impl
{
	import com.cash.common.util.EntityManager;
	import com.cash.dao.ItemDao;
	import com.cash.vo.Item;
	
	import mx.collections.ArrayCollection;

	public class ItemDaoImpl implements ItemDao
	{
		private var em:EntityManager = EntityManager.getInstance();
		public function add(item:Item):void
		{
			em.save(item);
		}
		
		public function del(item:Item):void
		{
			em.remove(item);
		}
		
		public function update(item:Item):void
		{
			em.update(item);
		}
		
		public function findById(id:int):Item
		{
			var item:Item = null;
			var itemList:ArrayCollection = this.search(" id=" + id);
			if(itemList != null && itemList.length > 0){
				item = itemList.getItemAt(0) as Item;
			}
			itemList = null;
			return item;
		}
		
		public function findAll():ArrayCollection
		{
			return em.findAll(Item);
		}
		
		public function search(condition:String):ArrayCollection
		{
			return em.search(Item,condition);
		}
		
	}
}