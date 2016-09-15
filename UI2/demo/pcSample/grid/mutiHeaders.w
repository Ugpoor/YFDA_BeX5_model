<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:372px;top:569px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="employeeData" idColumn="name" onCustomRefresh="employeeDataCustomRefresh"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="性别" name="sex" type="String" xid="xid2"></column>
  <column label="部门" name="dept" type="String" xid="xid3"></column>
  <column label="学历" name="enducation" type="String" xid="xid4"></column>
  <column label="ID" name="id" type="String" xid="xid5"></column></div></div> 
<h4 xid="h41"><![CDATA[多表头支持]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-title-center" xid="employeeGrid" data="employeeData" multiselect="true" showRowNumber="true" width="100%" multiboxonly="false" useFilterBar="false" height="auto">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="sex" xid="column2"></column>
  <column name="dept" xid="column3"></column>
  <column name="enducation" xid="column4"></column>
  <column name="id" xid="column5"></column></columns>
  <groupHeaders xid="default61">
   <groupHeader xid="default62">
    <item columnCount="3" startColumn="name" titleText="个人信息" xid="default63"></item></groupHeader> 
   <groupHeader xid="default64">
    <item columnCount="2" startColumn="name" titleText="基本信息" xid="default65"></item></groupHeader> </groupHeaders></div></div>