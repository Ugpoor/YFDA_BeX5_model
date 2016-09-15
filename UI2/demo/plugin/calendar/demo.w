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
   <div xid="titleBar" title="Calendar"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">
ID：cordova-plugin-calendar</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">
日历插件允许用户创建活动、查询活动、删除活动。对活动的管理，可以在app内实现，也可在系统的“日历”里查看。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">
Android,IOS</p>    <div style="height:50px;padding:40px" xid="div11_1" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="IOSAndroid" >
<b >

Android、IOS：</b>
</p>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="打开日历" onClick="openCalendarClick" style="width:100%;" xid="button111_1" >
<i xid="i111_1" />
<span xid="span111_1" >
打开日历</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="创建一个活动（交互方式）" onClick="createEventInteractivelyClick" style="width:100%;" xid="button112_1" >
<i xid="i112_1" />
<span xid="span112_1" >

创建一个活动（交互方式）</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="创建一个带通知活动（参数方式）" onClick="createEventWithOptionsClick" style="width:100%;" xid="button11_1" >
<i xid="i11_1" />
<span xid="span11_1" >

创建一个带通知活动（参数方式）</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="创建一个无通知活动（参数方式）" onClick="createEventClick" style="width:100%;" xid="button21_1" >
<i xid="i21_1" />
<span xid="span21_1" >

创建一个无通知活动（参数方式）</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="查询活动" onClick="findEventClick" style="width:100%;" xid="button41_1" >
<i xid="i41_1" />
<span xid="span41_1" >

查询活动</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="删除活动" onClick="deleteEventClick" style="width:100%;" xid="button51_1" >
<i xid="i51_1" />
<span xid="span51_1" >

删除活动</span>
</a>
<p />
<p />
<p xid="AndroidAny" >
<b >

仅Android：</b>
</p>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="按日期范围查询" onClick="listEventsInRange" style="width:100%;" xid="button611_1" >
<i xid="i611_1" />
<span xid="span611_1" >

按日期范围查询</span>
</a>
<p />
<p />
<p xid="IOSAny" >
<b >

仅IOS：</b>
</p>
<p xid="IOSAny1" >

如果创建自定义日历失败，需要先在IOS设置中，把 iCloud 日历开启。然后进行创建操作。</p>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="创建“我的X5日历”" onClick="createCalendar" style="width:100%;" xid="button61_1" >
<i xid="i61_1" />
<span xid="span61_1" >

创建“我的X5日历”</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="创建X5活动" onClick="createEventInNamedCalendar" style="width:100%;" xid="button62_1" >
<i xid="i62_1" />
<span xid="span62_1" >

创建X5活动</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="查询X5活动" onClick="findAllEventsInNamedCalendar" style="width:100%;" xid="button71_1" >
<i xid="i71_1" />
<span xid="span71_1" >

查询X5活动</span>
</a>
<p />
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="删除“我的X5日历”" onClick="deleteCalendar" style="width:100%;" xid="button81_1" >
<i xid="i81_1" />
<span xid="span81_1" >

删除“我的X5日历”</span>
</a>
</div>
    <div style="height:50px;padding:40px" xid="div61_1" xui:parent="demoContent" xui:update-mode="insert" />
   <p xid="accountP"  xui:update-mode="merge-and-replace">
活动创建的方式有交互式、参数式，并可创建活动通知。IOS支持自定义日历。</p>   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xui:parent="codeContent" xui:update-mode="insert" >

设置好要使用的参数</p>
    <div xid="setParameters" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

打开日历</p>
    <div xid="openCalendarClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建一个带通知活动（参数方式）</p>
    <div xid="createEventWithOptionsClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建一个活动（交互方式）</p>
    <div xid="createEventInteractivelyClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建一个无通知活动（参数方式）</p>
    <div xid="createEventClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

查询活动</p>
    <div xid="findEventClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

删除活动</p>
    <div xid="deleteEventClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

按日期范围查询</p>
    <div xid="listEventsInRange" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建“我的X5日历”</p>
    <div xid="createCalendar" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

创建X5活动</p>
    <div xid="createEventInNamedCalendar" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

查询X5活动</p>
    <div xid="findAllEventsInNamedCalendar" xui:parent="codeContent" xui:update-mode="insert" />
    <p xui:parent="codeContent" xui:update-mode="insert" >

删除“我的X5日历”</p>
    <div xid="deleteCalendar" xui:parent="codeContent" xui:update-mode="insert" />

</div>