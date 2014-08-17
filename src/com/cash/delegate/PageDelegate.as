package com.cash.delegate
{
	import com.cash.common.page.Pager;
	import com.cash.model.UserModel;
	import com.cash.service.InfoService;
	import com.cash.service.impl.InfoServiceImpl;
	
	import mx.rpc.IResponder;
	
	public class PageDelegate
	{
		private var responder:IResponder;
		private var pager:Pager;
		private var userModel:UserModel = UserModel.getInstance();
		public function PageDelegate(pager:Pager,responder:IResponder)
		{
			this.pager = pager;
			this.responder = responder;
		}
		
		//信息分页
		public function infoPageChange():void{
			var infoService:InfoService = new InfoServiceImpl();
			var condition:String = " createUserId = " + userModel.user.userId + " order by id desc ";
			this.pager = infoService.list(condition,this.pager);
			this.responder.result(this.pager);
		}
		
		//用户列表分页
		public function userPageChange():void{
			
		}
		
		//事项列表分页
		public function itemPageChage():void{
			
		}

	}
}