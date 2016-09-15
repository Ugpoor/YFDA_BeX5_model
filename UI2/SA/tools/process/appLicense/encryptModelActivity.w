<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;left:187px;height:auto;" onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" onClick="{'operation':'window.close'}" xid="button1">
   <i xid="i2"></i>
   <span xid="span3"></span></a></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"></div></div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="加密模型" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[生成应用License]]></span> 
    </div>  
    <p style="color:#FF0000;"><![CDATA[注意：请先使用studio进行模型和源码编译再进行模型加密，此功能只能在开发版运行，模型加密执行过程中请不要关闭功能]]></p>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
      <label class="x-label x-right" xid="label3"><![CDATA[开发商数字证书：]]></label>  
      <div class="x-edit"> 
        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup" xid="inputGroup1"> 
          <input component="$UI/system/components/justep/input/input" class="form-control" xid="cert" readonly="true" />  
          <div class="input-group-btn"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="openBtn" label="选择"> 
              <i xid="i3" />  
              <span xid="span5">选择</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
      <label class="x-label x-right" xid="label4"><![CDATA[开发商数字证书口令：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit" xid="password" placeHolder="申请开发证书设置的密码" /> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5"> 
      <label class="x-label x-right" xid="label5"><![CDATA[原模型路径：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="sourceModelPath" placeHolder="model的目录，如：X:/bex5/model" /> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6"> 
      <label class="x-label x-right" xid="label6"><![CDATA[加密后模型存放路径：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="targetModelPath" placeHolder="请设置在和原模型不同的目录，不要使用中文目录，如：D:/temp" /> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit7"> 
      <label class="x-label x-right" xid="label7"><![CDATA[需要加密的应用：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="app" placeHolder="格式如：/demo;/OA，支持多个应用，多个应用用;分隔" /> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit hide" xid="labelEdit8"> 
      <label class="x-label x-right" xid="label8"><![CDATA[强制编译模型：]]></label>
      <div class="x-edit">
      <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="isCompile"></span></div>  
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="执行" xid="btnOK" onClick="btnOKClick" bind-enable="canCreate"> 
      <i xid="i1" />  
      <span xid="span2">执行</span> 
    </a> 
  </div></div>
   </div> 
<div component="$UI/system/components/justep/popOver/popOver" class="x-popOver" xid="popOver" dismissible="false">
   <div class="x-popOver-overlay" xid="div1"></div>
   <div class="x-popOver-content" xid="div2"><i class="icon-loading-a loading"/><label>模型加密中请稍候......</label></div></div>
  </div>
