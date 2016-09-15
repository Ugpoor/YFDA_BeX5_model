<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:641px;top:38px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataCols" limit="-1" idColumn="name"> 
      <column label="列名" name="name" type="String" xid="xid2"></column>
  <column label="显示名称" name="displayName" type="String" xid="xid3"></column>
  <column label="数据类型" name="dataType" type="String" xid="xid4"></column>
  <column isCalculate="false" label="排序" name="orderBy" type="String" xid="xid1"></column></div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dataOrderBy" idColumn="value"><column isCalculate="false" label="value" name="value" type="String" xid="xid5"></column>
  <column isCalculate="false" label="label" name="label" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;value&quot;:&quot;asc&quot;,&quot;label&quot;:&quot;升序&quot;},{&quot;value&quot;:&quot;desc&quot;,&quot;label&quot;:&quot;降序&quot;}]</data></div></div>  
  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" xid="controlGroup1">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span1">title</span></div> <div component="$UI/system/components/fragment/list/listTable" data="dataCols" masterData="" masterCol="" xid="listTable1">
   <div component="$UI/system/components/justep/list/list" class="x-list" data="dataCols" xid="list1">
    <table class="table table-condensed table-hover table-striped" component="$UI/system/components/bootstrap/table/table" xid="table1">
     <thead xid="thead1">
      <tr xid="tr1">
       <th xid="col1">
        <label bind-text="$model.dataCols.label('name')" xid="label1"></label></th> 
       <th xid="col2">
        <label bind-text="$model.dataCols.label('displayName')" xid="label2"></label></th> 
       <th xid="col3">
        <label bind-text="$model.dataCols.label('dataType')" xid="label3"></label></th> 
       <th xid="col4">
        <label bind-text="$model.dataCols.label('orderBy')" xid="label4"></label></th> </tr> </thead> 
     <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null" xid="tbody1">
      <tr xid="tr2">
       <td xid="td1">
        <div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('name')" xid="output1"></div></td> 
       <td xid="td2">
        <div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('displayName')" xid="output2"></div></td> 
       <td xid="td3">
        <div component="$UI/system/components/justep/output/output" class="x-output" bind-ref="ref('dataType')" xid="output3"></div></td> 
       <td xid="td4">
        <select component="$UI/system/components/justep/select/select" class="form-control" bind-ref="ref('orderBy')" xid="select1" bind-options="$model.dataOrderBy" bind-optionsCaption="无" bind-optionsValue="value" bind-optionsLabel="label"></select></td> </tr> </tbody> </table> </div> </div></div></div>
