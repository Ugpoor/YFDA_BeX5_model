<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:52px;top:197px;"/> dom节点获取 
  <br/>弹出窗口后新窗口的表单内容会回填到这里：
  <br/>  
  <input component="$UI/system/components/justep/input/input" class="form-control"
    xid="input1" style="width:209px;"/>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="弹出窗口" xid="button1" onClick="button1Click"> 
    <i xid="i1"/>  
    <span xid="span1">弹出窗口</span>
  </a>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog1"
    src="page15.w" showTitle="true" status="normal" onReceive="windowDialog1Receive"/>  
  </div>
