<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:6px;left:187px;height:auto;" onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="申请应用开发商数字证书" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[生成应用License]]></span> 
    </div>  
    <p style="color:#FF0000;"><![CDATA[注意：制作过程中请不要关闭功能]]></p>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit1"> 
      <label class="x-label x-right" xid="label1"><![CDATA[开发商账号：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="developer" placeHolder="登陆reg.justep.com的开发商账号"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit2"> 
      <label class="x-label x-right" xid="label2"><![CDATA[开发商登陆口令：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
        xid="developerPassword" placeHolder="登陆reg.justep.com的开发商密码"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit3"> 
      <label class="x-label x-right" xid="label3"><![CDATA[开发商数字证书：]]></label>  
      <div class="x-edit" > 
        <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
          xid="inputGroup1"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="cert" readonly="true"/>  
          <div class="input-group-btn"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              xid="openBtn" label="选择"> 
              <i xid="i3"/>  
              <span xid="span5">选择</span> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit4"> 
      <label class="x-label x-right" xid="label4"><![CDATA[开发商数字证书口令：]]></label>  
      <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
        xid="certPassword" placeHolder="申请开发证书设置的密码"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit5"> 
      <label class="x-label x-right" xid="label5"><![CDATA[申请License用户授权码：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="acode"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit6"> 
      <label class="x-label x-right" xid="label6"><![CDATA[授权应用：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="app" placeHolder="格式如：/demo，不支持多个应用"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit7"> 
      <label class="x-label x-right" xid="label7"><![CDATA[使用天数：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="useDays" placeHolder="0为不限制"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit8"> 
      <label class="x-label x-right" xid="label8"><![CDATA[使用应用人数：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="userCount" placeHolder="0为不限制"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit9"> 
      <label class="x-label x-right" xid="label9"><![CDATA[扩展信息：]]></label>  
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
        xid="info" placeHolder="不支持中文"/> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelEdit10"> 
      <label class="x-label x-right" xid="label10"><![CDATA[应用License：]]></label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="appLicense" style="height:283px;"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block"
      label="制作" xid="btnOK" onClick="btnOKClick" bind-enable="canCreate"> 
      <i xid="i1"/>  
      <span xid="span2">制作</span> 
    </a> 
  </div> 
</div>
