package com.cash.dao
{
	import com.cash.common.page.Pager;
	import com.cash.vo.Info;
	
	import mx.collections.ArrayCollection;
	
	public interface InfoDao
	{
		 function add(info:Info):void;
		
		 function del(info:Info):void;
		
		 function update(info:Info):void;
		
		 function findById(id:int):Info;
		
		 function findAll():ArrayCollection;
		
		 function search(condition:String):ArrayCollection;
		
		 function list(condition:String,pager:Pager):Pager;
		
	}
}