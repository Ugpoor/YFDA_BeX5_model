<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="title" name="title" type="String" xid="default2"/>  
      <data xid="default3">[{"id":"1","title":"背部独特按键设计 LG四核智能G2售3299"},{"id":"2","title":"1.9GHz四核骁龙芯 港版三星I9505售3099"},{"id":"3","title":"6.3英寸巨屏诱惑 三星i9200行货仅2350"},{"id":"4","title":"微软称Mac版Office今年年底前将推出新版"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="服务项目"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">服务项目</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" disablePullToRefresh="false" disableInfiniteLoad="false" data="data"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li bind-click="open" class="list-group-item"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right"
              label="button" xid="button1" icon="icon-ios7-arrow-right"> 
              <i xid="i1" class="icon-ios7-arrow-right text-muted"/>  
              <span xid="span1"/>
            </a>
            <h5 bind-text="ref('title')" class="text-black"><![CDATA[]]></h5> 
          </li> 
        </ul> 
      </div>  
    </div> 
  </div> 
</div>
