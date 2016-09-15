<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;left:187px;height:auto;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="注册应用License" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[生成应用License]]></span> 
    </div>  
  
    <p style="color:#FF0000;" xid="p1"><![CDATA[注意：开发版不支持运行加密应用，注册成功后请重新启动服务]]></p><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit10"> 
      <label class="x-label x-right" xid="label10"><![CDATA[应用License：]]></label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="appLicense" style="height:283px;"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block"
      label="注册" xid="btnOK" onClick="btnOKClick"> 
      <i xid="i1"/>  
      <span xid="span2">注册</span> 
    </a> 
  </div> 
</div>
