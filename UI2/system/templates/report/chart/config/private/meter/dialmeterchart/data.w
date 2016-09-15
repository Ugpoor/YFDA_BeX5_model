<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:5px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="scale_visible"> 
      <column label="scale_visible" name="scale_visible" type="String"/>  
      <column label="lower_bound" name="lower_bound" type="String"/>  
      <column label="upper_bound" name="upper_bound" type="String"/>  
      <column label="major_tickincrement" name="major_tickincrement" type="String"/>  
      <column label="minor_tickcount" name="minor_tickcount" type="String"/>  
      <column label="start_angle" name="start_angle" type="String"/>  
      <column label="extent" name="extent" type="String"/>  
      <column label="major_tickcolor" name="major_tickcolor" type="String"/>  
      <column label="minor_tickcolor" name="minor_tickcolor" type="String"/>  
      <column label="tick_fontName" name="tick_fontName" type="String"/>  
      <column label="tick_fontStyle" name="tick_fontStyle" type="String"/>  
      <column label="tick_fontSize" name="tick_fontSize" type="String"/>  
      <column label="tick_radius" name="tick_radius" type="String"/>  
      <column label="label_offset" name="label_offset" type="String"/>  
      <column label="pointer_radius" name="pointer_radius" type="String"/>  
      <column label="width_radius" name="width_radius" type="String"/>  
      <column label="cap_radius" name="cap_radius" type="String"/>  
      <column label="pointer_outlinecolor" name="pointer_outlinecolor" type="String"/>  
      <column label="pointer_fillcolor" name="pointer_fillcolor" type="String"/>  
      <data xid="default2">[{"scale_visible":"true","lower_bound":"0","upper_bound":"100","major_tickincrement":"10","minor_tickcount":"4","start_angle":"-120","extent":"-300","major_tickcolor":"#000000","minor_tickcolor":"#242424","tick_fontName":"黑体","tick_fontStyle":"0","tick_fontSize":"12","tick_radius":"0.90","label_offset":"0.15","pointer_radius":"0.9","width_radius":"0.03","cap_radius":"0.02","pointer_outlinecolor":"#0000FF","pointer_fillcolor":"#0000FF"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="alpha"> 
      <column label="alpha" name="alpha" type="String" xid="default1"></column>
  <column label="laGap" name="laGap" type="String" xid="default5"></column>
  <data xid="default6">[{&quot;alpha&quot;:&quot;0.1f&quot;,&quot;laGap&quot;:&quot;0.10&quot;},{&quot;alpha&quot;:&quot;0.2f&quot;,&quot;laGap&quot;:&quot;0.20&quot;},{&quot;alpha&quot;:&quot;0.3f&quot;,&quot;laGap&quot;:&quot;0.30&quot;},{&quot;alpha&quot;:&quot;0.4f&quot;,&quot;laGap&quot;:&quot;0.40&quot;},{&quot;alpha&quot;:&quot;0.5f&quot;,&quot;laGap&quot;:&quot;0.50&quot;},{&quot;alpha&quot;:&quot;0.6f&quot;,&quot;laGap&quot;:&quot;0.60&quot;},{&quot;alpha&quot;:&quot;0.7f&quot;,&quot;laGap&quot;:&quot;0.70&quot;},{&quot;alpha&quot;:&quot;0.8f&quot;,&quot;laGap&quot;:&quot;0.80&quot;},{&quot;alpha&quot;:&quot;0.9f&quot;,&quot;laGap&quot;:&quot;0.90&quot;},{&quot;alpha&quot;:&quot;&quot;,&quot;laGap&quot;:&quot;1.00&quot;}]</data></div>
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
  <span style="display:block">刻度盘刻度值信息</span>  
  <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
    xid="scale_visible" label="刻度盘上是否要显示刻度" onChange="scale_visibleChange" checked="true"/>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
    <div class="x-col" xid="col1"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput1"> 
        <label class="x-label" xid="label1"><![CDATA[起始位置：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input1" bind-ref="data.ref('lower_bound')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col2"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput2"> 
        <label class="x-label" xid="label2"><![CDATA[终止位置：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input2" bind-ref="data.ref('upper_bound')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col3"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput3"> 
        <label class="x-label" xid="label3"><![CDATA[主刻增量：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input3" bind-ref="data.ref('major_tickincrement')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col4"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput4"> 
        <label class="x-label" xid="label4"><![CDATA[副刻度数：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input4" bind-ref="data.ref('minor_tickcount')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
    <div class="x-col" xid="col5"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput5"> 
        <label class="x-label" xid="label5"><![CDATA[起始半径：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input5" bind-ref="data.ref('start_angle')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col6"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput6"> 
        <label class="x-label" xid="label6"><![CDATA[扩展范围：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input6" bind-ref="data.ref('extent')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col7"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput7"> 
        <label class="x-label" xid="label7"><![CDATA[主刻颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input7" bind-ref="data.ref('major_tickcolor')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col8"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label60"
        xid="labelInput8"> 
        <label class="x-label" xid="label8"><![CDATA[副刻颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input8" bind-ref="data.ref('minor_tickcolor')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
    <div class="x-col" xid="col9"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect1"> 
        <label class="x-label" xid="label9"><![CDATA[刻度字体：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select1" bind-options="fontData" bind-optionsLabel="fontName" bind-optionsValue="fontName"
          bind-ref="data.ref('tick_fontName')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col10"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect2"> 
        <label class="x-label" xid="label10"><![CDATA[字体样式：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select2" bind-options="fontStyleData" bind-optionsLabel="styleLabel" bind-optionsValue="value"
          bind-ref="data.ref('tick_fontStyle')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col11"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect3"> 
        <label class="x-label" xid="label11"><![CDATA[字体大小：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select3" bind-options="fontData" bind-optionsLabel="fontSize" bind-optionsValue="fontSize"
          bind-ref="data.ref('tick_fontSize')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"> 
    <div class="x-col" xid="col12"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelSelect4"> 
        <label class="x-label" xid="label19"><![CDATA[半径：]]></label>  
        <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
          xid="select4" bind-options="selectData" bind-optionsLabel="laGap" bind-optionsValue="laGap"
          bind-ref="data.ref('tick_radius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col13"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput10"> 
        <label class="x-label" xid="label13"><![CDATA[偏移量：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input10" bind-ref="data.ref('label_offset')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col14"/> 
  </div>  
  <span style="display:block">刻度盘指针信息</span>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"> 
    <div class="x-col" xid="col15"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput11"> 
        <label class="x-label" xid="label14"><![CDATA[指针半径：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input11" bind-ref="data.ref('pointer_radius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col16"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput12"> 
        <label class="x-label" xid="label15"><![CDATA[宽度半径：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input12" bind-ref="data.ref('width_radius')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col17"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput13"> 
        <label class="x-label" xid="label16"><![CDATA[圆心半径：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input13" bind-ref="data.ref('cap_radius')"/> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6"> 
    <div class="x-col" xid="col18"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput14"> 
        <label class="x-label" xid="label17"><![CDATA[轮廓线颜色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input14" bind-ref="data.ref('pointer_outlinecolor')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col19"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
        xid="labelInput15"> 
        <label class="x-label" xid="label18"><![CDATA[填充色：]]></label>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
          xid="input15" bind-ref="data.ref('pointer_fillcolor')"/> 
      </div> 
    </div>  
    <div class="x-col" xid="col20"/> 
  </div> 
</div>
