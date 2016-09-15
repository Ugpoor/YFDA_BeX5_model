<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:251px;top:148px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="bizData1"
      concept="SA_OPOrg" autoLoad="true"> 
      <reader xid="default1" action="/system/logic/action/queryOrgAction"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="bizData2" concept="SA_OPOrg" autoLoad="true">
   <reader xid="default2" action="/system/logic/action/queryOrgAction"></reader></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1"
    filterData="bizData1"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="gridFilter组件"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button3" icon="icon-chevron-left" onClick="backBtn"> 
            <i xid="i3" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">gridFilter组件</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div style="font-weight:bold;font-size:16px;color:#000000">gridFilter</div>  
      <div> 
        <div component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="bizData1" filterCol="sName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="bizData2" value="sName" label="sName"></option></div> </div></div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="bizData1"> 
        <ul class="x-list-template list-group" xid="listTemplateUl1"> 
          <li xid="li1" bind-text="val('sCode') + ' | ' + val('sFName')" class="list-group-item"/> 
        </ul> 
      </div>  
      </div> 
  </div> 
</div>
