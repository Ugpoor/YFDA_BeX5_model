<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:206px;top:8px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="docNodeTree"
      concept="SA_DocNode" limit="-1" isTree="true" autoLoad="true" autoNew="false"> 
      <reader xid="default1" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default2" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default3" action="/system/logic/action/createDocNodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_DocNode.sKind='dir']]></filter>  
      <filter name="filter1" xid="filter2"><![CDATA[SA_DocNode.sFlag=1]]></filter>  
      <treeOption xid="default4" rootFilter="SA_DocNode.sParentID IS NULL" parentRelation="sParentID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered"
        xid="grid1" data="docNodeTree" hiddenCaptionbar="true" width="100%"
        height="100%" expandColumn="sDocName" appearance="tree">
        <columns xid="columns"> 
          <column width="200" name="sDocName" xid="column1" align="center"/> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row3" style="padding-top:5px;"> 
        <div class="col col-xs-8" xid="col7"></div>  
        <div class="col col-xs-4" xid="col9">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
            label="取消" xid="windowCancel" style="float:right;margin-right:15px;" onClick="windowCancelClick"> 
            <i xid="i6"/>  
            <span xid="label6">取消</span> 
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
            label="确定" xid="windowEnsure" style="float:right;margin-right:15px;" onClick="windowEnsureClick"> 
            <i xid="i7"/>  
            <span xid="label7">确定</span> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
