<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:516px;top:12px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="1"> 
      <column label="tick_cisible" name="tick_cisible" type="String"/>  
      <column label="tick_color" name="tick_color" type="String"/>  
      <column label="ticklabel_color" name="ticklabel_color" type="String"/>  
      <column label="tick_size" name="tick_size" type="String"/>  
      <column label="tick_fontName" name="tick_fontName" type="String"/>  
      <column label="tick_fontStyle" name="tick_fontStyle" type="String"/>  
      <column label="tick_fontSize" name="tick_fontSize" type="String"/>  
      <column label="needle_color" name="needle_color" type="String"/>  
      <column label="value_color" name="value_color" type="String"/>  
      <column label="units" name="units" type="String"/>  
      <column label="value_fontName" name="value_fontName" type="String"/>  
      <column label="value_fontStyle" name="value_fontStyle" type="String"/>  
      <column label="value_fontSize" name="value_fontSize" type="String"/>  
      <column label="dial_background" name="dial_background" type="String"/>  
      <column label="dial_outline" name="dial_outline" type="String"/>  
      <column label="meter_angle" name="meter_angle" type="String"/>  
      <data xid="default2">[{"tick_cisible":"true","tick_color":"#000000","ticklabel_color":"#000000","tick_size":"5.0","tick_fontName":"黑体","tick_fontStyle":"0","tick_fontSize":"12","needle_color":"#0000FF","value_color":"#000000","units":"","value_fontName":"黑体","value_fontStyle":"0","value_fontSize":"12","dial_background":"#FFFFFF","dial_outline":"#FFFFFF","meter_angle":"260"}]</data>
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
  <span style="display:block">仪表盘刻度信息</span>  
  <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
    xid="tick_cisible" label="仪表盘中是否显示刻度值" onChange="tick_cisibleChange" checked="true"/>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
    <div class="x-col" xid="col1"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput1"> 
        <label class="x-label" xid="label1"><![CDATA[刻度颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input1" bind-ref="data.ref('tick_color')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col2"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput2"> 
        <label class="x-label" xid="label2"><![CDATA[数值颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="data.ref('ticklabel_color')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col3"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput3"> 
        <label class="x-label" xid="label3"><![CDATA[区间大小：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="data.ref('tick_size')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
    <div class="x-col" xid="col4"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect1"> 
        <label class="x-label" xid="label4"><![CDATA[字体名称：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-ref="data.ref('tick_fontName')" bind-options="fontData"
          bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col5"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect2"> 
        <label class="x-label" xid="label5"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-ref="data.ref('tick_fontStyle')" bind-options="fontStyleData"
          bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col6"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect3"> 
        <label class="x-label" xid="label6"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select3" bind-ref="data.ref('tick_fontSize')" bind-options="fontData"
          bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
      </div> 
    </div> 
  </div>  
  <span style="display:block">仪表盘指针信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
    <div class="x-col" xid="col7"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput4"> 
        <label class="x-label" xid="label7"><![CDATA[指针颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input4" bind-ref="data.ref('needle_color')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col8"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput5"> 
        <label class="x-label" xid="label8"><![CDATA[数值颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input5" bind-ref="data.ref('value_color')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col9"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput6"> 
        <label class="x-label" xid="label9"><![CDATA[计量单位：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input6" bind-ref="data.ref('units')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
    <div class="x-col" xid="col10"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect4"> 
        <label class="x-label" xid="label10"><![CDATA[字体名称：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select4" bind-ref="data.ref('value_fontName')" bind-options="fontData"
          bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col11"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect5"> 
        <label class="x-label" xid="label11"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select5" bind-ref="data.ref('value_fontStyle')" bind-options="fontStyleData"
          bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col12"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect6"> 
        <label class="x-label" xid="label12"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select6" bind-ref="data.ref('value_fontSize')" bind-options="fontData"
          bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
      </div> 
    </div> 
  </div>  
  <span style="display:block">其他</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
    <div class="x-col" xid="col13"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput7"> 
        <label class="x-label" xid="label13"><![CDATA[背景颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input7" bind-ref="data.ref('dial_background')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col14"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput8"> 
        <label class="x-label" xid="label14"><![CDATA[轮廓线颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input8" bind-ref="data.ref('dial_outline')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col15"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput9"> 
        <label class="x-label" xid="label15"><![CDATA[扇区角度：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input9" bind-ref="data.ref('meter_angle')"/> 
      </div> 
    </div> 
  </div>
</div>
