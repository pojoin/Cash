package com.cash.service
{
	import com.cash.vo.Item;
	
	import mx.collections.ArrayCollection;
	
	public interface ItemService
	{
		function addItem(item:Item):void;
		
		function delItem(item:Item):void;
		
		function updateItem(item:Item):void;
		
		function findById(id:int):Item;
		
		function findAll():ArrayCollection;
		
		function search(condition:String):ArrayCollection;
		
	}
}