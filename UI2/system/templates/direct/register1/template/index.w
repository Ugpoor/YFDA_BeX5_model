<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:168px;top:68px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="regData" idColumn="name"><column label="用户账号：" name="name" type="String" xid="xid1"></column>
  <column label="用户密码：" name="pwd" type="String" xid="xid2"></column>
  <column label="确认密码：" name="repwd" type="String" xid="xid3"></column>
  <column label="用户邮箱：" name="email" type="String" xid="xid4"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="注册页面"> 
        <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button1" icon="icon-chevron-left">
   <i xid="i2" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="title1">注册页面</div>  
        <div class="x-titlebar-right reverse" xid="right1"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup1">  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1" bind-text='$model.regData.label("name")'/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="nserName" placeHolder="请输入账号"/>
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2" bind-text='$model.regData.label("pwd")'/>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="password" placeHolder="请输入密码"/>
        </div>
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3"> 
        <label class="x-label" xid="label3" bind-text='$model.regData.label("repwd")'/>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="repassword" placeHolder="确认密码"/>
      </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4"> 
        <label class="x-label" xid="label4" bind-text='$model.regData.label("email")'/>  
        <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="email" placeHolder="请输入邮箱"/>
      </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary center-block" label="注册" xid="regBtn">
   <i xid="i1"></i>
   <span xid="span2">注册</span></a></div>  
        
      
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/>
  </div>
</div>
