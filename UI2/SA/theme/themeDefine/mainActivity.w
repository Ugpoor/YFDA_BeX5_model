<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:189px;top:254px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="main" concept="Portal2Profiles" columns="Portal2Profiles,version,sPersonID,sThemeActivity,sPortal,sOther,sPublishType,sThemeName"
      onBeforeRefresh="mainBeforeRefresh"> 
      <reader xid="default1" action="/portal2/logic/action/queryPortal2ProfilesAction"/>  
      <writer xid="default2" action="/portal2/logic/action/savePortal2ProfilesAction"/>  
      <creator xid="default3" action="/portal2/logic/action/createPortal2ProfilesAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[Portal2Profiles.sPublishType='system4portal3']]></filter>  
      <rule xid="rule1"> 
        <col name="sThemeName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default5">true</expr>
          </required> 
        </col> 
      </rule>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      label="新建" xid="addBtn" icon="icon-plus" style="margin-left:10px;" onClick="addBtnClick"> 
      <i xid="i1" class="icon-plus"/>  
      <span xid="span1">新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="启用" xid="playBtn" icon="icon-play" style="margin-left:10px;" bind-enable="$model.main.val(&quot;sThemeActivity&quot;) == &quot;disable&quot;" onClick="playBtnClick"> 
      <i xid="i2" class="icon-play"/>  
      <span xid="span2">启用</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="停用" xid="stopBtn" icon="icon-stop" style="margin-left: 10px;" bind-enable="$model.main.val(&quot;sThemeActivity&quot;) != &quot;disable&quot;" onClick="stopBtnClick"> 
      <i xid="i3" class="icon-stop"/>  
      <span xid="span3">停用</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" icon="glyphicon glyphicon-floppy-disk" style="margin-left:10px;"
      onClick="{operation:'main.save'}"> 
      <i xid="i4" class="glyphicon glyphicon-floppy-disk"/>  
      <span xid="span4">保存</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="刷新" xid="refreshBtn" style="margin-left:10px;" icon="icon-refresh" onClick="{operation:'main.refresh'}"> 
      <i xid="i5" class="icon-refresh"/>  
      <span xid="span5">刷新</span> 
    </a> 
  </div>  
  <!-- 
  <div component="$UI/system/components/justep/grid/grid" xid="grid"
    height="auto" class="x-grid-no-bordered x-grid-no-border" data="main"> 
    <columns xid="columns1"> 
    </columns> 
  </div> 
   -->  
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
    altRows="true" class="x-grid-no-bordered" xid="grid" data="main" onCellRender="gridCellRender"> 
    <columns xid="columns2">
      <column width="100" name="sThemeActivity" xid="column3" label="状态" align="left"/>  
      <column width="400" name="sThemeName" xid="column4" label="主题名" align="left"
        editable="true">
        <editor xid="editor1"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" bind-ref="ref('sThemeName')"/>
        </editor>
      </column>
    </columns>
  </div>
</div>
