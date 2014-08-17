package com.cash.model
{
	import mx.collections.ArrayCollection;
	
	
	[Bindable]
	public class PageModel
	{
		private static var _instance:PageModel;
		
		private var startRow:int;
		//当前页
		public var pageNo:int = 1;
		//总页数
		public var pageCount:int;
		//每页显示的数据的条数
		public var pageSize:int = 17;
		
		//总的数据条数
		public var resultCount:int;
		
		//下一页
		private var pageNext:int;
		//下一页
		private var pagePrevious:int;
		
		//是否有上一页
		private var _isPagePrevious:Boolean;
		
		//是否有下一页
		private var _isPagerNext:Boolean;
		
		//数据
		
		public var data:ArrayCollection;
		
		public var comboBoxData:ArrayCollection;
		
		public var comboBoxSelectIndex:int;
		
		
		public static function getInstance():PageModel{
			if(_instance == null){
				_instance = new PageModel();
			}
			return _instance;
		}
		
		public function getPageNext():int{
			if(pageNo<pageCount){
				pageNext=pageNo+1;
			}
			else{
				pageNext=pageNo;
			}
			return pageNext;
		}
		
		public function getPagePrevious():int{
			if(pageNo>1){
				pagePrevious=pageNo-1;
			}
			else{
				return pagePrevious=pageNo;
			}
			return pagePrevious;
		}
		
		public function get isPageNext():Boolean{
			if(pageNo>=pageCount){
				return false;
			}
			else{
				return true;
			}
		}
		
		public function get isPagePrevious():Boolean{
			if(pageNo<=1){
				return false;
			}
			else{
				return true;
			}
		}
		
		public function getStartRow():int{
			startRow=pageSize*(pageNo-1)+1;
			return startRow;
		}
		
		public function initComboBoxData():void{
			this.comboBoxData = new ArrayCollection();
			for(var i:int = 1 ;i <= this.pageCount ;i ++){
				var obj:Object = new Object();
				obj.num = i;
				this.comboBoxData.addItem(obj);
				obj = null;
			}
			this.comboBoxSelectIndex = this.pageNo -1;
		}
	}
}