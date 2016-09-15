<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:102px;top:118px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statusData" idColumn="status"> 
      <column name="status" type="String" xid="xid2"/>  
      <data xid="default2">[{"status":"0"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="textData" idColumn="text"> 
      <column name="text" type="String" xid="xid3"/>  
      <data xid="default3">[{"text":"这是一段很长的文字，当容器放不下则会出现省略号。这是一段很长的文字，当容器放不下则会出现省略号。这是一段很长的文字，当容器放不下则会出现省略号。"}]</data> 
    </div> 
  </div>  
  <div xid="div5" style="margin-left:20px;margin-top:20px;"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i4"/>  
      <span xid="span10">js</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i4"/>  
      <span xid="span2">源码</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="1、基本使用" xid="controlGroup1" style="height:116px;"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <div xid="div1" style="width:225px;"> 
      <span xid="span3" style="width:197px;"><![CDATA[要截取的文本过长，会显示一部分]]></span> 
    </div>  
    <div xid="div2" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;height:20px;width:170px;"> 
      <span xid="span4"><![CDATA[要截取的文本过长，会显示一部分]]></span> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="2、动态改变容器尺寸" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span5">title</span> 
    </div>  
    <div xid="containerDiv" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;padding-top:5px;height:30px;"
      bind-css="{'smallWidth': $model.statusData.val(&quot;status&quot;)==0,'largeWidth': $model.statusData.val(&quot;status&quot;)==1}"> 
      <span xid="span6" style="width:197px;"><![CDATA[这是一段很长的文字，当容器放不下则会出现省略号。这是一段很长的文字，当容器放不下则会出现省略号。]]></span> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="动态增大容器尺寸" xid="magnifyBtn" onClick="magnifyBtnClick"> 
      <i xid="i1"/>  
      <span xid="span7">动态增大容器尺寸</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="动态减小容器尺寸" xid="minishBtn" onClick="minishBtnClick"> 
      <i xid="i2"/>  
      <span xid="span8">动态减小容器尺寸</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="3、与提示连用" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span9">title</span> 
    </div>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="textOutput" bind-ref="textData.ref('text')" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:300px;padding:5px 5px 5px 5px;border-style:solid solid solid solid;border-width:1px 1px 1px 1px;height:30px;"
      bind-mouseover="textOutputMouseover" bind-mouseleave="textOutputMouseleave"/> 
  </div>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="textPopOver" opacity="0" anchor="textDiv" direction="right-top" dismissible="false"> 
    <div class="x-popOver-overlay" xid="div3"/>  
    <div class="x-popOver-content" xid="div4" bind-text=" $model.textData.val(&quot;text&quot;)"
      style="height:200px;width:150px;"/> 
  </div> 
</div>
