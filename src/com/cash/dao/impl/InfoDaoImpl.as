package com.cash.dao.impl
{
	import com.cash.common.page.Pager;
	import com.cash.common.util.EntityManager;
	import com.cash.dao.InfoDao;
	import com.cash.vo.Info;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	public class InfoDaoImpl implements InfoDao
	{
		private var em:EntityManager = EntityManager.getInstance();
		public function add(info:Info):void
		{
			em.save(info);
		}
		
		public function del(info:Info):void
		{
			em.remove(info);
		}
		
		public function update(info:Info):void
		{
			em.update(info);
		}
		
		public function findById(id:int):Info
		{
			var info:Info = null;
			var infoList:ArrayCollection = this.search("id=" + id);
			info = infoList.getItemAt(0) as Info;
			infoList = null;
			return info;
		}
		
		public function findAll():ArrayCollection
		{
			return em.findAll(Info);
		}
		
		public function search(condition:String):ArrayCollection
		{
			return em.search(Info,condition);
		}
		
		public function list(condition:String,pager:Pager):Pager{
			pager.setResultCount(em.getQueryCountNum(Info,condition));
			condition  = condition + " limit " + pager.getPageSize() + " offset " + (pager.getPageSize() * (pager.getPageNo() - 1));
			pager.setData(this.search(condition));
			
			condition = null;
			
			return pager;
		}
		
	}
}