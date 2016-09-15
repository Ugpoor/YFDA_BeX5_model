<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window x-full-screen" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:291px;top:239px;"/>  
  <!-- Nav tabs -->  
  <div component="$UI/system/components/justep/tabs/tabs" class="x-tabs" xid="tabs1"
    onSelect="tabs1Select"> 
    <div component="$UI/system/components/justep/panel/panel" class="x-panel"
      xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <ul class="nav nav-tabs" xid="ul1"> 
          <li class="active" xid="li1"> 
            <a content="tabContent_1" xid="tabItem1">tab1</a> 
          </li>  
          <li xid="li2"> 
            <a content="tabContent1" xid="tabItem2"><![CDATA[tab2]]></a> 
          </li> 
        </ul> 
      </div>  
      <div class="x-panel-content" xid="content2"> 
        <div component="$UI/system/components/justep/contents/contents" class="x-contents"
          active="0" xid="contents1"> 
          <div class="x-contents-content active" xid="content1"> 
            <h4 xid="h11" style="margin-top:0;"><![CDATA[justep/tabs组件默认是高100%, 需要window组件设置"x-full-screen" class]]></h4>  
            <h4 xid="h12" style="margin-top:5;"><![CDATA[通过操作, 切换到第2页]]></h4>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="切换到 tab2" xid="button1" onClick="{operation:'tabs1.setActiveTab', args: {xid: '\'li2\''}}"> 
              <i xid="i1"/>  
              <span xid="span1">切换到 tab2</span> 
            </a> 
          </div>  
          <div class="x-contents-content" xid="content3"/> 
        </div> 
      </div> 
    </div> 
  </div>  
  <resource xid="resource2">
    <require xid="require1" url="css!$UI/demo/font-awesome-4.3.0/css/fa.icons"/>
  </resource>
</div>
