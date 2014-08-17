package com.cash.dao
{
	import com.cash.vo.Item;
	
	import mx.collections.ArrayCollection;
	
	public interface ItemDao
	{
		 function add(item:Item):void;
		
		 function del(item:Item):void;
		
		 function update(item:Item):void;
		
		 function findById(id:int):Item;
		
		 function findAll():ArrayCollection;
		
		 function search(condition:String):ArrayCollection;
		
	}
}