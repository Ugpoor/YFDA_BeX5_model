<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:426px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="alpha"> 
      <column label="alpha" name="alpha" type="String" xid="default12"></column>
  <column label="laGap" name="laGap" type="String" xid="default13"></column>
  <data xid="default14">[{&quot;alpha&quot;:&quot;0.1f&quot;,&quot;laGap&quot;:&quot;0.01&quot;},{&quot;alpha&quot;:&quot;0.2f&quot;,&quot;laGap&quot;:&quot;0.02&quot;},{&quot;alpha&quot;:&quot;0.3f&quot;,&quot;laGap&quot;:&quot;0.03&quot;},{&quot;alpha&quot;:&quot;0.4f&quot;,&quot;laGap&quot;:&quot;0.04&quot;},{&quot;alpha&quot;:&quot;0.5f&quot;,&quot;laGap&quot;:&quot;0.05&quot;},{&quot;alpha&quot;:&quot;0.6f&quot;,&quot;laGap&quot;:&quot;0.06&quot;},{&quot;alpha&quot;:&quot;0.7f&quot;,&quot;laGap&quot;:&quot;0.07&quot;},{&quot;alpha&quot;:&quot;0.8f&quot;,&quot;laGap&quot;:&quot;0.08&quot;},{&quot;alpha&quot;:&quot;0.9f&quot;,&quot;laGap&quot;:&quot;0.09&quot;},{&quot;alpha&quot;:&quot;1.0f&quot;,&quot;laGap&quot;:&quot;0.1&quot;}]</data></div>
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
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="isCir" onValueChanged="dataValueChanged"> 
      <column label="isCir" name="isCir" type="String" xid="default1"/>  
      <column label="bgAlpha" name="bgAlpha" type="String" xid="default2"/>  
      <column label="fgAlpha" name="fgAlpha" type="String" xid="default3"/>  
      <column label="ndm" name="ndm" type="String"/>  
      <column label="laGap" name="laGap" type="String"/>  
      <column label="lafontName" name="lafontName" type="String"/>  
      <column label="lafontStyle" name="lafontStyle" type="String"/>  
      <column label="lafontSize" name="lafontSize" type="String"/>  
      <column label="pls" name="pls" type="String"/>  
      <column label="plnf" name="plnf" type="String"/>  
      <column label="plpf" name="plpf" type="String"/>  
      <column label="mttls" name="mttls" type="String"/>  
      <column label="mttnf" name="mttnf" type="String"/>  
      <column label="mttpf" name="mttpf" type="String"/>  
      <data xid="default6">[{"isCir":"true","bgAlpha":"0.6f","fgAlpha":"0.9f","ndm":"无数据","laGap":"0.05","lafontName":"黑体","lafontStyle":"0","lafontSize":"12","pls":"{0} {2}","plnf":"######","plpf":"##.00%","mttls":"{0}: ({1}, {2})","mttnf":"######","mttpf":"##.00%"}]</data>
    </div> 
  </div>  
  <div id="index"> 
    <span style="display:block">公共参数</span>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="height:50px;"> 
      <div class="x-col x-col-bottom" xid="col1"> 
        <span>是否圆形</span>
        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox"
          xid="checkbox1" onChange="isCirChange" /> 
      </div>  
      <div class="x-col" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect1"> 
          <label class="x-label" xid="label1"><![CDATA[背景透明度：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select1" bind-ref="data.ref('bgAlpha')" bind-options="selectData"
            bind-optionsLabel="alpha" bind-optionsValue="alpha"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect2"> 
          <label class="x-label" xid="label2"><![CDATA[前景透明度：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select2" bind-ref="data.ref('fgAlpha')" bind-options="selectData"
            bind-optionsLabel="alpha" bind-optionsValue="alpha"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput1"> 
      <label class="x-label" xid="label3" style="width:150px;"><![CDATA[无数据显示：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input1" bind-ref="data.ref('ndm')"/> 
    </div>  
    <span style="display:block">扇区描述信息</span>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="height:50px;"> 
      <div class="x-col" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect3"> 
          <label class="x-label" xid="label4" style="width:140px;"><![CDATA[字体名称：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select3" bind-ref="data.ref('lafontName')" bind-options="fontData"
            bind-optionsLabel="fontName" bind-optionsValue="fontName"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect4"> 
          <label class="x-label" xid="label5"><![CDATA[字体样式：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select4" bind-ref="data.ref('lafontStyle')" bind-options="fontStyleData"
            bind-optionsLabel="styleLabel" bind-optionsValue="value"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect5"> 
          <label class="x-label" xid="label6"><![CDATA[字体大小：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select5" bind-ref="data.ref('lafontSize')" bind-options="fontData"
            bind-optionsLabel="fontSize" bind-optionsValue="fontSize"/> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" style="height:50px;"> 
      <div class="x-col" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelSelect6"> 
          <label class="x-label" xid="label7" style="width:140px;"><![CDATA[信息距离：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="select6" bind-ref="data.ref('laGap')" bind-options="selectData" bind-optionsLabel="laGap"
            bind-optionsValue="laGap"/> 
        </div> 
      </div>  
      <div class="x-col" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput6"> 
          <label class="x-label" xid="label18"><![CDATA[数值格式：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input6" bind-ref="data.ref('plnf')"/>
        </div>
      </div>  
      <div class="x-col" xid="col9"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label40"
          xid="labelInput7"> 
          <label class="x-label" xid="label19"><![CDATA[百分比格式：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input7" bind-ref="data.ref('plpf')"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput2"> 
      <label class="x-label" xid="label10" style="width:150px;"><![CDATA[信息格式：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input2" bind-ref="data.ref('pls')"/> 
    </div>  
    <span style="display:block">扇区热点提示相关参数</span>  
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="height:50px;"> 
      <div class="x-col" xid="col10"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput8"> 
          <label class="x-label" xid="label20" style="width:140px;"><![CDATA[数据格式：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input8" bind-ref="data.ref('mttnf')"/>
        </div>
      </div>  
      <div class="x-col" xid="col11"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput9"> 
          <label class="x-label" xid="label21"><![CDATA[百分比格式：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input9" bind-ref="data.ref('mttpf')"/>
        </div>
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label15"
      xid="labelInput3"> 
      <label class="x-label" xid="label13" style="width:150px;"><![CDATA[信息格式：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="input3" bind-ref="data.ref('mttls')"/> 
    </div>
    </div> 
</div>
