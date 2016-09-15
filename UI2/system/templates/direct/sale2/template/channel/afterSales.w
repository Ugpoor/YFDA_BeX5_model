<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="title" name="title" type="String" xid="default2"/>  
      <data xid="default3">[{"id":"1","title":"新旗舰即将发布 HTC One Max售4060元"},{"id":"2","title":"顶配版Galaxy S5曝光：4G内存/64位处理器"},{"id":"3","title":"WP8系统最强手机 诺基亚1520仅售3610"},{"id":"4","title":"3G一样很快捷 三星Note 3 N9008售3800"},{"id":"5","title":"2014款HTC One再曝光：外观参数已无悬念"},{"id":"6","title":"高性能防水4G手机 索尼L39t售3799元"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="售后服务"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">售后服务</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list1" data="data" limit="-1" disablePullToRefresh="true" disableInfiniteLoad="true"> 
        <ul class="x-list-template" xid="listTemplateUl1"> 
          <li xid="li1" class="list-group-item" bind-click="open"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right"
              xid="button1" icon="icon-ios7-arrow-right"> 
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
