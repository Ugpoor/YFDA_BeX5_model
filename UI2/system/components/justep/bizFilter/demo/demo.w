<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:251px;top:148px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="bizData1"
      concept="SA_OPOrg" autoLoad="true"> 
      <reader xid="default1" action="/system/logic/action/queryOrgAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1"
    filterData="bizData1"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="bizFilter组件"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button3" icon="icon-chevron-left" onClick="backBtn"> 
            <i xid="i3" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">bizFilter组件</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div style="font-weight:bold;font-size:16px;color:#000000">bizFilter</div>  
      <div> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left" xid="button4" onClick="{operation:'bizFilter1.menu'}">
   <i xid="i4"></i>
   <span xid="span4">查询模板</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
          xid="button1" onClick="{operation:'bizFilter1.show'}"> 
          <i xid="i1"/>  
          <span xid="span1">保存</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          xid="button2" onClick="{operation:'bizFilter1.loadPattern'}" icon="icon-android-contacts"> 
          <i xid="i2" class="icon-android-contacts"/>  
          <span xid="span2">查询模板</span> 
        </a> 
      </div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="bizData1"> 
        <ul class="x-list-template list-group" xid="listTemplateUl1"> 
          <li xid="li1" bind-text="val('sCode') + ' | ' + val('sFName')" class="list-group-item"/> 
        </ul> 
      </div>  
      </div> 
  </div> 
</div>
