<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:220px;top:270px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="bizData1"
      concept="SA_OPOrg" autoLoad="true"> 
      <reader xid="default1" action="/system/logic/action/queryOrgAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="orgFilter"> 
        <div class="x-titlebar-left" xid="div2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button3" icon="icon-chevron-left" onClick="backBtn"> 
            <i xid="i5" class="icon-chevron-left"/>  
            <span xid="span5"/>
          </a>
        </div>  
        <div class="x-titlebar-title" xid="div3">orgFilter</div>  
        <div class="x-titlebar-right reverse" xid="div4"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="div1" style="height:auto;padding:5px;"> 
        <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter1" filterData="bizData1" orgFIDCol="sFID" personIDCol="sPersonID" defaultValue="_myself_" useMyself="true">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" multiselect="true">
    <option xid="option1">
     <columns xid="columns1">
      <column name="sName" xid="column1"></column></columns> </option> </div> </div></div>  
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="bizData1" limit="20"> 
        <ul class="x-list-template list-group" xid="listTemplateUl1"> 
          <li xid="li1" class="list-group-item"> 
            <label xid="label1" bind-text="ref('sFName')">label</label>  
            </li> 
        </ul> 
      </div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1"/> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:324px;top:203px;"/>
</div>
