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
   <div xid="titleBar" title="voiceManager"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">

ID：com.justep.cordova.plugin.voiceManager</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">

音频控制插件，通过参数设置可以调节手机音频的播放模式为外放模式/听筒模式</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

iOS，Android</p>    <div style="padding:40px 40px 40px 40px;height:50px;" xid="div3_16" xui:parent="demoContent" xui:update-mode="insert" >
<audio controls="controls" src="http://www.runoob.com/try/demo_source/horse.mp3" >

您的浏览器不支持此格式</audio>
</div>
    <div style="padding:40px 40px 40px 40px;height:50px;" xid="div1_16" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="选择听筒模式" onClick="button1_16Click" style="width:100%;" xid="button1_16" >
<i xid="i1_16" />
<span xid="span1_16" >


选择听筒模式</span>
</a>
</div>
    <div style="padding:40px 40px 40px 40px;height:50px;" xid="div2_16" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="选择外放模式" onClick="button2_16Click" style="width:100%;" xid="button2_16" >
<i xid="i2_16" />
<span xid="span2_16" >


选择外放模式</span>
</a>
</div>
   <div xid="div3" style="padding:20px"  xui:update-mode="merge"/>
   <p xid="accountP"  xui:update-mode="merge-and-replace">

选择模式接口：当参数为“0”，则为正常的外放模式，当参数为“1”，则为听筒模式。参数的类型为Int类型。</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_24" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[选择听筒模式]]>
</p>
    <div xid="button1_16Click" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_24" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[选择外放模式]]>
</p>
    <div xid="button2_16Click" xui:parent="codeContent" xui:update-mode="insert" />

</div>