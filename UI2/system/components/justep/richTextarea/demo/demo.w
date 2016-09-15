<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:364px;top:13px;"> 
    <div component="$UI/system/components/justep/data/data" xid="data1" idColumn="text"
      autoLoad="true"> 
      <column label="text" name="text" type="String" xid="default1"/>  
      <data xid="default2">[{"text":"这是原始数据"}]</data>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" status="normal" style="left:525px;top:23px;"/>  
  <div id="aler"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="richTextarea" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[richTextarea]]></span>
    </div> 
  <h3 style="height:48px;vertical-align: middle;padding: 8px;display: inline-block;">richTextarea</h3>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="js" onClick="showJsSource"> 
    <i/>  
    <span>js</span> 
  </a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link"
    label="源码" onClick="showTextareaSource" bind-visible="isVisible"> 
    <i/>  
    <span>源码</span> 
  </a>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label5"
    xid="textareaStyle"> 
    <label class="x-label" xid="label1" bind-text="data1.label('text')"/>  
    <div component="$UI/system/components/justep/richTextarea/richTextarea" class="x-edit x-richTextarea"
      xid="textarea" bind-ref="data1.ref('text')" placeHolder="请输入......" style="height:200px;"/> 
  </div>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label5"
    xid="labelInput1"> 
    <label class="x-label" xid="label2" bind-text="data1.label('text')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="input1" bind-ref="data1.ref('text')"/>
  </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="获取textarea中的内容" xid="button2" onClick="getTextAreaValue"> 
    <i xid="i2"/>  
    <span xid="span2">获取Editor中的内容</span> 
  </a>  
  <br/>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="dynamicCreate" onClick="dynamicCreateTA"> 
    <i/>  
    <span>dynamicCreate</span> 
  </a>  
  <div xid="parent"/>  
  </div>
</div>
