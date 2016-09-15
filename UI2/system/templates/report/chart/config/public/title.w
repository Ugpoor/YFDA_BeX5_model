<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:258px;top:272px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="vertical"> 
      <column label="vertical" name="vertical" type="String" xid="default28"/>  
      <column label="horizontal" name="horizontal" type="String" xid="default29"/>  
      <data xid="default30">[{"vertical":"LEFT","horizontal":"TOP"},{"vertical":"CENTER","horizontal":"CENTER"},{"vertical":"RIGHT","horizontal":"BOTTOM"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id" autoNew="false" onValueChanged="dataValueChanged"> 
      <column label="id" name="id" type="String" xid="default19"/>  
      <column label="chartTitle" name="chartTitle" type="String" xid="default20"/>  
      <column label="chartPosition" name="chartPosition" type="String" xid="default21"/>  
      <column label="isshow" name="isshow" type="String" xid="default22"/>  
      <column label="vertical" name="vertical" type="String" xid="default23"/>  
      <column label="horizontal" name="horizontal" type="String" xid="default24"/>  
      <column label="fontType" name="fontType" type="String" xid="default25"/>  
      <column label="fontStyle" name="fontStyle" type="String" xid="default26"/>  
      <column label="fontSize" name="fontSize" type="String" xid="default27"/>  
      <data xid="default35">[{"id":"1","chartTitle":"Justep图表","chartPosition":"TOP","isshow":"true","vertical":"CENTER","horizontal":"CENTER","fontType":"宋体","fontStyle":"0","fontSize":"18"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fontData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default2"/>  
      <column label="fontName" name="fontName" type="String" xid="default3"/>  
      <column label="fontSize" name="fontSize" type="String" xid="default4"/>  
      <data xid="default34">[{"id":"1","fontName":"华文宋体","fontSize":"6"},{"id":"2","fontName":"华文楷体","fontSize":"8"},{"id":"3","fontName":"宋体","fontSize":"9"},{"id":"4","fontName":"幼圆","fontSize":"9"},{"id":"5","fontName":"微软雅黑","fontSize":"10"},{"id":"6","fontName":"新宋体","fontSize":"11"},{"id":"7","fontName":"方正姚体","fontSize":"12"},{"id":"8","fontName":"楷体","fontSize":"14"},{"id":"9","fontName":"楷体","fontSize":"16"},{"id":"10","fontName":"隶书","fontSize":"18"},{"id":"11","fontName":"黑体","fontSize":"20"},{"id":"12","fontName":"华文行楷","fontSize":"22"},{"id":"13","fontName":"华文新魏","fontSize":"24"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="fontStyleData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default8"/>  
      <column label="styleLabel" name="styleLabel" type="String" xid="default9"/>  
      <column label="value" name="value" type="String" xid="default10"/>  
      <data xid="default32">[{"id":"1","styleLabel":"正常","value":"0"},{"id":"2","styleLabel":"粗体","value":"1"},{"id":"3","styleLabel":"斜体","value":"2"},{"id":"4","styleLabel":"粗斜体","value":"3"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="positionData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default16"/>  
      <column label="position" name="position" type="String" xid="default17"/>  
      <data xid="default18">[{"id":"1","position":"TOP"},{"id":"2","position":"LEFT"},{"id":"3","position":"RIGHT"},{"id":"4","position":"BOTTOM"}]</data> 
    </div> 
  </div>  
  <div id="index"> 
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
      xid="checkbox1" label="图表是否显示标题" checked="true" checkedValue="true" onChange="checkbox1Change"/>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput1"> 
      <label class="x-label" xid="label1"><![CDATA[图表标题：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="chartTitle" bind-ref="data.ref('chartTitle')"/> 
    </div>  
    <span style="display:block">公共信息</span>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2"> 
      <div class="x-col" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect1"> 
          <label class="x-label" xid="label2"><![CDATA[标题位置：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-options="positionData" bind-optionsLabel="position"
            bind-optionsValue="position" bind-ref="data.ref('chartPosition')"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect2"> 
          <label class="x-label" xid="label3"><![CDATA[水平对齐：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select2" bind-ref="data.ref('vertical')" bind-options="selectData"
            bind-optionsLabel="vertical" bind-optionsValue="vertical"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect3"> 
          <label class="x-label" xid="label4"><![CDATA[垂直对齐：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select3" bind-ref="data.ref('horizontal')" bind-options="selectData"
            bind-optionsLabel="horizontal" bind-optionsValue="horizontal"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3"> 
      <div class="x-col" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect4"> 
          <label class="x-label" xid="label5"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select4" bind-ref="data.ref('fontType')" bind-options="fontData"
            bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect5"> 
          <label class="x-label" xid="label6"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select5" bind-ref="data.ref('fontStyle')" bind-options="fontStyleData"
            bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect6"> 
          <label class="x-label" xid="label7"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select6" bind-ref="data.ref('fontSize')" bind-options="fontData"
            bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
