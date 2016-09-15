<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:140px;left:197px;height:auto;"
    onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mainData" idColumn="name">
      <column label="参数" name="name" type="String" xid="xid1"/>  
      <column label="参数显示名称" name="displayName" type="String" xid="xid2"/>  
      <column label="数据类型" name="type" type="String" xid="xid3"/>  
      <column label="默认值" name="defaultValue" type="String" xid="xid4"/>  
      <column label="必填" name="required" type="Boolean" xid="xid5"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="name"> 
      <data xid="default3">[{"name":"String"},{"name":"Integer"},{"name":"Long"},{"name":"Float"},{"name":"Double"},{"name":"Decimal"},{"name":"Boolean"},{"name":"Date"},{"name":"Time"},{"name":"DateTime"}]</data>  
      <column label="name" name="name" type="String" xid="default13"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.new'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.delete'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>
  </div>  
  <div component="$UI/system/components/fragment/list/listTable" data="mainData"
    masterData="" masterCol="" xid="listTable2"> 
    <div component="$UI/system/components/justep/list/list" class="x-list"
      data="mainData" xid="list2"> 
      <table class="table table-hover table-striped table-condensed" component="$UI/system/components/bootstrap/table/table"
        xid="table2"> 
        <thead xid="thead2"> 
          <tr xid="tr3"> 
            <th width="60px" xid="col5"> 
              <label xid="label5"/>
            </th>  
            <th xid="col6"> 
              <label bind-text="mainData.label('name')" xid="label6"/>
            </th>  
            <th xid="col7"> 
              <label bind-text="mainData.label('displayName')" xid="label7"/>
            </th>  
            <th xid="col8"> 
              <label bind-text="mainData.label('type')" xid="label8"/>
            </th>  
            <th xid="col9"> 
              <label bind-text="mainData.label('defaultValue')" xid="label9"/>
            </th> 
            <th xid="col10" style="width:60px;"> 
              <label bind-text="mainData.label('required')"/>
            </th> 
          </tr> 
        </thead>  
        <tbody class="x-list-template" bind-click="$model!=$object?$object.data.to($object):null"
          xid="listTemplate2"> 
          <tr xid="tr4" bind-css="{'info':$object==$model.mainData.getCurrentRow()}"> 
            <td class="text-center" style="vertical-align:middle;" xid="td5"> 
              <i class="x-expand-i " style="color:#808080;padding-right:6px;"
                xid="i3"/>  
              <label bind-text="$index()+1" xid="label10"/>
            </td>  
            <td xid="td6"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('name')" xid="input4" valueUpdateMode="input"/>
            </td>  
            <td xid="td7"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('displayName')" xid="input5" valueUpdateMode="input"/>
            </td>  
            <td xid="td8"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="select1" bind-ref="ref('type')" bind-options="$model.typeData"
                bind-optionsValue="name"/>
            </td>  
            <td xid="td9"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('defaultValue')" xid="input6" valueUpdateMode="input"/>
            </td> 
            <td xid="td10" style="text-align:center;"> 
            <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox1" bind-ref='ref("required")'></span></td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div>
</div>
