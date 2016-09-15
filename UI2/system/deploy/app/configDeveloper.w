<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window"
  sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:573px;top:186px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput1"> 
    <label class="x-label" xid="label1"><![CDATA[省/直辖市：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="province" placeHolder="例：北京市"/>
  </div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput2"> 
    <label class="x-label" xid="label2"><![CDATA[城市/地区：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="area" placeHolder="例：丰台区"/>
  </div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput3"> 
    <label class="x-label" xid="label3"><![CDATA[公司：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="company" placeHolder="例：北京起步科技有限公司 或 个人"/>
  </div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput5"> 
    <label class="x-label" xid="label5"><![CDATA[开发者：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="author" placeHolder="例：北京起步科技有限公司 或 张三"/>
  </div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput6"> 
    <label class="x-label" xid="label6"><![CDATA[开发者主页：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="homePage" placeHolder="例：http://www.justep.com"/>
  </div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
    xid="labelInput7"> 
    <label class="x-label" xid="label7"><![CDATA[开发者Email：]]></label>  
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="email" placeHolder="例：x5@justep.com"/>
  </div>  
  <div xid="div1" style="padding-top:8px"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="genAndroid" label="Android证书：" style="padding-right:8px" checked="true"></span><input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="androidPassword" style="display:inline-block;width:183px;" placeHolder="请设置Android证书密码" bind-keypress="androidPasswordKeypress"></input><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="genAndroidKey" label="新生成证书文件android.keystore" style="padding-left:8px"></span></div>  
  <div xid="div5" style="padding-top:8px">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="genIOSDev" label="IOS开发证书：" style="padding-right:8px" checked="true"></span><input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="iosDevloperPassword" style="display:inline-block;width:183px;" placeHolder="请设置IOS开发证书密码" bind-keypress="iosDevloperPasswordKeypress"/>
    
    <div xid="ios_developer_p12" style="display:inline-block;padding-left:8px"><label xid="devP12Label" class="x-label" style="cursor:pointer" bind-text="$model.cerTitle[0]"><![CDATA[点我选择开发证书p12]]></label></div> 
  <div xid="ios_developer_mobileprovision" style="display:inline-block"><label xid="devProvLabel" class="x-label" style="cursor:pointer;" bind-text="$model.cerTitle[1]"><![CDATA[点我选择开发方案mobileprovision]]></label></div></div>  
  <div xid="div6" style="padding-top:8px"> 
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="genIOSDis" label="IOS发布证书：" style="padding-right:8px"></span><input component="$UI/system/components/justep/input/input" class="form-control x-edit"
      xid="iosDistributionPassword" style="display:inline-block;width:183px;" placeHolder="请设置IOS发布证书密码" bind-keypress="iosDistributionPasswordKeypress"/>  
      
    <div xid="ios_distribution_p12" style="display:inline-block;padding-left:8px"><label xid="disP12Label" class="x-label" style="cursor:pointer;" bind-text="$model.cerTitle[2]"><![CDATA[点我选择发布证书p12]]></label>
  </div>
  <div xid="ios_distribution_mobileprovision" style="display:inline-block"><label xid="disProvLabel" class="x-label" style="cursor:pointer;" bind-text="$model.cerTitle[3]"><![CDATA[点我选择发布方案mobileprovision]]></label></div>
  </div>
</div>
