<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:151px;top:229px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tool_tip_label" onValueChanged="dataValueChanged"> 
      <column label="tool_tip_label" name="tool_tip_label" type="String" xid="default3"/>  
      <column label="tool_tip_fm" name="tool_tip_fm" type="String" xid="default4"/>  
      <column label="tool_tip_type" name="tool_tip_type" type="String" xid="default5"/>  
      <column label="serie_tip_type" name="serie_tip_type" type="String" xid="default6"/>  
      <column label="serie_tip_fm" name="serie_tip_fm" type="String" xid="default7"/>  
      <data xid="default9">[{"tool_tip_label":"{0}: ({1}, {2})","tool_tip_fm":"######.00","tool_tip_type":"number","serie_tip_type":"number","serie_tip_fm":"######.00"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="dataType"> 
      <column label="dataType" name="dataType" type="String" xid="default1"/>  
      <data xid="default2">[{"dataType":"number"},{"dataType":"date"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1" style="width:150px;"><![CDATA[信息格式：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data.ref('tool_tip_label')"/> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
    <div class="x-col" xid="col1"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelSelect1"> 
        <label class="x-label" xid="label2" style="width:140px;"><![CDATA[分类轴数据类型：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-ref="data.ref('tool_tip_type')" bind-options="selectData"
          bind-optionsLabel="dataType" bind-optionsValue="dataType"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col2"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput2"> 
        <label class="x-label" xid="label3"><![CDATA[数据格式：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="data.ref('tool_tip_fm')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
    <div class="x-col" xid="col4"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelSelect2"> 
        <label class="x-label" xid="label4" style="width:140px;"><![CDATA[数据轴数据类型：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-options="selectData" bind-optionsLabel="dataType" bind-optionsValue="dataType" bind-ref="data.ref('serie_tip_type')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col5"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelInput3"> 
        <label class="x-label" xid="label5"><![CDATA[数据格式：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="data.ref('serie_tip_fm')"/> 
      </div> 
    </div> 
  </div> 
</div>
