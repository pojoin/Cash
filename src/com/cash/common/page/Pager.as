package com.cash.common.page
{
	import mx.collections.ArrayCollection;
	
	public class Pager
	{
		
		private var startRow:int;
		
		//当前页
		private var pageNo:int = 1;
		//总页数
		private var pageCount:int;
		//每页显示的数据的条数
		private var pageSize:int = 17;
		
		//总的数据条数
		private var resultCount:int;
		
		//数据
		private var data:ArrayCollection;
		
		public function getStartRow():int{
			startRow=pageSize*(pageNo-1)+1;
			return startRow;
		}
		
		public function setPageNo(pageNo:int):void{
			this.pageNo = pageNo;
		}
		
		public function getPageNo():int{
			return this.pageNo;
		}
		
		public function setPageSize(pageSize:int):void{
			this.pageSize = pageSize;
		}
		
		public function getPageSize():int{
			return this.pageSize;
		}
		
		public function setPageCount(pageCount:int):void{
			this.pageCount = pageCount;
		}
		
		public function getPageCount():int{
			if(resultCount%pageSize==0){
				pageCount=resultCount/pageSize;
			}
			else{
				pageCount=resultCount/pageSize+1;
			}
			return pageCount;
		}
		
		public function setResultCount(resultCount:int):void{
			this.resultCount = resultCount;
		}
		
		public function getResultCount():int{
			return this.resultCount;
		}
		
		public function setData(data:ArrayCollection):void{
			this.data = data;
		}
		
		public function getData():ArrayCollection{
			return this.data;
		}

	}
}