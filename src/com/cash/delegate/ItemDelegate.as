package com.cash.delegate
{
	import com.cash.model.UserModel;
	import com.cash.service.ItemService;
	import com.cash.service.impl.ItemServiceImpl;
	import com.cash.vo.Item;
	import com.cash.vo.User;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	
	public class ItemDelegate
	{
		private var responder:IResponder;
		private var itemService:ItemService = new ItemServiceImpl();
		private var user:User = UserModel.getInstance().user;
		public function ItemDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		//新增
		public function addItem(item:Item):void{
			item.creatUserId = user.userId;
			try{
				this.itemService.addItem(item);
				this.responder.result(item);
			}catch(e:Error){
				this.responder.fault(item);
			}
		}
		//删除
		public function delItem(itemArray : Array):void{
			try{
				for each(var item : Item in itemArray){
					this.itemService.delItem(item);
				}
				this.responder.result(null);
			}catch(e:Error){
				this.responder.fault(null);
			}
		}
		
		//更新
		public function update(item : Item):void{
			try{
				this.itemService.updateItem(item);
				this.responder.result(item);
			}catch(e:Error){
				this.responder.fault(item);
			}
		}
		
		//加载树型菜单数据
		public function loadItemTreeData():void{
			try{
				var condition : String = " createUserId = " + this.user.userId + " order by sn asc,id desc";
				var resultData : ArrayCollection = this.itemService.search(condition);
				this.responder.result(resultData);
			}catch(e:Error){
				this.responder.fault(null);
			}
			
		}

	}
}