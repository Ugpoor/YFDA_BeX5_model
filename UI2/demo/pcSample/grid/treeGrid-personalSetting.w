<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:308px;top:543px;">
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="areaData" queryAction="queryRegionTree" tableName="takeout_region" url="/justep/demo" idColumn="fID" isTree="true"><column label="fID" name="fID" type="Integer" xid="default1"></column>
  <column label="fName" name="fName" type="String" xid="default2"></column>
  <column label="fParentID" name="fParentID" type="Integer" xid="default3"></column>
  <column label="fType" name="fType" type="String" xid="default4"></column>
  <column label="fPostCode" name="fPostCode" type="String" xid="default5"></column>
  <column label="fPhoneNumber" name="fPhoneNumber" type="String" xid="default6"></column>
  <treeOption xid="default7" parentRelation="fParentID"></treeOption></div></div>  
  <h4 xid="h41"><![CDATA[树形表格-个性设置]]>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="js" onClick="jsClick"> 
      <i xid="i1"/>  
      <span xid="span1">js</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i2"/>  
      <span xid="span2">源码</span>
    </a>
  </h4>  
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
    altRows="true" xid="areaGrid" data="areaData" appearance="treeGrid" expandColumn="fID"
    width="100%" height="auto" onTreeIconRender="areaGridTreeIconRender" multiselect="true"> 
    <columns xid="columns1">
      <column name="fID" xid="column1"/>  
      <column name="fName" xid="column2"/>  
      <column name="fParentID" xid="column3"/>  
      <column name="fType" xid="column4"/>
    </columns>
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="展开台港澳地区" xid="expand" onClick="expandClick"> 
    <i xid="i3"/>  
    <span xid="span3">展开台港澳地区</span>
  </a>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="折叠台港澳地区" xid="fold" onClick="foldClick"> 
    <i xid="i4"/>  
    <span xid="span4">折叠台港澳地区</span>
  </a>
</div>
