package com.cash.common.treeUtil
{
	import com.cash.vo.Item;
	
	import mx.collections.ArrayCollection;
	
	public class ConverArrayCollectionToNode
	{
		public function conver(resultData:ArrayCollection):ArrayCollection{
			var treeDate:ArrayCollection = new ArrayCollection();
			var root:Node = new Node();
			root.name = "事项";
			this.createNode(resultData,0,root);
			treeDate.addItem(root);
			return treeDate;
		}
		
		private function generate(item:Item,parent:Node):Node{
			var node:Node = new Node();
			node.name = item.name;
			if(parent != null){
				if(parent.childNodes == null){
					parent.childNodes = new ArrayCollection();
				}
				parent.childNodes.addItem(node);
			}
			return node;
		}
		
		private function createNode(resultData:ArrayCollection,parentId:int,parentNode:Node):void{
			for(var i:int=0;i<resultData.length;i++){
				var item:Item = resultData.getItemAt(i) as Item;
				if(item.parentId == parentId){
					var node:Node = this.generate(item,parentNode);
					this.createNode(resultData,item.itemid,node);
				}
			}
		}
	}
}