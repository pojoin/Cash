package com.cash.service.impl
{
	import com.cash.common.page.Pager;
	import com.cash.common.util.DateUtil;
	import com.cash.dao.InfoDao;
	import com.cash.dao.impl.InfoDaoImpl;
	import com.cash.service.InfoService;
	import com.cash.vo.Info;
	
	import mx.collections.ArrayCollection;

	public class InfoServiceImpl implements InfoService
	{
		private var infoDao:InfoDao = new InfoDaoImpl();
		public function addInfo(info:Info):void
		{
			info.createTime = DateUtil.convertDateToString(new Date,DateUtil.YYYY_MM_DD);
			this.infoDao.add(info);
		}
		
		public function delInfo(info:Info):void
		{
			this.infoDao.del(info);
		}
		
		public function update(info:Info):void
		{
			this.infoDao.update(info);
		}
		
		public function findById(id:int):Info
		{
			return this.infoDao.findById(id);
		}
		
		public function findAll():ArrayCollection
		{
			return this.infoDao.findAll();
		}
		
		public function search(condition:String):ArrayCollection
		{
			return this.infoDao.search(condition);
		}
		
		public function list(condition:String,pager:Pager):Pager{
			
			return this.infoDao.list(condition,pager);
		}
		
	}
}