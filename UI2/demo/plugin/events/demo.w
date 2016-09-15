<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="Events"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">
Cordova事件</p>   <p xid="introduceP" style="height:100%;width:100%;"  xui:update-mode="merge-and-replace">
Cordova提供了一组事件，包括：deviceready，pause，resume，backbutton，menubutton，searchbutton，volumedownbutton，volumeupbutton。应用可以监听这些事件，在监听中完成对事件的响应。x5在此基础上，增加一个事件：handleOpenURL，通过URL打开应用时触发该事件，具体参见demo:customURL</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">
Android,IOS</p>    <div xid="div2_2" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_2" >
<b >

Android,IOS:</b>
</p>
</div>
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="deviceReady事件监听" onClick="onDeviceReadyClick" style="width:100%;" xid="button1_3" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i1_3" />
<span xid="span1_3" >

deviceReady事件监听</span>
</a>
    <p xid="p21_1" xui:parent="demoContent" xui:update-mode="insert" />
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="pause事件监听" onClick="onPauseClick" style="width:100%;" xid="button11_1" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i11_1" />
<span xid="span11_1" >

pause事件监听</span>
</a>
    <p xid="p31_1" xui:parent="demoContent" xui:update-mode="insert" />
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="resume事件监听" onClick="onResumeClick" style="width:100%;" xid="button21_1" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i21_1" />
<span xid="span21_1" >

resume事件监听</span>
</a>
    <p xid="p1_1" xui:parent="demoContent" xui:update-mode="insert" />
    <a class="btn btn-default" component="$UI/system/components/justep/button/button" label="停止事件监听" onClick="stopEventListener" style="width:100%;" xid="button11_4" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i11_4" />
<span xid="span11_4" >

停止事件监听</span>
</a>
    <div xid="div1_2" xui:parent="demoContent" xui:update-mode="insert" >
<p />
<p />
<p xid="p1_1111" >
<b >

Android:</b>
</p>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="backbutton事件监听" onClick="onBackKeyDownClick" style="width:100%;height:100%;" xid="button11_4" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i11_4" />
<span xid="span11_4" >

backbutton事件监听</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="volumeupbutton事件监听" onClick="onVolumeDownKeyDownClick" style="width:100%;height:100%;" xid="button31_1" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i31_1" />
<span xid="span31_1" >

volumeupbutton事件监听</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="volumedownbutton事件监听" onClick="onVolumeUpKeyDownDownClick" style="width:100%;height:100%;" xid="button41_1" xui:parent="demoContent" xui:update-mode="insert" >
<i xid="i41_1" />
<span xid="span41_1" >

volumedownbutton事件监听</span>
</a>
</div>
   <p xid="accountP"  xui:update-mode="merge-and-replace">
事件监听、响应demo。</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建监听函数</p>
    <div xid="setListeners" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听deviceReady</p>
    <div xid="onDeviceReadyClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听resume</p>
    <div xid="onResumeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听pauseClick</p>
    <div xid="onPauseClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听backbutton</p>
    <div xid="onBackKeyDownClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听volumedownbutton</p>
    <div xid="onVolumeDownKeyDownClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

监听volumeupbutton</p>
    <div xid="onVolumeUpKeyDownDownClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

移除所有监听</p>
    <div xid="stopEventListener" xui:parent="codeContent" xui:update-mode="insert" />

</div>