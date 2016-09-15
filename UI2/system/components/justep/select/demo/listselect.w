<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:551px;top:124px;"> 
    <div component="$UI/system/components/justep/data/data" xid="itemData"
      idColumn="fValue" autoLoad="true"> 
      <column label="值" name="fValue" type="String" xid="xid1"/>  
      <column label="显示名称" name="fName" type="String" xid="xid2"/>  
      <column label="类型" name="type" type="String" xid="xid3"/>  
      <data xid="default10">[{"fValue":"black","fName":"黑色","type":"1"},{"fValue":"red","fName":"红色","type":"2"},{"fValue":"green","fName":"绿色","type":"1"},{"fValue":"blue","fName":"蓝色","type":"1"},{"fValue":"orange","fName":"橙色","type":"2"},{"fValue":"yellow","fName":"黄色","type":"1"},{"fValue":"purple","fName":"紫色","type":"2"},{"fValue":"gray","fName":"灰色","type":"2"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="mainData"
      idColumn="fID" autoLoad="true"> 
      <column label="ID" name="fID" type="String" xid="default4"/>  
      <column label="单选值" name="fSingleValue" type="String" xid="default5"/>  
      <column label="单选显示值" name="fSingleLabel" type="String" xid="default6"/>  
      <data xid="default12">[{"fID":"1","fSingleValue":"black","fSingleLabel":"黑色"},{"fID":"2","fSingleValue":"red","fSingleLabel":"红色"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="select"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">select</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="js" onClick="showJsSource"> 
        <i/>  
        <span>js</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="源码" onClick="showSource" bind-visible="isVisible"> 
        <i/>  
        <span>源码</span> 
      </a>  
      <p xid="p1">通过select的bind-options设置表达式：$model.getItems($object)，实现list中的select组件option根据所在行显示不同数据</p>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list2" data="mainData"> 
        <ul class="x-list-template" xid="listTemplateUl2"> 
          <li xid="li2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelSelect1"> 
              <label class="x-label" xid="label1"><![CDATA[选择]]></label>  
              <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
                xid="select1" bind-options="$model.getItems($object)" bind-ref="ref('fSingleValue')"
                bind-labelRef="ref('fSingleLabel')" bind-optionsValue="fValue" bind-optionsLabel="fName"/> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" status="normal"/>
</div>
