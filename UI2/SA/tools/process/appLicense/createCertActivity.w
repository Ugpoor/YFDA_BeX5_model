<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;left:187px;height:auto;"/>  
   
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="返回" xid="button2" icon="icon-chevron-left" onClick='{"operation":"window.close"}'>
   <i xid="i3" class="icon-chevron-left"></i>
   <span xid="span4">返回</span></a></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="申请应用开发商数字证书" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[申请应用开发商数字证书]]></span> 
    </div>  
    <p style="color:#FF0000;">注意：制作过程中请不要关闭功能，开发商证书请妥善保管，用于加密应用和制作应用License</p>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1"> 
      <label class="x-label x-right" xid="label1"><![CDATA[开发商账号：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="developer" placeHolder="登陆reg.justep.com的开发商账号" />
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2"> 
      <label class="x-label x-right" xid="label2"><![CDATA[开发商登陆口令：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit" xid="developerPassword" placeHolder="登陆reg.justep.com的开发商密码" />
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
      <label class="x-label x-right" xid="label3"><![CDATA[数字证书口令：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit" xid="certPassword1" placeHolder="设置到证书中的口令" />
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
      <label class="x-label x-right" xid="label4"><![CDATA[数字证书口令确认：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit" xid="certPassword2" />
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="生成" xid="btnOK" onClick="btnOKClick" bind-enable="canCreate"> 
      <i xid="i1" />  
      <span xid="span2">生成</span>
    </a>
  </div></div>
   </div></div>
