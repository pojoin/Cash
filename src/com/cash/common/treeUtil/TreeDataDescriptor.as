package com.cash.common.treeUtil
{
    import flash.utils.Dictionary;
    
    import mx.collections.ArrayCollection;
    import mx.collections.ICollectionView;
    import mx.collections.XMLListCollection;
    import mx.controls.treeClasses.DefaultDataDescriptor;
    import mx.controls.treeClasses.ITreeDataDescriptor;

    public class TreeDataDescriptor extends DefaultDataDescriptor implements ITreeDataDescriptor
    {
        /**
         *  Constructor.
         */
        public function TreeDataDescriptor(children:String=null)
        {
            super();
            childrenField=children;
            //trace('TreeDataDescriptor Constructor, ' + childrenField);
        }

        /**
         *  @private
         */
        private var ChildCollectionCache:Dictionary=new Dictionary(true);

        [Bindable]
        public var childrenField:String=null;

        override public function getChildren(node:Object, model:Object=null):ICollectionView
        {
//            trace(node);
            var childrenCollection:ICollectionView=super.getChildren(node, model);
            var children:*;
            if (childrenCollection != null)
            {
//                trace('super.getChildren =', childrenCollection);
                return childrenCollection;
            }
            children=node[childrenField];
            trace(children);

            //then wrap children in ICollectionView if necessary
            if (children is ICollectionView)
            {
                childrenCollection=ICollectionView(children);
            }
            else if (children is Array)
            {
                var oldArrayCollection:ArrayCollection=ChildCollectionCache[node];
                if (!oldArrayCollection)
                {
                    childrenCollection=new ArrayCollection(children);
                    ChildCollectionCache[node]=childrenCollection;
                }
                else
                {
                    childrenCollection=oldArrayCollection;
                    //ArrayCollection(childrenCollection).mx_internal::dispatchResetEvent=false;
                    ArrayCollection(childrenCollection).source=children;
                }

            }
            else if (children is XMLList)
            {
                var oldXMLCollection:XMLListCollection=ChildCollectionCache[node];
                if (!oldXMLCollection)
                {
                    // double check since XML as dictionary keys is inconsistent
                    for (var p:*in ChildCollectionCache)
                    {
                        if (p === node)
                        {
                            oldXMLCollection=ChildCollectionCache[p];
                            break;
                        }
                    }
                }

                if (!oldXMLCollection)
                {
                    childrenCollection=new XMLListCollection(children);
                    ChildCollectionCache[node]=childrenCollection;
                }
                else
                {
                    childrenCollection=oldXMLCollection;

                    //We don't want to send a RESET type of collectionChange event in this case. 
                    //XMLListCollection(childrenCollection).mx_internal::dispatchResetEvent=false;
                    XMLListCollection(childrenCollection).source=children;
                }
            }
            else
            {
                var childArray:Array=new Array(children);
                if (childArray != null)
                {
                    childrenCollection=new ArrayCollection(childArray);
                }
            }
            return childrenCollection;
        }

        /**
         *  Tests a node for termination.
         *  Branches are non-terminating but are not required to have any leaf nodes.
         *  If the node is XML, returns <code>true</code> if the node has children
         *  or a <code>true isBranch</code> attribute.
         *  If the node is an object, returns <code>true</code> if the node has a
         *  (possibly empty) <code>children</code> field.
         *
         *  @param node The node object currently being evaluated.
         *  @param model The collection that contains the node; ignored by this class.
         *
         *  @return <code>true</code> if this node is non-terminating.
         */
        override public function isBranch(node:Object, model:Object=null):Boolean
        {
            var branch:Boolean = super.isBranch(node,model);
            if (branch)return branch;
            if (node == null)
                return false;
            if (node is Object)
            {
                try
                {
                    if (node[childrenField] != undefined)
                    {
                        branch=true;
                    }
                }
                catch (e:Error)
                {
                }
            }
            return branch;
        }

    }

}