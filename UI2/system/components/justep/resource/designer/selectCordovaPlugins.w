<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:457px;top:314px;"
    onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data1" idColumn="id">
      <column label="id" name="id" type="String" xid="xid1"></column>
  <column label="名称" name="name" type="String" xid="xid2"></column>
  <column label="依赖 " name="dependcy" type="String" xid="xid3"></column>
  <column label="选择" name="selected" type="Boolean" xid="xid4"></column></div>
  </div>  
  
<resource xid="resource2"><require xid="require1" url="$UI/takeout/index"></require>
  <require xid="require2" url="$UI/takeout/index"></require>
  <require xid="require3" url="$UI/takeout/index"></require></resource>
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div class="form-group" xid="formGroup1">
   <div class="col-sm-2" xid="col13"><label class="control-label" xid="controlLabel2"><![CDATA[ID]]></label></div>
  <div class="col-sm-6" xid="col14"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-blur="input6Blur" bind-keydown="input6Keydown"></input></div>
  <div class="col-sm-2" xid="col15"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="查询" xid="button2" onClick="button2Click">
   <i xid="i2"></i>
   <span xid="span2">查询</span></a>
  </div></div></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="data1"> 
    <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table" xid="table1"> 
      <thead xid="thead1"> 
        <tr xid="tr1"> 
          <th xid="col1" style="width:50px;">#</th>  
          <th xid="col4" style="text-align:center;"><![CDATA[ID]]></th>
          <th xid="col2" style="text-align:center;"><![CDATA[名称]]></th>  
          <th xid="col3" style="height:38px;width:107px;text-align:center;"><![CDATA[选择 ]]></th> 
        </tr> 
      </thead>  
      <tbody class="x-list-template" xid="listTemplate1"> 
        <tr xid="tr2"> 
          <td xid="td1" bind-text=" $object.index()">1</td>  
          <td xid="td4" bind-text="ref('id')" />
          <td xid="td2" bind-text="ref('name')" />  
          <td xid="td3" style="text-align:center;">
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox1" bind-ref="ref('selected')" />
          </td> 
        </tr> 
      </tbody> 
    </table>
  </div></div>
