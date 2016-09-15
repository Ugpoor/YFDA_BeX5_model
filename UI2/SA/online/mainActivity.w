<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:122px;top:86px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mainData" onCustomRefresh="mainDataCustomRefresh" idColumn="sessionid" confirmRefresh="false"> 
      <column label="用户" name="name" type="String" xid="default1"/>  
      <column label="登录IP" name="loginIP" type="String" xid="default2"/>  
      <column label="登录时间" name="loginDate" type="String" xid="default3"/>  
      <column label="会话标识" name="sessionid" type="String" xid="default4"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick="{operation:'mainData.refresh'}"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <span class="control-label" xid="label"><![CDATA[当前在线用户数：]]></span>
    <span class="control-label" xid="number"/>  
  </div>
<div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="tables" data="mainData" pagingType="simple_numbers">
   <columns xid="columns1"><column name="name" xid="column1" orderable="false"></column>
  <column name="loginIP" xid="column2" orderable="false"></column>
  <column name="loginDate" xid="column3" orderable="false"></column>
  <column name="sessionid" xid="column4" orderable="false"></column></columns></div></div>
