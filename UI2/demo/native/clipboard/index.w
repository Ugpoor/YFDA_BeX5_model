<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:239px;top:49px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid1"></column>
  <column label="text" name="text" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;id&quot;:&quot;1&quot;}]</data>
  <column label="copyText" name="copyText" type="String" xid="xid3"></column>
  <rule xid="rule1">
   <col name="copyText" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default2">true</expr></readonly> </col> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="复制粘贴插件实例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">复制粘贴插件实例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content container-fluid" xid="content1"> 
      <p>复制</p>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
        xid="textarea" placeHolder="复制该文本框里的内容" bind-ref="data.ref('text')"/>
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="复制" xid="copy" onClick="copyClick"> 
        <i xid="i1"/>  
        <span xid="span1">复制</span> 
      </a>  
      <p>粘贴</p>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="粘贴" xid="paste" onClick="pasteClick"> 
        <i xid="i2"/>  
        <span xid="span2">粘贴</span>
      </a> 
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="data.ref('copyText')" placeHolder="拷贝的内容"></textarea></div> 
  </div> 
</div>
