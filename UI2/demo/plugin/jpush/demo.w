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
   <div xid="titleBar" title="jpush"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">

ID：cn.jpush.phonegap.JPushPlugin</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">极光推送插件：在“极光推送”官网注册开发者账号，设置应用信息后，可将指定信息推送至一个或多个iOS、android设备。（需要推送的信息可以在“极光推送”后台设置也可以写Baas服务，在服务内指定消息内容，本demo使用了Baas下的jpush服务。）</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">

Android、iOS</p>    <div style="padding:10px;" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="接收推送" onClick="ReceiveMessageClick" style="width:100%;" xid="ReceiveMessage" >
<i xid="i11_1" />
<span xid="span11_1" >






接收推送</span>
</a>
</div>
   <p xid="accountP"  xui:update-mode="merge-and-replace">获取RegistrationID，通知Baas服务发送消息，创建notification的监听，接收到通知和点击通知都会在页面弹出hint，显示通知的内容。</p>    <p xid="p21_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取推送信息]]>
</p>
    <div xid="ReceiveMessageClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>