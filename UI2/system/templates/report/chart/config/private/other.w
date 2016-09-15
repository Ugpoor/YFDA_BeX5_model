<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:425px;top:164px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="bgColor" onValueChanged="dataValueChanged">
      <column label="bgColor" name="bgColor" type="String" xid="default3"/>  
      <column label="bgAlpha" name="bgAlpha" type="String" xid="default4"/>  
      <column label="pgAlpha" name="pgAlpha" type="String" xid="default5"/>  
      <data xid="default6">[{"bgColor":"#FFFFFF","bgAlpha":"0.6f","pgAlpha":"0.9f"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="alaph"> 
      <column label="alaph" name="alaph" type="String" xid="default1"/>  
      <data xid="default2">[{"alaph":"0.1f"},{"alaph":"0.2f"},{"alaph":"0.3f"},{"alaph":"0.4f"},{"alaph":"0.5f"},{"alaph":"0.6f"},{"alaph":"0.7f"},{"alaph":"0.8f"},{"alaph":"0.9f"},{"alaph":"1.0f"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1"><![CDATA[背景色：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data.ref('bgColor')"/> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelSelect1"> 
    <label class="x-label" xid="label2"><![CDATA[背景透明度：]]></label>  
    <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
      xid="select1" bind-ref="data.ref('bgAlpha')" bind-options="selectData" bind-optionsLabel="alaph" bind-optionsValue="alaph"/> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelSelect2"> 
    <label class="x-label" xid="label3"><![CDATA[前景透明度：]]></label>  
    <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
      xid="select2" bind-ref="data.ref('pgAlpha')" bind-options="selectData" bind-optionsLabel="alaph" bind-optionsValue="alaph"/> 
  </div> 
</div>
