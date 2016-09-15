<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:269px;top:269px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" onValueChanged="dataValueChanged" idColumn="lower">
      <column label="lower" name="lower" type="String" xid="default1"/>  
      <column label="upper" name="upper" type="String" xid="default2"/>  
      <column label="units" name="units" type="String" xid="default3"/>  
      <data xid="default4">[{"lower":"0","upper":"100"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1"><![CDATA[起始位温度：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data.ref('lower')"/>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput2"> 
    <label class="x-label" xid="label2"><![CDATA[终止位温度：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input2" bind-ref="data.ref('upper')"/>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput3"> 
    <label class="x-label" xid="label3"><![CDATA[单位：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input3" bind-ref="data.ref('units')"/>
  </div>
</div>
