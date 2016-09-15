<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" class="window"
  sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="top:308px;left:100px;height:auto;"/>  
  <div xid="serverDiv" style="margin-left:22px;margin-right:22px;"> 
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"
      xid="labelEdit1"> 
      <label class="x-label" xid="label1" style="margin-bottom:12px;width:200px;"><![CDATA[服务地址：]]></label>  
      <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
        xid="serverURL"/> 
    </div>  
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
      xid="labelEdit2_2"> 
      <label class="x-label" xid="label2_2" bind-text="$model.appPublished.get()?'本地App【已部署】：':'本地App：'"
        style="margin-bottom:12px;width:200px;"> <![CDATA[本地App：]]> </label>  
      <div class="x-edit" xid="div6_2"> 
        <span bind-checked=" $model.appPublish" bind-enable=" $model.enableAPP"
          class="x-checkbox" component="$UI/system/components/justep/button/checkbox"
          label="包含本地App后，服务端提供App的下载" onChange="appPublishChange" xid="appPublish"/> 
      </div> 
    </div>  
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
      xid="labelEdit31_2"> 
      <label class="x-label" xid="label41_2" bind-text="$model.uiPublished.get() =='1'?'UI资源【已部署】：':'UI资源：'"
        style="margin-bottom:12px;width:200px;"> <![CDATA[UI资源：]]> </label>  
      <div class="x-edit" xid="div91_2">
        <span bind-checked=" $model.uiPublish" bind-enable=" $model.enableUI"
          class="x-checkbox" component="$UI/system/components/justep/button/checkbox"
          label="模式1和模式2发布编译好的www目录，模式3直接发布UI2目录" onChange="uiPublishChange" xid="uiPublish"/>
      </div> 
    </div>  
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
      xid="labelEdit41_2"> 
      <label class="x-label" xid="label51_2" bind-text='$model.baasPublished.get()?"BaaS【已部署】：":"BaaS："'
        style="margin-bottom:12px;width:200px;"> <![CDATA[BaaS：]]> </label>  
      <div class="x-edit" xid="div111_2">
        <span bind-checked="$model.baasPublish" checked="true" class="x-checkbox"
          component="$UI/system/components/justep/button/checkbox" label="BaaS提供后台服务，供UI通过ajax调用      "
          onChange="baasPublishChange" xid="baasPublish"/>
      </div> 
    </div>  
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
      xid="labelEdit51_2"> 
      <label class="x-label" xid="label61_2" bind-text='$model.sqlPublished.get()?"SQL【已部署】：":"SQL："'
        style="margin-bottom:12px;width:200px;"> <![CDATA[SQL：]]> </label>  
      <div class="x-edit" xid="div131_2">
        <span bind-checked=" $model.sqlPublish" class="x-checkbox" component="$UI/system/components/justep/button/checkbox"
          label="用于数据库初始化，在 Baas/sql目录" xid="sqlPublish"/>
      </div> 
    </div> 
  </div> 
</div>
