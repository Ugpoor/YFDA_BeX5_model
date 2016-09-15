<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:310px;top:3px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="ticks_count" onValueChanged="dataValueChanged">
      <column label="ticks_count" name="ticks_count" type="String" xid="default1"/>  
      <column label="gap" name="gap" type="String" xid="default2"/>  
      <column label="fontName" name="fontName" type="String" xid="default3"/>  
      <column label="fontStyle" name="fontStyle" type="String" xid="default4"/>  
      <column label="fontSize" name="fontSize" type="String" xid="default12"/>  
      <data xid="default13">[{"ticks_count":"5","gap":"10","fontName":"黑体","fontStyle":"0","fontSize":"12"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fontStyleData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default8"/>  
      <column label="styleLabel" name="styleLabel" type="String" xid="default9"/>  
      <column label="value" name="value" type="String" xid="default10"/>  
      <data xid="default11">[{"id":"1","styleLabel":"正常","value":"0"},{"id":"2","styleLabel":"粗体","value":"1"},{"id":"3","styleLabel":"斜体","value":"2"},{"id":"4","styleLabel":"粗斜体","value":"3"}]</data> 
    </div>
	
	<div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fontData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default2"/>  
      <column label="fontName" name="fontName" type="String" xid="default3"/>  
      <column label="fontSize" name="fontSize" type="String" xid="default4"/>  
      <data xid="default7">[{"id":"1","fontName":"华文宋体","fontSize":"6"},{"id":"2","fontName":"华文楷体","fontSize":"8"},{"id":"3","fontName":"宋体","fontSize":"9"},{"id":"4","fontName":"幼圆","fontSize":"9"},{"id":"5","fontName":"微软雅黑","fontSize":"10"},{"id":"6","fontName":"新宋体","fontSize":"11"},{"id":"7","fontName":"方正姚体","fontSize":"12"},{"id":"8","fontName":"楷体","fontSize":"14"},{"id":"9","fontName":"楷体","fontSize":"16"},{"id":"10","fontName":"隶书","fontSize":"18"},{"id":"11","fontName":"黑体","fontSize":"20"},{"id":"12","fontName":"华文行楷","fontSize":"22"},{"id":"13","fontName":"华文新魏","fontSize":"24"}]</data> 
    </div>
  </div>  
  <span style="display:block">雷达图参数信息</span>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1"><![CDATA[刻度个数：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data.ref('ticks_count')"/>
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput2"> 
    <label class="x-label" xid="label2"><![CDATA[线条距离：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input2" bind-ref="data.ref('gap')"/>
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
    <div class="x-col" xid="col1">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect1"> 
        <label class="x-label" xid="label3"><![CDATA[字体名称：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-ref="data.ref('fontName')" bind-options="fontData"
          bind-optionsLabel="fontName" bind-optionsValue="fontName"/>
      </div>
    </div>  
    <div class="x-col" xid="col2">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect2"> 
        <label class="x-label" xid="label4"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-ref="data.ref('fontStyle')" bind-options="fontStyleData"
          bind-optionsLabel="styleLabel" bind-optionsValue="value"/>
      </div>
    </div>  
    <div class="x-col" xid="col3">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect3"> 
        <label class="x-label" xid="label5"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select3" bind-ref="data.ref('fontSize')" bind-options="fontData"
          bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/>
      </div>
    </div>
  </div>
</div>
