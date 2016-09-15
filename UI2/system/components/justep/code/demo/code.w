<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:10px;left:836px;height:auto;"> 
    <div component="$UI/system/components/justep/code/code" xid="test" params="[{name:'a',displayName:'参数一',defaultValue:10,type:'integer'},{name:'b',displayName:'参数二',defaultValue:'abc',type:'string'}]"/> 
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="call code test" xid="button1" onClick="{operation:'test.exec',args:{a:90,b:'bbb'}}"> 
    <i xid="i1"/>  
    <span xid="span1">call code test</span>
  </a>
</div>
