<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/demo/plugin/template/demo.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:m;" >

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="AppAvailability"  xui:update-mode="merge"/>
    <h4 xid="h41_1" xui:parent="infoContent" xui:update-mode="insert" >
<![CDATA[常用第三方软件：]]>
</h4>
    <p xid="p1_1" xui:parent="infoContent" xui:update-mode="insert" />
    <li xui:parent="infoContent" xui:update-mode="insert" >




	QQ<br />




	IOS URL Scheme:mqq:// <br />




	Android包名:com.tencent.mobileqq</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	微信<br />




	IOS URL Scheme:weixin://<br />




	Android包名:com.tencent.mm</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	腾讯微博<br />




	IOS URL Scheme:TencentWeibo:// <br />




	Android包名:com.tencent.WBlog</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	淘宝<br />




	IOS URL Scheme:taobao:// <br />




	Android包名:com.taobao.taobao</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	支付宝<br />




	IOS URL Scheme:alipay:// <br />




	Android包名:com.eg.android.AlipayGphone</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	新浪微博<br />




	IOS URL Scheme:sinaweibo:// <br />




	Android包名:com.sina.weibo</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	QQ浏览器<br />




	IOS URL Scheme:mqqbrowser://<br />




	Android包名:com.tencent.mttlite</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	uc浏览器<br />




	IOS URL Scheme:ucbrowser:// <br />




	Android包名:com.ucweb.iphone.uc</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	搜狗浏览器<br />




	IOS URL Scheme:SogouMSE:// <br />




	Android包名:com.sogou.SogouExplorerMobile</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	百度地图<br />




	IOS URL Scheme:baidumap:// <br />




	Android包名:com.baidu.BaiduMap</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	优酷<br />




	IOS URL Scheme:youku:// <br />




	Android包名:com.youku.phone</li>
    <li xui:parent="infoContent" xui:update-mode="insert" >




	知乎<br />




	IOS URL Scheme:zhihu:// <br />




	Android包名:com.zhihu.android</li>
   <p xid="p1"  xui:update-mode="merge-and-replace">








ID:cordova-plugin-appavailability</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">










此插件的功能是在设备上检查是否安装了某个app。在ios平台使用该功能需要URI Scheme(如"mqq://")，在安卓平台则需要包名（如com.tencent.mobileqq）。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">











Android、IOS</p>    <div style="padding:10px;height:45px;" xid="div1_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="QQ" onClick="QQClick" style="width:100%;" xid="QQ" >
<i xid="i1_5" />
<span xid="span1_5" >






















QQ</span>
</a>
</div>
    <div style="padding:10px;height:45px;" xid="div2_5" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="微信" onClick="weixinClick" style="width:100%;" xid="weixin" >
<i xid="i2_5" />
<span xid="span2_5" >






















微信</span>
</a>
</div>
    <div style="padding:10px;height:45px;" xid="div1_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="新浪微博" onClick="sinaweiboClick" style="width:100%;" xid="sinaweibo" >
<i xid="i1_1" />
<span xid="span1_1" >






















新浪微博</span>
</a>
</div>
    <div style="padding:10px;height:45px;" xid="div21_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="百度地图" onClick="baidumapClick" style="width:100%;" xid="baidumap" >
<i xid="i2_1" />
<span xid="span2_1" >






















百度地图</span>
</a>
</div>
    <div style="height:50px;padding:10px" xid="div81_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="优酷" onClick="youkuClick" style="width:100%;" xid="youku" >
<i xid="i81_1" />
<span xid="span81_1" >






















优酷</span>
</a>
</div>
    <div style="height:50px;padding:10px" xid="div91_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="支付宝" onClick="AlipayClick" style="width:100%;" xid="Alipay" >
<i xid="i91_1" />
<span xid="span91_1" >






















支付宝</span>
</a>
</div>
    <div style="height:50px;padding:10px" xid="div111_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="手机淘宝" onClick="taobaoClick" style="width:100%;" xid="taobao" >
<i xid="i111_1" />
<span xid="span111_1" >






















手机淘宝</span>
</a>
</div>
    <div style="height:50px;padding:10px" xid="div141_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="知乎" onClick="zhihuClick" style="width:100%;" xid="zhihu" >
<i xid="i141_1" />
<span xid="span141_1" >












知乎</span>
</a>
</div>
   <p xid="accountP"  xui:update-mode="merge-and-replace">










通过URI Scheme (iOS平台，例："mqq://") 或者包名(Android平台，例："com.tencent.mobileqq")判断指定的应用是否已安装。</p>    <p xid="p11_5" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[检查QQ安装情况，其它条目替换的只是参数，可在信息页查看常用App的配置参数。]]>
</p>
    <div xid="QQClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>