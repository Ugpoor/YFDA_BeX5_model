<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model1" style="position:absolute;;left:148.0px;top:66.0px"> 
    <div component="$UI/system/components/justep/data/bizData" xid="docNodeTree"
      concept="SA_DocNode" limit="-1" isTree="true" autoLoad="true"> 
      <reader xid="default1" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default2" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default3" action="/system/logic/action/createDocNodeAction"/>  
      <filter name="filter1" xid="filter2"><![CDATA[SA_DocNode.sKind='dir']]></filter>  
      <treeOption xid="default4" parentRelation="sParentID" rootFilter="SA_DocNode.sParentID IS NULL"/>  
      <filter name="filter0" xid="filter1"><![CDATA[SA_DocNode.sFlag=1]]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="docNodeList"
      concept="SA_DocNode" limit="-1" autoLoad="true"> 
      <reader xid="default5" action="/system/logic/action/queryDocNodeAction"/>  
      <writer xid="default6" action="/system/logic/action/saveDocNodeAction"/>  
      <creator xid="default7" action="/system/logic/action/createDocNodeAction"/>  
      <filter name="filter0" xid="filter3"><![CDATA[SA_DocNode.sKind<>'dir']]></filter>  
      <filter name="filter1" xid="filter4"><![CDATA[SA_DocNode.sFlag=1]]></filter>  
      <master xid="default8" data="docNodeTree" relation="sParentID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="selectTmpDialog"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content container-fluid" xid="content1"> 
      <div class="row">
          <div class="col col-xs-3"> 
            <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" hiddenCaptionbar="true"
              xid="grid2" data="docNodeTree" appearance="tree" width="100%" height="auto"
              expandColumn="sDocName"> 
              <columns xid="columns2"> 
                <column width="" name="sDocName" xid="column1"/> 
              </columns> 
            </div> 
          </div>  
          <div class="col col-xs-9"> 
            <div component="$UI/system/components/justep/grid/grid" class="x-grid-no-bordered" hiddenCaptionbar="true"
              xid="grid3" data="docNodeList" width="100%" height="auto"> 
              <columns xid="columns3"> 
                <column name="sDocName" xid="column2"/>  
                <column width="100" name="sSize" xid="column3"/> 
              </columns> 
            </div> 
          </div> 
        </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="windowCancel" onClick="{&quot;operation&quot;:&quot;selectTmpDialog.windowCancel&quot;}"> 
        <i xid="i6"/>  
        <span xid="label6">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="windowEnsure" onClick="windowEnsureClick"> 
        <i xid="i7"/>  
        <span xid="label7">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
