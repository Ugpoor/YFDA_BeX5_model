<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window" sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:195px;top:46px;"
    onLoad="modelLoad"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="modeData" idColumn="ID"><column label="ID" name="ID" type="String" xid="xid1"></column>
  <column label="Value" name="Value" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;ID&quot;:&quot;1&quot;,&quot;Value&quot;:&quot;模式1：UI资源启动后智能更新模式。WeX5推荐使用本模式，使用到的UI资源编译为标准的Web资源（HTML、CSS、JS等），并部署到Web服务器上，支持多版本同时运行和灰度发布，如Web服务端资源有更新，则延迟（异步）更新；无Web服务端的本地应用，UI资源直接包含到本地应用中，也推荐使用此模式&quot;},{&quot;ID&quot;:&quot;2&quot;,&quot;Value&quot;:&quot;模式2：UI资源启动时立即更新模式。使用到的UI资源编译为标准的Web资源（HTML、CSS、JS等），并部署到Web服务器上，如Web服务端资源有更新，则启动时立即（同步）更新资源&quot;},{&quot;ID&quot;:&quot;3&quot;,&quot;Value&quot;:&quot;模式3：UI资源通过UIServer访问。BeX5推荐使用本模式；WeX5调试时也推荐本模式，但由于WeX5服务端更为灵活，发布推荐使用模式1&quot;},{&quot;ID&quot;:&quot;4&quot;,&quot;Value&quot;:&quot;模式4：打开一个非WeX5开发的网站。本模式的App类似一个没有地址栏并打开一个默认网址的浏览器，并可用js调用本地插件&quot;}]</data></div></div>  
  
  
  
  
  <div xid="div1" style="padding-top:16px;"><span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group x-radio-group-vertical" xid="modeRadioGroup" bind-itemset="modeData" bind-itemsetValue="ref('ID')" bind-itemsetLabel="ref('Value')"></span></div></div>
