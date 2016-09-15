<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:539px;top:29px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="indicator_radius" onValueChanged="dataValueChanged"> 
      <column label="indicator_radius" name="indicator_radius" type="String"/>  
      <column label="indicator_angle" name="indicator_angle" type="String"/>  
      <column label="indicator_outlinecolor" name="indicator_outlinecolor" type="String"/>  
      <column label="indicator_fontName" name="indicator_fontName" type="String"/>  
      <column label="indicator_fontStyle" name="indicator_fontStyle" type="String"/>  
      <column label="indicator_fontSize" name="indicator_fontSize" type="String"/>  
      <column label="dial_annotation" name="dial_annotation" type="String"/>  
      <column label="annotation_fontName" name="annotation_fontName" type="String"/>  
      <column label="annotation_fontStyle" name="annotation_fontStyle" type="String"/>  
      <column label="annotation_fontSize" name="annotation_fontSize" type="String"/>  
      <column label="annotation_radius" name="annotation_radius" type="String"/>  
      <column label="annotation_angle" name="annotation_angle" type="String"/>  
      <column label="rangle_innerradius" name="rangle_innerradius" type="String"/>  
      <column label="rangle_outerradius" name="rangle_outerradius" type="String"/>  
      <column label="dial_viewx" name="dial_viewx" type="String"/>  
      <column label="dial_viewy" name="dial_viewy" type="String"/>  
      <column label="dial_viewwidth" name="dial_viewwidth" type="String"/>  
      <column label="dial_viewheight" name="dial_viewheight" type="String"/>  
      <data xid="default1">[{"indicator_radius":"0.50","indicator_angle":"-103.0","indicator_outlinecolor":"#FFFFFF","indicator_fontName":"黑体","indicator_fontStyle":"0","indicator_fontSize":"12","dial_annotation":"描述","annotation_fontName":"黑体","annotation_fontStyle":"0","annotation_fontSize":"12","annotation_radius":"0.70","annotation_angle":"-140","rangle_innerradius":"0.80D","rangle_outerradius":"0.82D","dial_viewx":"0.0","dial_viewy":"0.0","dial_viewwidth":"1.0","dial_viewheight":"1.0"}]</data>
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
  <span style="display:block">刻度盘分析值信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
    style="height:50px;"> 
    <div class="x-col" xid="col1"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput1"> 
        <label class="x-label" xid="label1"><![CDATA[圆心距离：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input1" bind-ref="data.ref('indicator_radius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col2"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput2"> 
        <label class="x-label" xid="label2"><![CDATA[交叉弧度：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="data.ref('indicator_angle')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col3"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput3"> 
        <label class="x-label" xid="label3"><![CDATA[轮廓颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="data.ref('indicator_outlinecolor')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
    style="height:50px;"> 
    <div class="x-col" xid="col4"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect1"> 
        <label class="x-label" xid="label4"><![CDATA[字体名称：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-ref="data.ref('indicator_fontName')" bind-options="fontData"
          bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col5"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect2"> 
        <label class="x-label" xid="label5"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-ref="data.ref('indicator_fontStyle')" bind-options="fontStyleData"
          bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col6"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect3"> 
        <label class="x-label" xid="label6"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select3" bind-ref="data.ref('indicator_fontSize')" bind-options="fontData"
          bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
      </div> 
    </div> 
  </div>  
  <span style="display:block">刻度盘分析值描述信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"
    style="height:50px;"> 
    <div class="x-col" xid="col7"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput4"> 
        <label class="x-label" xid="label7"><![CDATA[描述信息：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input4" bind-ref="data.ref('dial_annotation')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col8"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput5"> 
        <label class="x-label" xid="label11"><![CDATA[圆心距离：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input5" bind-ref="data.ref('annotation_radius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col9"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput6"> 
        <label class="x-label" xid="label12"><![CDATA[交叉弧度：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input6" bind-ref="data.ref('annotation_angle')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"
    style="height:50px;"> 
    <div class="x-col" xid="col10"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect4"> 
        <label class="x-label" xid="label8"><![CDATA[字体名称：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select4" bind-ref="data.ref('annotation_fontName')" bind-options="fontData"
          bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col11"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect5"> 
        <label class="x-label" xid="label9"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select5" bind-ref="data.ref('annotation_fontStyle')" bind-options="fontStyleData"
          bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col12"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect6"> 
        <label class="x-label" xid="label10"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select6" bind-ref="data.ref('annotation_fontSize')" bind-options="fontData"
          bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
      </div> 
    </div> 
  </div>  
  <span style="display:block">刻度盘刻度值区间扇形双轮廓线信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"
    style="height:50px;"> 
    <div class="x-col" xid="col13"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput7"> 
        <label class="x-label" xid="label13"><![CDATA[内圆心距：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input7" bind-ref="data.ref('rangle_innerradius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col14"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput8"> 
        <label class="x-label" xid="label14"><![CDATA[外圆心距：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input8" bind-ref="data.ref('rangle_outerradius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col15"/> 
  </div>  
  <span style="display:block">刻度盘公共信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"
    style="height:50px;"> 
    <div class="x-col" xid="col16"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput9"> 
        <label class="x-label" xid="label15" style="width:137px;"><![CDATA[圆心左右移动：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input9" bind-ref="data.ref('dial_viewx')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col17"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput10"> 
        <label class="x-label" xid="label16"><![CDATA[圆心上下移动：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input10" bind-ref="data.ref('dial_viewy')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row7"
    style="height:50px;"> 
    <div class="x-col" xid="col19"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput11"> 
        <label class="x-label" xid="label17" style="width:137px;"><![CDATA[左右缩放比例：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input11" bind-ref="data.ref('dial_viewwidth')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col20"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput12"> 
        <label class="x-label" xid="label18"><![CDATA[上下缩放比例：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input12" bind-ref="data.ref('dial_viewheight')"/> 
      </div> 
    </div> 
  </div> 
</div>
