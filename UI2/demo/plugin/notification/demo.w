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
   <div xid="model" onModelConstructDone="modelModelConstructDone" style="height:auto;top:400px;left:563px;"  xui:update-mode="merge"/>
   <div xid="titleBar" title="notification"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">











ID：de.appplant.cordova.plugin.local-notification</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">本插件的作用是：在通知栏显示自定义参数的通知，提醒用户有待办事项，如新消息、会议等。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">











Android、iOS</p>    <div style="padding:10px;" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="静音通知" onClick="silentMsgClick" style="width:100%;" xid="silentMsg" >
<i xid="i11_1" />
<span xid="span11_1" >














静音通知</span>
</a>
</div>
    <div style="padding:10px;" xid="div12_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="有声音和标题的通知" onClick="MsgWithT_SClick" style="width:100%;" xid="MsgWithT_S" >
<i xid="i12_1" />
<span xid="span12_1" >


















有声音和标题的通知</span>
</a>
</div>
    <div style="padding:10px;" xid="div21_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="有数据的通知" onClick="MsgWithDataClick" style="width:100%;" xid="MsgWithData" >
<i xid="i21_1" />
<span xid="span21_1" >


















有数据的通知</span>
</a>
</div>
    <div style="padding:10px;" xid="div31_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="显示通知，更新应用角标（iOS）" onClick="MsgWithBadgeClick" style="width:100%;" xid="MsgWithBadge" >
<i xid="i31_1" />
<span xid="span31_1" >


















显示通知，更新应用角标（iOS）</span>
</a>
</div>
    <div style="padding:10px;" xid="div41_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="每分钟通知一次" onClick="MsgWithSoundEveryMinuteClick" style="width:100%;" xid="MsgWithSoundEveryMinute" >
<i xid="i41_1" />
<span xid="span41_1" >
















每分钟通知一次</span>
</a>
</div>
    <p xid="p11_1" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[通知管理]]>
</p>
    <div style="padding:10px;" xid="div13_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="显示通知的ID" onClick="getNotificationIDsClick" style="width:100%;" xid="getNotificationIDs" >
<i xid="i13_1" />
<span xid="span13_1" >
















显示提醒的ID</span>
</a>
</div>
    <div style="padding:10px;" xid="div22_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="取消所有通知" onClick="cancelAllNotificationClick" style="width:100%;" xid="cancelAllNotification" >
<i xid="i22_1" />
<span xid="span22_1" >
















取消所有提醒</span>
</a>
</div>
   <p xid="accountP"  xui:update-mode="merge-and-replace">







本机通知：每个通知都会在点击十秒后生效，以便最小化应用。</p>    <p xid="p1_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[静音通知]]>
</p>
    <div style="padding:10px" xid="silentMsgClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p11_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[有声音和标题的通知]]>
</p>
    <div style="padding:10px" xid="MsgWithT_SClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p21_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[有数据的通知]]>
</p>
    <div style="padding:10px" xid="MsgWithDataClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p31_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[显示通知，更新应用角标（iOS）]]>
</p>
    <div style="padding:10px" xid="MsgWithBadgeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p51_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[每分钟通知一次]]>
</p>
    <div style="padding:10px" xid="MsgWithSoundEveryMinuteClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p61_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[显示通知的ID]]>
</p>
    <div style="padding:10px" xid="getNotificationIDsClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p71_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[取消所有通知]]>
</p>
    <div style="padding:10px" xid="cancelAllNotificationClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>