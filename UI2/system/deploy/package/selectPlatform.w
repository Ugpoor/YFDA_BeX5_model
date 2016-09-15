<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:34px;left:522px;"
    onLoad="modelLoad"/>  
  
  
  
  <div xid="div1" style="padding:8px"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="androidCheckbox" checked="true"></span><img src="img/android.png" alt="" xid="androidImage" bind-click="androidImageClick" style="cursor:pointer"></img><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="iosCheckbox"></span><img src="img/apple.png" alt="" xid="iosImage" bind-click="iosImageClick" style="cursor:pointer"></img>
  
  <div xid="div2" style="padding-top:32px;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="includeUIRes" label="本地应用包含UI资源。如果选择包含资源，则可第一次打开不用下载资源，提升速度。模式4（打开非WeX5开发的网站）选项无效" checked="true" style="padding-top:8px;display:block"></span><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="compileUI" label="重新编译使用到的UI资源。如果未选择打包资源，此选项无效" checked="true" style="padding-top:8px;display:block"></span><div xid="div6"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="outputSrc" label="输出源码工程。工程名：" style="padding-top:8px"></span><input component="$UI/system/components/justep/input/input" class="form-control" xid="outputProjectName" style="display:inline-block;width:139px;"></input></div>
  <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="releaseMode" label="发布模式。用于打最终对外发布包，执行性能更优，不支持Chrome/Safari调试；如需开发调试请去掉本选项" checked="true" style="padding-top:8px;display:block"></span><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="useProxyBuilderServer" label="使用应用打包代理服务生成本地应用。对于Windows版WeX5，如需生成ios应用，请连接Mac OS X版的WeX5作为代理服务，启动Mac OS X版WeX5的Tomcat即可" onChange="useProxyBuilderServerChange" style="padding-top:8px;display:block"></span>
  </div>
  <div xid="proxyBuilderServerDiv" style="padding-top:8px;display:none">
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label25" xid="proxyBuilderServerInput">
   <label class="x-label" xid="label2"><![CDATA[应用打包代理服务地址：]]></label>
   <div class="x-edit" xid="div4"><div class="input-group" xid="inputGroup1">
   <input type="text" class="form-control" component="$UI/system/components/justep/input/input" xid="proxyBuilderServer" placeHolder="例：http://ip:port/app-builder"></input>
  <div class="input-group-btn" xid="div5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="连接测试" xid="testServerButton" onClick="testServerButtonClick">
    <i xid="i1"></i>
    <span xid="span1">连接测试</span></a> </div></div></div></div></div></div>
  </div>
