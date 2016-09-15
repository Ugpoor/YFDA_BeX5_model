<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:240px;top:47px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="treeData" idColumn="id" onCustomRefresh="treeDataCustomRefresh" isTree="true"> 
      <treeOption xid="default9" parentRelation="parent" nodeKindRelation="nodeKind"/>  
      <column name="id" type="String" xid="default1"/>  
      <column name="label" type="String" xid="default2"/>  
      <column name="path" type="String" xid="default3"/>  
      <column name="isFolder" type="String" xid="default4"/>  
      <column name="process" type="String" xid="default5"/>  
      <column name="activity" type="String" xid="default6"/>  
      <column name="url" type="String" xid="default7"/>  
      <column name="parent" type="String" xid="default8"/>  
      <column name="nodeKind" type="String" xid="default10"/> 
    <rule xid="rule1">
   <col name="nodeKind" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default11">$row.val(&quot;isFolder&quot;)  ? '' : 'nkLeaf'</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="listData" idColumn="id" onCustomRefresh="listDataCustomRefresh"> 
      <column name="id" type="String" xid="column6"/>  
      <column name="label" type="String" xid="column7"/>  
      <column name="path" type="String" xid="column8"/>  
      <column name="isFolder" type="String" xid="column9"/>  
      <column name="process" type="String" xid="column2"/>  
      <column name="activity" type="String" xid="column3"/>  
      <column name="url" type="String" xid="column4"/>  
      <column name="parent" type="String" xid="column5"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:181px;top:258px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel2"> 
    <div class="x-panel-content x-bordered" xid="content1"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full x-bordered"
        active="0" xid="contents1"> 
        <div class="x-contents-content" xid="treeContent"> 
          <div component="$UI/system/components/justep/smartContainer/smartContainer"
            class="x-smartcontainer" xid="smartContainer1"> 
            <div component="$UI/system/components/justep/grid/grid" xid="treeGrid"
              data="treeData" height="auto" hiddenCaptionbar="true" appearance="tree"
              expandColumn="label" multiselect="true" cascade="true" class="x-grid-no-bordered"
              width="100%"> 
              <columns xid="columns1"> 
                <column name="label" xid="column1"/> 
              </columns> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="listContent"> 
          <div component="$UI/system/components/justep/grid/grid" xid="listGrid"
            data="listData" width="100%" height="100%" hiddenCaptionbar="true" multiselect="true"> 
            <columns xid="columns2"> 
              <column name="path" xid="column10" label="功能"/> 
            </columns> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;windowReceiver.windowCancel&quot;}"> 
        <i xid="i1"/>  
        <span xid="span1">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
