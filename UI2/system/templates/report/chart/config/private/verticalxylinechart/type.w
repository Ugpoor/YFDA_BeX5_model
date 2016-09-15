<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:307px;top:559px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="titleName" onValueChanged="dataValueChanged"> 
      <column label="titleName" name="titleName" type="String" xid="default54"/>  
      <column label="titlefontName" name="titlefontName" type="String" xid="default55"/>  
      <column label="titlefontStyle" name="titlefontStyle" type="String" xid="default56"/>  
      <column label="titlefontSize" name="titlefontSize" type="String" xid="default57"/>  
      <column label="margin" name="margin" type="String" xid="default58"/>  
      <column label="upperMargin" name="upperMargin" type="String" xid="default59"/>  
      <column label="lowerMargin" name="lowerMargin" type="String" xid="default60"/>  
      <column label="labelWidth" name="labelWidth" type="String" xid="default61"/>  
      <column label="tickfontName" name="tickfontName" type="String" xid="default62"/>  
      <column label="tickfontStyle" name="tickfontStyle" type="String" xid="default63"/>  
      <column label="tickfontSize" name="tickfontSize" type="String" xid="default64"/>  
      <column label="labelAngle" name="labelAngle" type="String" xid="default65"/>  
      <column label="itemfontName" name="itemfontName" type="String" xid="default66"/>  
      <column label="itemfontType" name="itemfontType" type="String" xid="default67"/>  
      <column label="itemfontSize" name="itemfontSize" type="String" xid="default68"/>  
      <column label="itemMargin" name="itemMargin" type="String" xid="default69"/>  
      <column label="itemMaxWid" name="itemMaxWid" type="String" xid="default70"/>  
      <column label="itemOutLine" name="itemOutLine" type="String" xid="default71"/>  
      <column label="itemNumFm" name="itemNumFm" type="String" xid="default72"/>  
      <column label="isVisible" name="isVisible" type="String" xid="default73"/>  
      <column label="isshowType" name="isshowType" type="String" xid="default74"/>  
      <column label="num_start" name="num_start" type="String" xid="default75"/>  
      <column label="num_end" name="num_end" type="String" xid="default76"/>  
      <column label="num_step" name="num_step" type="String" xid="default77"/>  
      <column label="num_auto" name="num_auto" type="String" xid="default78"/>  
      <data xid="default79">[{"titleName":"分类","titlefontName":"黑体","titlefontStyle":"0","titlefontSize":"12","margin":"0.2","upperMargin":"0.1","lowerMargin":"0.1","labelWidth":"####","tickfontName":"黑体","tickfontStyle":"0","tickfontSize":"12","labelAngle":"0","itemfontName":"黑体","itemfontType":"0","itemfontSize":"12","itemMargin":"0.2","itemMaxWid":"0.4","itemOutLine":"0.3f","itemNumFm":"######.00","isVisible":"false","isshowType":"true","num_start":"0","num_end":"1000","num_step":"100","num_auto":"true"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="laGap"> 
      <column label="laGap" name="laGap" type="String" xid="default6"></column>
  <data xid="default12">[{&quot;laGap&quot;:&quot;0.1&quot;},{&quot;laGap&quot;:&quot;0.2&quot;},{&quot;laGap&quot;:&quot;0.3&quot;},{&quot;laGap&quot;:&quot;0.4&quot;},{&quot;laGap&quot;:&quot;0.5&quot;},{&quot;laGap&quot;:&quot;0.6&quot;},{&quot;laGap&quot;:&quot;0.7&quot;},{&quot;laGap&quot;:&quot;0.8&quot;},{&quot;laGap&quot;:&quot;0.9&quot;},{&quot;laGap&quot;:&quot;1.0&quot;}]</data></div>
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
  <div id="index" style="height:100%"> 
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
      xid="isshowType" label="图表中是否显示分类轴" onChange="isshowTypeChange"/>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput1"> 
      <label class="x-label" xid="label1" style="width:150px;"><![CDATA[描述信息：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input1" bind-ref="data.ref('titleName')"/> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"
      style="height:50px;"> 
      <div class="x-col" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect1"> 
          <label class="x-label" xid="label2" style="width:140px;"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="data.ref('titlefontName')" bind-options="fontData"
            bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect2"> 
          <label class="x-label" xid="label3"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select2" bind-ref="data.ref('titlefontStyle')" bind-options="fontStyleData"
            bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect3"> 
          <label class="x-label" xid="label4"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select3" bind-ref="data.ref('titlefontSize')" bind-options="fontData"
            bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <span style="display:block">分类轴各组信息</span>  
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
      xid="checkbox2" label="是否采用系统自动设定分类轴数据刻度值信息" checked="checked" onChange="checkbox2Change"/>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6" style="height:50px;"> 
      <div class="x-col" xid="col16">
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput5"> 
          <label class="x-label" xid="label5" style="width:140px;"><![CDATA[起始数值：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input5" bind-ref="data.ref('num_start')"/>
        </div>
      </div>  
      <div class="x-col" xid="col17">
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput6"> 
          <label class="x-label" xid="label17"><![CDATA[终止位置：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input6" bind-ref="data.ref('num_end')"/>
        </div>
      </div>  
      <div class="x-col" xid="col18"/>
    </div>
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"
      style="height:50px;"> 
      <div class="x-col" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput7"> 
          <label class="x-label" xid="label18" style="width:140px;"><![CDATA[步长：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input7" bind-ref="data.ref('num_step')"/>
        </div>
      </div>  
      <div class="x-col" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect5"> 
          <label class="x-label" xid="label6"><![CDATA[首组间距：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select5" bind-ref="data.ref('upperMargin')" bind-options="selectData"
            bind-optionsLabel="laGap" bind-optionsValue="laGap"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect6"> 
          <label class="x-label" xid="label7"><![CDATA[末组间距：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select6" bind-ref="data.ref('lowerMargin')" bind-options="selectData"
            bind-optionsLabel="laGap" bind-optionsValue="laGap"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"
      style="height:50px;"> 
      <div class="x-col" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect7"> 
          <label class="x-label" xid="label8" style="width:140px;"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select7" bind-ref="data.ref('tickfontName')" bind-options="fontData"
            bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect8"> 
          <label class="x-label" xid="label9"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select8" bind-ref="data.ref('tickfontStyle')" bind-options="fontStyleData"
            bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col9"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect9"> 
          <label class="x-label" xid="label10"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select9" bind-ref="data.ref('tickfontSize')" bind-options="fontData"
            bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4"
      style="height:50px;"> 
      <div class="x-col" xid="col10"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput2"> 
          <label class="x-label" xid="label14" style="width:140px;"><![CDATA[数据格式：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="data.ref('labelWidth')"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col11"> 
        </div>  
      <div class="x-col" xid="col12"/> 
    </div>  
    <span style="display:block">分类轴中各组数据信息</span>  
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
      xid="isVisible" label="分类轴中各组数据项上是否显示当前数据值" onChange="isVisibleChange"/>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5"
      style="height:50px;"> 
      <div class="x-col" xid="col13"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect11"> 
          <label class="x-label" xid="label12" style="width:140px;"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select11" bind-ref="data.ref('itemfontName')" bind-options="fontData"
            bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col14"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect12"> 
          <label class="x-label" xid="label13"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select12" bind-ref="data.ref('itemfontType')" bind-options="fontStyleData"
            bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col15"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect10"> 
          <label class="x-label" xid="label11"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select10" bind-ref="data.ref('itemfontSize')" bind-options="fontData"
            bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput4"> 
      <label class="x-label" xid="label16" style="width:150px;"><![CDATA[数值格式：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input4" bind-ref="data.ref('itemNumFm')"/> 
    </div> 
  </div> 
</div>
