<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:151px;top:229px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tool_tip_label" onValueChanged="dataValueChanged">
      <column label="tool_tip_label" name="tool_tip_label" type="String" xid="default3"/>  
      <column label="tool_tip_fm" name="tool_tip_fm" type="String" xid="default4"/>  
      <column label="tool_tip_type" name="tool_tip_type" type="String" xid="default5"/>  
      <data xid="default6">[{"tool_tip_label":"{0}: ({1}, {2})","tool_tip_fm":"yyyy-MM-dd","tool_tip_type":"date"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="dataType">
      <column label="dataType" name="dataType" type="String" xid="default1"/>  
      <data xid="default2">[{"dataType":"number"},{"dataType":"date"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1"><![CDATA[信息格式：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data.ref('tool_tip_label')"/>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput2"> 
    <label class="x-label" xid="label3"><![CDATA[数据格式：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input2" bind-ref="data.ref('tool_tip_fm')"/>
  </div>
</div>
