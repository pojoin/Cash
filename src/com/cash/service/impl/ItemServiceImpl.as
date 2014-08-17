package com.cash.service.impl
{
	import com.cash.dao.ItemDao;
	import com.cash.dao.impl.ItemDaoImpl;
	import com.cash.service.ItemService;
	import com.cash.vo.Item;
	
	import mx.collections.ArrayCollection;

	public class ItemServiceImpl implements ItemService
	{
		private var itemDao:ItemDao = new ItemDaoImpl();
		public function addItem(item:Item):void
		{
			item.creatTime = new Date();
			item.sn = new Date().getMilliseconds();
			this.itemDao.add(item);
		}
		
		public function delItem(item:Item):void
		{
			this.itemDao.del(item);
		}
		
		public function updateItem(item:Item):void
		{
			this.itemDao.update(item);
		}
		
		public function findById(id:int):Item
		{
			return this.itemDao.findById(id);
		}
		
		public function findAll():ArrayCollection
		{
			return this.itemDao.findAll();
		}
		
		public function search(condition:String):ArrayCollection
		{
			return this.itemDao.search(condition);
		}
		
	}
}