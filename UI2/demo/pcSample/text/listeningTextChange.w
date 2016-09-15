<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"/>  
  <div xid="div2" style="margin-left:20px;margin-top:20px;"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="js" xid="showJs" onClick="showJsSource"> 
      <i xid="i5"/>  
      <span xid="span7">js</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="sourceBtn" onClick="sourceBtnClick"> 
      <i xid="i5"/>  
      <span xid="span7">源码</span>
    </a> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本使用" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1">title</span> 
    </div>  
    <textarea placeholder="请输入两个以上的字" component="$UI/system/components/justep/textarea/textarea"
      class="form-control" xid="textarea" onChange="textareaChange" style="width:240px;height:110px;"/> 
  </div> 
</div>
