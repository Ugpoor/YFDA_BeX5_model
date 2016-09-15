<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:252px;top:299px;"/>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="alert" style="left:198px;top:198px;" message="修改密码"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="修改密码"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="backBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i class="icon-chevron-left" xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">修改密码</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1" style="padding: 10px;"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
        xid="labelEdit1"> 
        <label class="x-label" xid="label1" style="width:120px;"><![CDATA[旧密码]]></label>  
        <div class="x-edit" xid="div4"> 
          <input component="$UI/system/components/justep/input/password" class="form-control"
            xid="oldPWInput"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
        xid="labelPassword2"> 
        <label class="x-label" xid="label5" style="width:120px;"><![CDATA[新密码]]></label>  
        <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
          xid="newPWInput"/>
      </div>
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelPassword3">
   <label class="x-label" xid="label6" style="width:120px;"><![CDATA[确认新密码]]></label>
   <input component="$UI/system/components/justep/input/password" class="form-control x-edit" xid="confirmPWInput"></input></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
        xid="labelEdit2"> 
        <label class="x-label" xid="label3" style="height:40px;width:120px;"/>  
        <div class="x-edit" xid="div5">
          <a component="$UI/system/components/justep/button/button" class="btn btn-default"
            label="save" xid="saveBtn" onClick="saveBtnClick"> 
            <i xid="i2"/>  
            <span xid="span2">save</span>
          </a>
        </div>
      </div>  
    </div> 
  </div> 
</div>
