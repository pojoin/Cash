package com.cash.delegate
{
	import com.cash.model.UserModel;
	import com.cash.service.InfoService;
	import com.cash.service.impl.InfoServiceImpl;
	import com.cash.vo.Info;
	import com.cash.vo.User;
	
	import mx.rpc.IResponder;
	
	public class InfoDelegate
	{
		private var infoService:InfoService = new InfoServiceImpl();
		private var responder:IResponder;
		private var user:User = UserModel.getInstance().user;
		public function InfoDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		//添加信息 
		public function addInfo(info:Info):void{
			try{
				info.createUserId = user.userId;
				this.infoService.addInfo(info);
				this.responder.result(info);
			}catch(e:Error){
				this.responder.fault(info);
			}
		}
		
		//删除信息
		public function delInfo(infoArray:Array):void{
			try{
				for each(var info:Info in infoArray){
					this.infoService.delInfo(info);
				}
				this.responder.result(null);
			}catch(e:Error){
				this.responder.fault(null);
			}
		}
		
		//更新信息
		public function updateInfo(info:Info):void{
			try{
				this.infoService.update(info);
				this.responder.result(info);
			}catch(e:Error){
				this.responder.fault(null);
			}
		}

	}
}