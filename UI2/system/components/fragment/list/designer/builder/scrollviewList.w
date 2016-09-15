<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:106px;height:auto;left:566px;top:353px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dataList" idColumn="col0" autoNew="true"> 
      <column label="dataid" name="col0" type="String" xid="default1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dataListT" idColumn="type"><column label="模板" name="type" type="String" xid="xid1"></column>
  <column label="模板名称" name="name" type="String" xid="xid2"></column>
  <data xid="default2">[{&quot;type&quot;:&quot;UL&quot;,&quot;name&quot;:&quot;UL模板&quot;},{&quot;type&quot;:&quot;DIV&quot;,&quot;name&quot;:&quot;DIV模板&quot;},{&quot;type&quot;:&quot;TABLE&quot;,&quot;name&quot;:&quot;Table模板&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"> 
    <div class="x-control-group-title"> 
      <span/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit1">
   <label class="x-label" xid="label2"><![CDATA[List绑定Data：]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-options="dataList" bind-optionsCaption="请选择......" bind-optionsValue="col0" bind-ref="dataXID"></select></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="labelEdit2">
   <label class="x-label" xid="label3"><![CDATA[List模板:]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select2" bind-options="dataListT" bind-optionsCaption="请选择模板" bind-optionsValue="type" bind-ref="listType"></select></div></div> 
</div>
