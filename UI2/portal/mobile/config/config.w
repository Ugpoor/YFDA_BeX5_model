<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:353px;top:6px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="skins" idColumn="fName" autoLoad="true"> 
      <column name="fName" type="String" label="名称"/>  
      <column name="fLabel" type="String" label="显示名称"/>  
      <data xid="default3">[{&quot;fName&quot;:&quot;default&quot;,&quot;fLabel&quot;:&quot;默认&quot;},{&quot;fName&quot;:&quot;superhero&quot;,&quot;fLabel&quot;:&quot;Supor hero&quot;},{&quot;fName&quot;:&quot;slate&quot;,&quot;fLabel&quot;:&quot;Slate&quot;},{&quot;fName&quot;:&quot;united&quot;,&quot;fLabel&quot;:&quot;United&quot;},{&quot;fName&quot;:&quot;yeti&quot;,&quot;fLabel&quot;:&quot;Yeti&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" xid="langs" idColumn="fName"> 
      <column name="fName" type="String" label="名称"/>  
      <column name="fLabel" type="String" label="显示名称"/>  
      <data><![CDATA[
      [{fName:'zh-CN', fLabel:'中文'}]
      ]]></data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="配置"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">配置</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基础配置" xid="baseGroup"> 
        <div class="x-control-group-title" xid="baseGroupLabel">基础设置</div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="skinRow"> 
          <div class="x-col x-col-80" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="skinField" style="margin:0;"> 
              <label class="x-label" xid="skinLabel"><![CDATA[主题]]></label>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="skinSel" bind-options="skins" bind-optionsLabel="fLabel" bind-optionsValue="fName"/> 
            </div> 
          </div>  
          <div class="x-col" xid="col5"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="应用" xid="skinSaveBtn" onClick="skinSaveBtnClick"> 
              <i xid="i12"/>  
              <span xid="span22">应用</span> 
            </a> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="langRow"> 
          <div class="x-col x-col-80" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="langField" style="margin:0;"> 
              <label class="x-label" xid="langLabel"><![CDATA[语言]]></label>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="langSel" bind-options="langs" bind-optionsLabel="fLabel" bind-optionsValue="fName"/> 
            </div> 
          </div>  
          <div class="x-col" xid="col7"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-primary"
              label="应用" xid="langSaveBtn" onClick="langSaveBtnClick"> 
              <i xid="i3"/>  
              <span xid="span33">应用</span> 
            </a> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="高级设置" xid="advanceGroup"> 
        <div class="x-control-group-title" xid="advanceGroupLabel">高级设置</div>  
        <div component="$UI/system/components/justep/row/row" class="x-row"
          xid="row1"> 
          <div class="x-col" xid="col1" style="vertical-align:middle;"><label class="x-label"><![CDATA[是否显示调试菜单, 为开发者使用.]]></label></div>  
          <div class="x-col x-col-20" xid="col2">
            <span component="$UI/system/components/justep/button/toggle" class="x-toggle"
              xid="toggleDebug" onChange="toggleDebugChange"/>
          </div> 
        </div>
      </div> 
    </div> 
  </div> 
</div>
