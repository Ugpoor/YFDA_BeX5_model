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

  <div xid="div3" xui:update-mode="delete"/>
  <div xid="div6" xui:update-mode="delete"/>
  <div xid="div7" xui:update-mode="delete"/>
   <div xid="model" onModelConstructDone="modelModelConstructDone"  xui:update-mode="merge"/>
   <div xid="titleBar" title="appVersion"  xui:update-mode="merge"/>
   <p xid="p1"  xui:update-mode="merge-and-replace">


ID：cordova-plugin-app-version</p>   <p xid="introduceP"  xui:update-mode="merge-and-replace">


APP版本信息插件，通过该插件可获取该应用的名字、发布版本号、内部版本号标识、包名相关信息。</p>   <p xid="platformP"  xui:update-mode="merge-and-replace">


iOS，Android</p>    <div style="padding:40px 20px 20px 20px;height:50px;" xid="div1_3" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p1_3" >
<![CDATA[获取APP名字的接口，返回值类型：String]]>
</p>
</div>
    <div style="padding:40px;height:50px;" xid="div2_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取APP名字" onClick="nameBtnClick" style="width:100%;" xid="nameBtn" >
<i xid="i1_3" />
<span xid="span1_3" >




获取APP名字</span>
</a>
</div>
    <div style="padding:40px 20px 20px 20px;height:50px;" xid="div3_3" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p2_1" >
<![CDATA[获取APP包名的接口，返回值类型：String]]>
</p>
</div>
    <div style="padding:40px;height:50px;" xid="div4_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取APP包名" onClick="budleIDBtnClick" style="width:100%;" xid="bundleIDBtn" >
<i xid="i2_1" />
<span xid="span2_1" >




获取APP包名</span>
</a>
</div>
    <div style="padding:40px 20px 20px 20px;height:50px;" xid="div5_3" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p3_1" >
<![CDATA[获取APP发布版本号的接口，返回值类型：String]]>
</p>
</div>
    <div style="padding:40px;height:50px;" xid="div6_3" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取APP发布版本号" onClick="appNumberClick" style="width:100%;" xid="appNumber" >
<i xid="i3_1" />
<span xid="span3_1" >




获取APP发布版本号</span>
</a>
</div>
    <div style="padding:40px 20px 20px 20px;height:50px;" xid="div7_1" xui:parent="demoContent" xui:update-mode="insert" >
<p xid="p4_1" >
<![CDATA[获取APP内部版本号标识的接口，返回值类型：String]]>
</p>
</div>
    <div style="padding:40px;height:50px;" xid="div8_1" xui:parent="demoContent" xui:update-mode="insert" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="获取APP内部版本号标识" onClick="appCodeClick" style="width:100%;" xid="appCode" >
<i xid="i4_1" />
<span xid="span4_1" >




获取APP内部版本号标识</span>
</a>
</div>
   <div xid="codeContent" style="padding:10px"  xui:update-mode="merge"/>
    <p xid="p1_21" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[回调方法]]>
</p>
    <div xid="callBack" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p1_20" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取APP的名字]]>
</p>
    <div xid="nameBtnClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p2_20" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取APP的包名]]>
</p>
    <div xid="budleIDBtnClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p3_20" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取APP的发布版本号]]>
</p>
    <div xid="appNumberClick" xui:parent="codeContent" xui:update-mode="insert" />
    <p xid="p4_20" xui:parent="codeContent" xui:update-mode="insert" >
<![CDATA[获取APP的内部版本号标识]]>
</p>
    <div xid="appCodeClick" xui:parent="codeContent" xui:update-mode="insert" />

</div>