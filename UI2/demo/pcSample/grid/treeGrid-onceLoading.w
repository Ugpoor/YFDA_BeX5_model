<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:317px;top:605px;"><div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="areaData" queryAction="queryRegionTree" tableName="takeout_region" url="/justep/demo" idColumn="fID" isTree="true" limit="-1"><column label="fID" name="fID" type="Integer" xid="default2"></column>
  <column label="fName" name="fName" type="String" xid="default3"></column>
  <column label="fParentID" name="fParentID" type="Integer" xid="default4"></column>
  <column label="fType" name="fType" type="String" xid="default5"></column>
  <column label="fPostCode" name="fPostCode" type="String" xid="default6"></column>
  <column label="fPhoneNumber" name="fPhoneNumber" type="String" xid="default7"></column>
  <treeOption xid="default8" parentRelation="fParentID" delayLoad="false"></treeOption></div></div> 
<h4 xid="h41"><![CDATA[树形表格一次加载]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" xid="areaGrid" data="areaData" appearance="treeGrid" expandColumn="fID" width="100%" height="auto">
   <columns xid="columns1"><column name="fID" xid="column1"></column>
  <column name="fName" xid="column2"></column>
  <column name="fParentID" xid="column3"></column>
  <column name="fType" xid="column4"></column></columns></div></div>