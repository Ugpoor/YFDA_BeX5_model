<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:220px;top:270px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="bizData1"
      concept="SA_OPOrg" autoLoad="true"> 
      <reader xid="default1" action="/system/logic/action/queryOrgAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="smartFilter"> 
        <div class="x-titlebar-left" xid="div2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button3" icon="icon-chevron-left" onClick="backBtn"> 
            <i xid="i5" class="icon-chevron-left"/>  
            <span xid="span5"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div3">smartFilter</div>  
        <div class="x-titlebar-right reverse" xid="div4"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1" style="padding:8.75px"> 
      <h3>smartFilter
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="源码" xid="button4" onClick="showSFSource"> 
          <i xid="i6"/>  
          <span xid="span6">源码</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="js" xid="button5" onClick="showJsSource"> 
          <i xid="i7"/>  
          <span xid="span7">js</span>
        </a>
      </h3>  
      <div xid="div1" style="height:auto;padding:5px;"> 
        <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
          xid="smartFilter" filterData="bizData1" filterCols="sName,sCode"> 
          <span class="input-group-addon" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
            xid="span1"> 
            <i class="icon-android-search" xid="i1"/> 
          </span>  
          <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
            bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
            xid="input1"/>  
          <span class="input-group-addon" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
            bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
            xid="span2"> 
            <i class="icon-close-circled" xid="i2"/> 
          </span> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="bizData1" limit="5"> 
        <ul class="x-list-template list-group" xid="listTemplateUl1"> 
          <li xid="li1" class="list-group-item"> 
            <label xid="label1" bind-text="ref('sName')">label</label>  
            <label xid="label2" bind-text="ref('sCode')">label</label> 
          </li> 
        </ul> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="动态创建" xid="button1" style="margin-left: 50px" onClick="dynamicCreate"> 
        <i xid="i4"/>  
        <span xid="span4">动态创建</span> 
      </a> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:324px;top:203px;"/>
</div>
