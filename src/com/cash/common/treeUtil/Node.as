package com.cash.common.treeUtil
{
	import com.cash.vo.Item;
	
	import mx.collections.ListCollectionView;
	
	public class Node
	{
		public function Node()
		{
		}
		
		private var _childNodes:ListCollectionView;
		private var _name:String;
		private var _item:Item;
		
		public function get childNodes():ListCollectionView{
			return this._childNodes;
		}
		
		public function set childNodes(childNodes:ListCollectionView):void{
			this._childNodes = childNodes;
		}
		
		public function get name():String{
			return this._name;
		}
		
		public function set name(name:String):void{
			this._name = name;
		}
		
		public function get item():Item{
			return this.item;
		}
		
		public function set item(item:Item):void{
			this.item = item;
		}

	}
}