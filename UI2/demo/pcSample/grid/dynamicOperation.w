<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:246px;top:417px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="employeeData" limit="-1" idColumn="id" onCustomRefresh="employeeDataCustomRefresh" confirmDelete="false"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="姓名" name="name" type="String" xid="xid2"></column>
  <column label="性别" name="sex" type="String" xid="xid3"></column>
  <column label="部门" name="dept" type="String" xid="xid4"></column>
  <column label="学历" name="enducation" type="String" xid="xid5"></column></div></div> 
<h4 xid="h41" class="center-block"><![CDATA[动态表格操作]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i12"></i>
   <span xid="span12">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i13"></i>
   <span xid="span13">源码</span></a></h4><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="获取当前选中行的值" xid="currentRow" onClick="currentRowClick">
   <i xid="i1"></i>
   <span xid="span1">获取当前选中行的值</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="获得第一行的值" xid="firstRow" onClick="firstRowClick">
   <i xid="i2"></i>
   <span xid="span2">获得第一行的值</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="获得id为2的行的值" xid="idRow" onClick="idRowClick">
   <i xid="i3"></i>
   <span xid="span3">获得id为2的行的值</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="删除选中行" xid="delete" onClick="deleteClick">
   <i xid="i5"></i>
   <span xid="span5">删除选中行</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="追加尾行" xid="addLastRow" onClick="addLastRowClick">
   <i xid="i7"></i>
   <span xid="span7">追加尾行</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="在选中行前插入" xid="beforeRow" onClick="beforeRowClick">
   <i xid="i8"></i>
   <span xid="span8">在选中行前插入</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="在选中行后追加" xid="afterRow" onClick="afterRowClick">
   <i xid="i9"></i>
   <span xid="span9">在选中行后追加</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="上移行" xid="moveUp" onClick="moveUpClick">
   <i xid="i10"></i>
   <span xid="span10">上移行</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="插入首行" xid="insertFirstRow" onClick="insertFirstRowClick">
   <i xid="i6"></i>
   <span xid="span6">插入首行</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="下移行" xid="moveDown" onClick="moveDownClick">
   <i xid="i11"></i>
   <span xid="span11">下移行</span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="employeeGrid" data="employeeData" multiselect="true" showRowNumber="true" width="100%" height="100%">
   <columns xid="columns1"><column name="name" xid="column6" editable="true"></column>
  <column name="sex" xid="column7" editable="true"></column>
  <column name="dept" xid="column8" editable="true"></column>
  <column name="enducation" xid="column9" editable="true"></column>
  <column name="id" xid="column10" hidden="true"></column></columns></div></div>