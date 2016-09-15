<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:414px;top:13px;" onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="密钥更新信息" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span1"><![CDATA[密钥更新信息]]></span> 
    </div>  
    <div xid="div1"> 
      <label xid="updateTime" bind-text="updateTime">label</label> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="获取系统特征码" xid="controlGroup2"> 
    <div class="x-control-group-title" xid="controlGroupTitle2" style="height:60px;"> 
      <span xid="span2"><![CDATA[手工更新密钥]]></span>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left pull-right"
        label="获取" xid="btnGetSysCode" icon="glyphicon glyphicon-th-list" onClick="btnGetSysCodeClick"> 
        <i xid="i1" class="glyphicon glyphicon-th-list"/>  
        <span xid="span4">获取</span> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelTextarea1"> 
      <label class="x-label" xid="label3" style="width:150px;"><![CDATA[系统特征码：]]></label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="textarea1" style="height:200px;" bind-text="sysCode"/> 
    </div>  
    <p xid="p1">说明：在http://reg.justep.com的“License管理”功能中获取密钥更新码使用</p> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="License密钥更新" xid="controlGroup3"> 
    <div class="x-control-group-title" xid="controlGroupTitle3" style="height:60px;"> 
      <span xid="span3">title</span> 
	    <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-left pull-right"
	      label="更新" xid="btnUpdate" icon="glyphicon glyphicon-hdd" onClick="btnUpdateClick"> 
	      <i xid="i2" class="glyphicon glyphicon-hdd"/>  
	      <span xid="span5">更新</span>
	    </a>
    </div>  
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
      xid="labelTextarea2"> 
      <label class="x-label" xid="label4" style="width:150px;">License密钥更新码：</label>  
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
        xid="textarea2" style="height:200px;" bind-text="regCode"/> 
    </div>  
    <p xid="p2">说明：获取License密钥更新码请登录http://reg.justep.com使用“获取License密钥更新码”功能</p>  
  </div> 
</div>
