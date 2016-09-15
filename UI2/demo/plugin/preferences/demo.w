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

  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
  <div xid="accountP" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone" style="height:auto;left:591px;top:540px;"  xui:update-mode="merge"/>
   <div xid="titleBar" title="preferences"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">






ID：cordova-plugin-app-preferences</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">


数据存储插件：支持存储数据、获取数据、建立数据变化监听、删除指定数据、删除所有数据的功能，支持简单和复杂数据结构。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">


Android、IOS</p>    <div xid="div12_2" xui:parent="demoContent" xui:update-mode="insert" >
<p style="font-size:medium;font-weight:bolder;" xid="accountP" xui:update-mode="merge-and-replace" >
<![CDATA[数据存储]]>
</p>
<p xid="p111_2" xui:parent="div12_2" xui:update-mode="insert" >
<![CDATA[数据存储有两种方式，key、value为参数或者dict, key、value为参数。dict为key的描述，dict项可以为空。]]>
</p>
</div>
    <div style="padding:10px;" xid="div11_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="存储数据" onClick="storeClick" style="width:100%;" xid="store" >
<i xid="i11_2" />
<span xid="span11_2" >












存储数据</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p11_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[获取数据]]>
</p>
    <p xid="p21_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[获取数据的方式有两种，key为参数或者dict、key为参数。dict为key的描述，dict项可以为空。]]>
</p>
    <div style="padding:10px;" xid="div21_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取数据" onClick="fetchClick" style="width:100%;" xid="fetch" >
<i xid="i12_2" />
<span xid="span12_2" >












获取数据</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p31_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[建立数据变化监听]]>
</p>
    <p xid="p41_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[建立数据监听，可以监测到"键值对"值得变化，并可得到该"键值对"的键(key)。注意：监听只能创建一次，如果多次创建监听，会导致值变化一次，引发多次监听响应。]]>
</p>
    <div style="padding:10px;" xid="div31_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="建立数据变化监听" onClick="watchClick" style="width:100%;" xid="watch" >
<i xid="i21_2" />
<span xid="span21_2" >






建立数据变化监听</span>
</a>
</div>
    <div class="x-contents-content" style="padding:10px;width:100%;" xid="content11_2" xui:parent="demoContent" xui:update-mode="insert" >
<div style="height:15px;" xid="div91_2" />
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p72_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[删除数据]]>
</p>
    <p xid="p62_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[删除指定key的数据。]]>
</p>
    <div style="padding:10px;" xid="div72_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="删除指定数据" onClick="removeClick" style="width:100%;" xid="remove" >
<i xid="i42_2" />
<span xid="span42_2" >
<![CDATA[删除数据]]>
</span>
</a>
</div>
    <p style="font-size:medium;font-weight:bolder;" xid="p141_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[删除所有数据]]>
</p>
    <p xid="p131_2" xui:parent="demoContent" xui:update-mode="insert" >
<![CDATA[删除所有已经存储的数据。]]>
</p>
    <div style="padding:10px;" xid="div101_2" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="删除所有数据" onClick="clearAllClick" style="width:100%;" xid="clearAll" >
<i xid="i61_2" />
<span xid="span61_2" >












删除所有数据</span>
</a>
</div>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p511_3" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[存储数据]]>
</p>
    <div xid="storeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p11_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取数据]]>
</p>
    <div xid="fetchClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p21_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[建立数据变化监听]]>
</p>
    <div xid="watchClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p31_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[删除指定数据]]>
</p>
    <div xid="removeClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p41_1" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[删除所有数据]]>
</p>
    <div xid="clearAllClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>