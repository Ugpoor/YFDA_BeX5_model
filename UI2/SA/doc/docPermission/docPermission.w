<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:202px;top:179px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="docDefineData"
      concept="SA_DocLinkDefine" limit="-1" isTree="true" autoLoad="true" columns="SA_DocLinkDefine,sProcess,sActivity,sDisplayName,version"
      onRefreshCreateParam="docDefineDataRefreshCreateParam"> 
      <reader xid="default1" action="/SA/doc/logic/action/queryDocLinkDefineAction"/>  
      <writer xid="default2" action="/SA/doc/logic/action/saveDocLinkDefineAction"/>  
      <creator xid="default3" action="/SA/doc/logic/action/createDocLinkDefineAction"/>  
      <treeOption xid="default4" parentRelation="sParentID" rootFilter="SA_DocLinkDefine.sActivity IS NUll"
        delayLoad="true" nodeKindRelation="sNodeType"/>  
      <calculateRelation relation="sNodeType" xid="calculateRelation1"/>  
      <calculateRelation relation="sParentID" xid="calculateRelation2"/>  
      <rule xid="rule4"> 
        <col name="sNodeType" xid="ruleCol6"> 
          <calculate xid="calculate6"> 
            <expr xid="default10">js: $row.val("sActivity") ? "nkLeaf" : ""</expr> 
          </calculate> 
        </col>  
        <col name="sParentID" xid="ruleCol7"> 
          <calculate xid="calculate7"> 
            <expr xid="default11">js:$model.setParentID($row,$data)</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdSelectFunTree"
    style="left:22px;top:210px;" src="$UI/SA/OPM/dialogs/selectFunction/selectMultiFunctions.w"
    title="选择功能" showTitle="true" onReceive="wdSelectFunTreeReceive" forceRefreshOnOpen="true"
    status="normal"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="keyDialog"
    style="left:22px;top:174px;" src="$UI/SA/doc/docPermission/docKeyList.w" title="key设置"
    showTitle="true" forceRefreshOnOpen="true" status="normal"/>
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="新增" xid="button1" icon="icon-android-add" bind-enable="isBtnEnable('newdef')"
      onClick="button1Click"> 
      <i xid="i1" class="icon-android-add"/>  
      <span xid="span1">新增</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="删除" xid="button2" icon="icon-android-trash" bind-enable="isBtnEnable('deldef')"
      onClick="button2Click"> 
      <i xid="i2" class="icon-android-trash"/>  
      <span xid="span2">删除</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="刷新" xid="button3" icon="icon-refresh" onClick="refreshDocDefineClick"> 
      <i xid="i3" class="icon-refresh"/>  
      <span xid="span3">刷新</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="设置文档关联" xid="button4" onClick="setDocLinkDefineClick" bind-enable="$model.docDefineData.val(&quot;sProcess&quot;) != undefined"> 
      <i xid="i4"/>  
      <span xid="span4">设置文档关联</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="删除文档关联" xid="button5" onClick="delDocLinkDefineClick" bind-enable="$model.docDefineData.val(&quot;sProcess&quot;) != undefined"> 
      <i xid="i5"/>  
      <span xid="span5">删除文档关联</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="key设置" xid="button6" onClick="button6Click" bind-enable="$model.docDefineData.val(&quot;sProcess&quot;) != undefined"> 
      <i xid="i6"/>  
      <span xid="span6">key设置</span>
    </a> 
  </div>  
      
  <div component="$UI/system/components/justep/grid/grid" xid="docLinkGrid" class="x-grid-no-bordered"
    hiddenCaptionbar="true" data="docDefineData" width="100%" appearance="treeGrid"
    expandColumn="sDisplayName" useFilterBar="true" virtualRootLabel="文档关联" useVirtualRoot="true"
    height="auto"> 
    <columns xid="columns1"> 
      <column name="sDisplayName" xid="column3"/>  
      <column name="sProcess" xid="column1" width="500"/>  
      <column width="300" name="sActivity" xid="column2"/> 
    </columns> 
  </div>  
  
</div>
