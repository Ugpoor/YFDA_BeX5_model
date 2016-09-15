<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window container-fluid">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;height:auto;left:455px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="data" idColumn="name"
      confirm-delete="false" confirm-refresh="false" onBeforeDelete="dataBeforeDelete" confirmDeleteText="确定删除当前列定义?" onBeforeNew="dataBeforeNew"> 
      <column label="名称" name="name" type="String" xid="default1"></column>
  <column label="数据类型" name="type" type="String" xid="default2"></column>
  <column label="是否计算列" name="isCalculate" type="Boolean" xid="xid1"></column>
  <column label="显示名称" name="displayName" type="String" xid="default4"></column>
  <column label="是否ID列" name="isIDColumn" type="Boolean" xid="default5"></column>
  <column label="xid" name="xid" type="String" xid="default6"></column>
  <rule xid="rule1">
   <col name="name" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default7">$model.type=='baas' &amp;&amp; !$row.val('isCalculate')</expr></readonly> </col> 
   <col name="type" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default8">$model.type=='baas' &amp;&amp; !$row.val('isCalculate')</expr></readonly> </col> 
   <col name="isCalculate" xid="ruleCol3">
    <required xid="required1">
     <expr xid="default9"></expr></required> 
    <readonly xid="readonly3">
     <expr xid="default10">$model.type=='baas'</expr></readonly> </col> 
   <col name="isIDColumn" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default11">$model.type=='baas'</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="name"> 
      <data xid="default3">[{"name":"String"},{"name":"Integer"},{"name":"Long"},{"name":"Float"},{"name":"Double"},{"name":"Decimal"},{"name":"Boolean"},{"name":"Date"},{"name":"Time"},{"name":"DateTime"}]</data>  
      <column label="name" name="name" type="String" xid="default13"/>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      xid="add" onClick="{operation:'data.new'}"> 
      <i/>  
      <span/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      xid="delete" onClick="{operation:'data.delete'}"> 
      <i/>  
      <span/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      label="上移" xid="up" icon="icon-chevron-up" onClick="upClick"> 
      <i class="icon-chevron-up"/>  
      <span>上移</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left"
      label="下移" xid="down" icon="icon-chevron-down" onClick="downClick"> 
      <i class="icon-chevron-down"/>  
      <span>下移</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/list/list" class="x-list" data="data"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row"> 
      <div class="col col-xs-3"> 
        <label xid="label1" bind-text="data.label('name')">label</label> 
      </div>  
      <div class="col col-xs-2"> 
        <label xid="label2" bind-text="data.label('type')">label</label> 
      </div>  
      <div class="col col-xs-3"> 
        <label xid="label3" bind-text="data.label('displayName')">label</label> 
      </div>  
      <div class="col col-xs-2"> 
        <label xid="label4" bind-text="data.label('isCalculate')">label</label> 
      </div> 
      <div class="col col-xs-2"> 
        <label xid="label5" bind-text="data.label('isIDColumn')">label</label> 
      </div> 
    </div>  
    <div class="x-list-template" style="margin:0;"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        bind-css="{'x-currentRow':$object==$model.data.getCurrentRow()}" style="padding: 6px 0;"> 
        <div class="col col-xs-3"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" bind-ref="ref('name')"/> 
        </div>  
        <div class="col col-xs-2"> 
          <select component="$UI/system/components/justep/select/select" class="form-control"
            xid="select1" bind-ref="ref('type')" bind-options="$model.typeData" bind-optionsValue="name"/> 
        </div>  
        <div class="col col-xs-3"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input3" bind-ref="ref('displayName')"/> 
        </div>  
        <div class="col col-xs-2"> 
          <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
            xid="checkbox1" bind-ref="ref('isCalculate')"/> 
        </div> 
        <div class="col col-xs-2"> 
          <span component="$UI/system/components/justep/button/radio" class="x-radio"
            xid="radio1" bind-ref="ref('isIDColumn')" name="idCol"/> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
