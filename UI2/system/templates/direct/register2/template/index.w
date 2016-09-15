<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:75px;top:9px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="用户注册" style="height:100%;"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" icon="icon-chevron-left"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1"></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">用户注册</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="title" xid="controlGroup3"> 
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="name" placeHolder="用户名" style="font-size:16px;"/>
        <div xid="div5" class="borde"/>  
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input1" placeHolder="6-12位字母数字组合密码" style="font-size:16px;"/>
        <div xid="div6" class="borde"/>  
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input2" placeHolder="确认密码" style="font-size:16px;"/>
        <div xid="div6" class="borde"/>  
        <div component="$UI/system/components/justep/row/row" class="x-row yanzheng"
          xid="row1"> 
          <div class="x-col x-col-fixed" xid="col1" style="width:auto;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              label="+86&gt;" xid="button2" style="font-size:16px;"> 
              <i xid="i2"/>  
              <span xid="span2">+86&amp;gt;</span> 
            </a> 
          </div>  
          <div class="x-col" xid="col2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="tel" placeHolder="135XXXXXXXX" style="font-size:16px;margin-top:0px;"/>
          </div>  
          <div class="x-col x-col-fixed" xid="col3" style="width:auto;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link"
              xid="button4" style="font-size:16px;" label="获取验证码"> 
              <i xid="i4"/>  
              <span xid="span4">获取验证码</span> 
            </a> 
          </div> 
        </div>  
        <div xid="div6" class="borde" style="margin-top:-10px;"/>  
        <input component="$UI/system/components/justep/input/input" class="form-control"
          xid="input4" placeHolder="短信验证码" style="font-size:16px;"/>
        <div xid="div9" class="borde"/>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="注册" xid="regBtn" style="font-size:20px;width:100%;margin-top:60px;"> 
          <i xid="i5"/>  
          <span xid="span5">注册</span> 
        </a>  
        <div xid="div10" class="name" style="margin-top:10px;">点击注册表示同意
          <a>用户服务协议</a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"/> 
  </div> 
</div>
