<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:338px;top:624px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="userData" idColumn="fID" onCustomRefresh="userDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="姓名" name="fName" type="String" xid="xid2"></column>
  <column label="电话" name="fPhoneNumber" type="String" xid="xid3"></column>
  <column label="住址" name="fAddress" type="String" xid="xid4"></column>
  <column label="订单数" name="orderCount" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderData" idColumn="fID" onCustomRefresh="orderDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid6"></column>
  <column label="创建时间" name="fCreateTime" type="String" xid="xid7"></column>
  <column label="内容" name="fContent" type="String" xid="xid8"></column>
  <column label="总数" name="fSum" type="String" xid="xid9"></column>
  <column label="用户ID" name="fUserID" type="String" xid="xid10"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid11"></column>
  <column label="电话" name="fPhoneNumber" type="String" xid="xid12"></column>
  <column label="住址" name="fAddress" type="String" xid="xid13"></column>
  <master data="userData" relation="fUserID" xid="default1"></master>
  <column label="操作" name="op" type="String" xid="xid14"></column></div></div> 
<h4 xid="h41"><![CDATA[主从表格]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs3">
   <ul class="nav nav-tabs" xid="ul2">
    <li class="active" xid="li4">
     <a content="masterContent" xid="tabItem4"><![CDATA[主表]]></a></li> 
    <li role="presentation" xid="li5">
     <a content="detailContent" xid="tabItem5"><![CDATA[从表]]></a></li> </ul> 
   <div class="tab-content" xid="div2">
    <div class="tab-pane active" xid="masterContent"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="userGrid" data="userData" height="auto" width="100%">
   <columns xid="columns1"><column name="fName" xid="column1" width="100"></column>
  <column name="fPhoneNumber" xid="column2" width="200"></column>
  <column name="fAddress" xid="column3"></column>
  <column name="orderCount" xid="column4"></column></columns></div></div>
    <div class="tab-pane" xid="detailContent"><div xid="div1" name="bb"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="新增" xid="add" onClick="addClick">
   <i xid="i3"></i>
   <span xid="span3">新增</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="批量删除" xid="button2" disabled="true">
   <i xid="i4"></i>
   <span xid="span4">批量删除</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导入" xid="button3" disabled="true">
   <i xid="i5"></i>
   <span xid="span5">导入</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导出全部" xid="button4" disabled="true">
   <i xid="i6"></i>
   <span xid="span6">导出全部</span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="orderGrid" data="orderData" height="auto" width="100%" onCellRender="orderGridCellRender" onRowClick="orderGridRowClick">
   <columns xid="columns2"><column name="fCreateTime" xid="column5" width="160"></column>
  <column name="fContent" xid="column6"></column>
  
  <column name="fPhoneNumber" xid="column9" width="100"></column>
  <column name="fAddress" xid="column10"></column>
  <column width="170" name="op" xid="column7"></column></columns></div></div></div></div> </div>
  
  
  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" resizable="false" width="40%" height="53%" status="normal" onReceive="windowDialogReceive" forceRefreshOnOpen="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="updateWindowDialog" width="40%" height="53%" src="update.w" forceRefreshOnOpen="true" status="normal"><result concept="orderData" operation="edit" origin="orderData" xid="default30">
   <mapping from="fID" to="fID" locator="true" xid="default31"></mapping>
   <mapping from="fCreateTime" to="fCreateTime" xid="default32"></mapping>
   <mapping from="fContent" to="fContent" xid="default33"></mapping>
   <mapping from="fPhoneNumber" to="fPhoneNumber" xid="default34"></mapping>
   <mapping from="fUserName" to="fUserName" xid="default35"></mapping>
   <mapping from="fAddress" to="fAddress" xid="default36"></mapping></result></span></div>