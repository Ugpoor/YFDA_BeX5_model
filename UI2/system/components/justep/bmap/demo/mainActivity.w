<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="百度地图演示案例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">标题</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="地图标点" xid="button1" style="width:157px;" onClick="button1Click"> 
        <i xid="i1"/>  
        <span xid="span1">地图标点</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="地址解析" xid="button3" onClick="button3Click">
   <i xid="i3"></i>
   <span xid="span3">地址解析</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="地址逆解析" xid="button4" onClick="button4Click">
   <i xid="i4"></i>
   <span xid="span4">地址逆解析</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="地点搜索" xid="button5" onClick="button5Click">
   <i xid="i5"></i>
   <span xid="span5">地点搜索</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="详情检索" xid="button6" onClick="button6Click">
   <i xid="i6"></i>
   <span xid="span6">详情检索</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="公交线路查询" xid="button7" onClick="button7Click">
   <i xid="i7"></i>
   <span xid="span7">公交线路查询</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="线路规划(导航)" xid="button8" onClick="button8Click">
   <i xid="i8"></i>
   <span xid="span8">线路规划(导航)</span></a>
  </div> 
  </div> 
</div>
