<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="$UI/demo/plugin/template/demo.w" 
  __id="id_1" 
  design="device:m;" 
  class="window" >

  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone" style="height:auto;left:591px;top:540px;"  xui:update-mode="merge"/>
   <div xid="titleBar" title="Badge"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">









ID：de.appplant.cordova.plugin.badge</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">









应用图标数字提醒。iOS通过应用图标数字进行提醒；Android系统由于系统限制，通过状态栏进行提醒</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">






Android、IOS</p>    <div style="padding:10px;text-align:center;" xid="div11_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="检查权限" onClick="hasPermissionClick" style="width:100%;" xid="hasPermission" >
<i xid="i11_2" />
<span xid="span11_2" >




















检查权限</span>
</a>
</div>
    <div style="padding:10px;text-align:center;" xid="div21_7" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="注册权限" onClick="registerPermissionClick" style="right:20px;width:100%;" xid="registerPermission" >
<i xid="i111_7" />
<span xid="span211_7" >














注册权限</span>
</a>
</div>
    <div style="height:20px;" xid="div13_7" xui:parent="demoContent" xui:update-mode="insert" />
    <div style="height:140px;" xid="div11_7" xui:parent="demoContent" xui:update-mode="insert" >
<p style="font-size:medium;vertical-align:middle;font-weight:bolder;text-align:center;width:100%;" xid="p31_7" xui:parent="div2" xui:update-mode="insert" >
<![CDATA[提醒相关]]>
</p>
<p style="height:20px;" xid="p2_7" >
<![CDATA[设置提醒：设置数字标签的数目]]>
</p>
<p style="height:20px;" xid="p51_7" >
<![CDATA[获取提醒数目：获取当前数字标签的值]]>
</p>
<p style="height:20px;" xid="p61_7" >
<![CDATA[清除提醒：清除数字标签提醒]]>
</p>
<p style="height:20px;" xid="p11_9" >
<![CDATA[更改标题：更改提醒的标题，只对Android有效]]>
</p>
</div>
    <div class="center-block" style="padding:10px;text-align:center;" xid="div21_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="设置提醒(10)" onClick="setBadgeClick" style="width:100%;" xid="setBadge" >
<i xid="i41_2" />
<span xid="span31_2" >












设置提醒(10)</span>
</a>
</div>
    <div class="center-block" dir="ltr" style="padding:10px;text-align:center;" xid="div71_7" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取提醒数目" onClick="getBadgeClick" style="width:100%;" xid="getBadge" >
<i xid="i71_7" />
<span xid="span61_7" >














获取提醒数目</span>
</a>
</div>
    <div class="center-block" style="padding:10px;text-align:center;" xid="div81_7" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="清除提醒" onClick="clearBadgeClick" style="width:100%;" xid="clearBadge" >
<i xid="i91_7" />
<span xid="span111_7" >














清除提醒</span>
</a>
</div>
    <div class="center-block" dir="ltr" style="padding:10px;text-align:center;height:50px;" xid="div11_9" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="更改标题" onClick="chageTitleClick" style="width:100%;" xid="chageTitle" >
<i xid="i21_9" />
<span xid="span21_9" >












更改标题</span>
</a>
</div>
   <div xid="div2" style="auto"  xui:update-mode="merge"/>
    <p style="font-size:medium;vertical-align:middle;font-weight:bolder;text-align:center;width:100%;" xid="p11_2" xui:parent="div2" xui:update-mode="insert" >
<![CDATA[权限相关（IOS相关，Android无需关注）]]>
</p>
    <p style="width:100%;height:20px;" xid="p1_7" xui:parent="div2" xui:update-mode="insert" >
<![CDATA[检查权限：检查设备是否有设置数字标签的权限]]>
</p>
    <p style="width:100%;height:20px;" xid="p41_7" xui:parent="div2" xui:update-mode="insert" >
<![CDATA[注册权限：注册数字标签的权限]]>
</p>
    <p style="width:100%;height:30px;" xid="p31_9" xui:parent="div2" xui:update-mode="insert" >
<![CDATA[注册权限的时候会弹出类似下面的对话框，点击ok或者确定即可获得权限]]>
</p>
    <img alt="" dir="rtl" src="notification.jpg" style="width:100%;" xid="image2_1" xui:parent="div2" xui:update-mode="insert" />
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p12_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[检查权限]]>
</p>
    <div xid="hasPermissionClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p18_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[注册权限]]>
</p>
    <div xid="registerPermissionClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p21_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[设置提醒]]>
</p>
    <div xid="setBadgeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p31_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取提醒数据]]>
</p>
    <div xid="getBadgeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p41_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[清除提醒]]>
</p>
    <div xid="clearBadgeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p51_2" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[更改标题]]>
</p>
    <div xid="chageTitleClick" xui:parent="codeContent" xui:update-mode="insert" />
    <div xid="modelModelConstructDone" xui:parent="codeContent" xui:update-mode="insert" />

</div>