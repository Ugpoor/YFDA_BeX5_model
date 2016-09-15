<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:48px;top:605px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="serie_vis" onValueChanged="dataValueChanged"> 
      <column label="serie_vis" name="serie_vis" type="String"/>  
      <column label="serie_title" name="serie_title" type="String"/>  
      <column label="serie_title_fontName" name="serie_title_fontName" type="String"/>  
      <column label="serie_title_fontStyle" name="serie_title_fontStyle" type="String"/>  
      <column label="serie_title_fontSize" name="serie_title_fontSize" type="String"/>  
      <column label="serie_No_auto" name="serie_No_auto" type="String"/>  
      <column label="serie_No_start" name="serie_No_start" type="String"/>  
      <column label="serie_No_end" name="serie_No_end" type="String"/>  
      <column label="serie_No_step" name="serie_No_step" type="String"/>  
      <column label="serie_tick_fontName" name="serie_tick_fontName" type="String"/>  
      <column label="serie_tick_fontStyle" name="serie_tick_fontStyle" type="String"/>  
      <column label="serie_tick_fontSize" name="serie_tick_fontSize" type="String"/>  
      <column label="serie_No_fm" name="serie_No_fm" type="String"/>  
      <column label="serie_upper_margin" name="serie_upper_margin" type="String"/>  
      <column label="serie_double_axis" name="serie_double_axis" type="String"/>  
      <column label="serie_one_axis" name="serie_one_axis" type="String"/>  
      <column label="serie_two_axis" name="serie_two_axis" type="String"/>  
      <data xid="default2">[{"serie_vis":"true","serie_title":"任务","serie_title_fontName":"黑体","serie_title_fontStyle":"0","serie_title_fontSize":"12","serie_No_auto":"false","serie_No_start":"0","serie_No_end":"1000","serie_No_step":"100","serie_tick_fontName":"黑体","serie_tick_fontStyle":"0","serie_tick_fontSize":"12","serie_No_fm":"yyyy-MM-dd","serie_upper_margin":"0.1","serie_double_axis":"false","serie_one_axis":"TOP_OR_LEFT","serie_two_axis":"BOTTOM_OR_RIGHT"}]</data> 
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
  <div id="index"> 
    <span style="display:block">数据轴描述信息</span>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput1"> 
      <label class="x-label" xid="label1" style="width:150px;"><![CDATA[描述信息：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input1" bind-ref="data.ref('serie_title')"/> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
      <div class="x-col" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect1"> 
          <label class="x-label" xid="label2" style="width:140px;"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="data.ref('serie_title_fontName')" bind-options="fontData" bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect2"> 
          <label class="x-label" xid="label3"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select2" bind-ref="data.ref('serie_title_fontStyle')" bind-options="fontStyleData" bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect3"> 
          <label class="x-label" xid="label4"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select3" bind-ref="data.ref('serie_title_fontSize')" bind-options="fontData" bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <span style="display:block">数据坐标刻度值</span>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
      <div class="x-col" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect4"> 
          <label class="x-label" xid="label8" style="width:140px;"><![CDATA[数值字体：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select4" bind-ref="data.ref('serie_tick_fontName')" bind-options="fontData" bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect5"> 
          <label class="x-label" xid="label9"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select5" bind-ref="data.ref('serie_tick_fontStyle')" bind-options="fontStyleData" bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col9"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect6"> 
          <label class="x-label" xid="label10"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select6" bind-ref="data.ref('serie_tick_fontSize')" bind-options="fontData" bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
      xid="serie_double_axis" label="是否采用双数据轴描述数据" onChange="serie_double_axisChange"/> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
    xid="labelInput6"> 
    <label class="x-label" xid="label13" style="width:150px;"><![CDATA[主数据轴显示位置：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input6" bind-ref="data.ref('serie_one_axis')"/> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
    xid="labelInput7"> 
    <label class="x-label" xid="label14" style="width:150px;"><![CDATA[副数据轴显示位置：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input7" bind-ref="data.ref('serie_two_axis')"/> 
  </div> 
</div>
