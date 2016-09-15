<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:435px;top:157px;"></div>
  <span component="$UI/system/components/justep/timer/timer" onTimer="timerTimer" style="left:65px;top:12px;" xid="timer"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="Timer"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">Timer</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1" title="自动执行"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        
      <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="开始" xid="button1" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span3">开始</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="暂停" xid="button2" onClick="button2Click">
   <i xid="i2"></i>
   <span xid="span4">暂停</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="停止" xid="button3" onClick="button3Click">
   <i xid="i3"></i>
   <span xid="span5">停止</span></a><div component="$UI/system/components/justep/output/output" class="x-output" xid="output" /></div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="动态创建" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span2">title</span>
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1"><![CDATA[触发次数]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="inputTimes" placeHolder="0为无限次"/>
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2"><![CDATA[间隔时间]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="inputInterval" placeHolder="单位毫秒，默认1000"/>
        </div>  
        
      <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="创建" xid="button4" onClick="button4Click">
   <i xid="i4"></i>
   <span xid="span6">创建</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="开始" xid="button5" onClick="button5Click">
   <i xid="i5"></i>
   <span xid="span7">开始</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="暂停" xid="button6" onClick="button6Click">
   <i xid="i6"></i>
   <span xid="span8">暂停</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="停止" xid="button7" onClick="button7Click">
   <i xid="i7"></i>
   <span xid="span9">停止</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="释放" xid="button8" onClick="button8Click">
   <i xid="i8"></i>
   <span xid="span10">释放</span></a><div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" />
  </div>
    </div> 
  </div> 
</div>
