package com.cash.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.cash.common.treeUtil.ConverArrayCollectionToNode;
	import com.cash.delegate.ItemDelegate;
	import com.cash.model.TreeModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;

	public class LoadItemTreeDataCommand implements Command, IResponder
	{
		private var treeModel:TreeModel = TreeModel.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var itemDelegate:ItemDelegate = new ItemDelegate(this);
			itemDelegate.loadItemTreeData();
		}
		
		public function result(data:Object):void
		{
			var resultData:ArrayCollection = data as ArrayCollection;
			if(resultData == null){
				resultData = new ArrayCollection();
			}
			var conver:ConverArrayCollectionToNode = new ConverArrayCollectionToNode();
			this.treeModel.treeDate = conver.conver(resultData);
			resultData = null;
			conver = null;
			data = null;
		}
		
		public function fault(info:Object):void
		{
		}
		
	}
}