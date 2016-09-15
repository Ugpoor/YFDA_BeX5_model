<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default1"/>  
      <column label="title" name="title" type="String" xid="default2"/>  
      <column label="titleImg" name="titleImg" type="String" xid="default3"/>  
      <data xid="default4">[{"id":"1","title":"新旗舰即将发布 HTC One Max售4060元","titleImg":"./img/5-1.jpg"},{"id":"2","title":"顶配版Galaxy S5曝光：4G内存/64位处理器","titleImg":"./img/5-2.jpg"},{"id":"3","title":"WP8系统最强手机 诺基亚1520仅售3610","titleImg":"./img/5-3.jpg"},{"id":"4","title":"3G一样很快捷 三星Note 3 N9008售3800","titleImg":"./img/5-4.jpg"},{"id":"5","title":"2014款HTC One再曝光：外观参数已无悬念","titleImg":"./img/5-5.jpg"},{"id":"6","title":"高性能防水4G手机 索尼L39t售3799元","titleImg":"./img/5-6.jpg"},{"id":"7","title":"双卡双待入门级手机 索尼Xperia E1亮相","titleImg":"./img/5-7.jpg"},{"id":"8","title":"iOS 7.1新增应用内购买15分钟免输密码提醒","titleImg":"./img/5-8.jpg"},{"id":"9","title":"实用是真理 2500元级2GB RAM四核机推荐","titleImg":"./img/5-10.jpg"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="促销活动"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">促销活动</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
        xid="scrollView1"> 
        <div class="x-content-center x-pull-down container" xid="div1"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1"/>  
          <span class="x-pull-down-label" xid="span2">下拉刷新...</span> 
        </div>  
        <div class="x-scroll-content" xid="div2"> 
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="data" limit="5"> 
            <ul class="x-list-template" xid="listTemplateUl1"> 
              <li xid="li1" bind-click="open" class="list-group-item"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-icon pull-right" label="button" xid="button1"
                  icon="icon-ios7-arrow-right"> 
                  <i xid="i2" class="icon-ios7-arrow-right text-muted"/>  
                  <span xid="span1"/>
                </a>
                <h5 bind-text="ref('title')" class="text-black"><![CDATA[]]></h5> 
              </li> 
            </ul> 
          </div> 
        </div>  
        <div class="x-content-center x-pull-up" xid="div3"> 
          <span class="x-pull-up-label" xid="span3">加载更多...</span> 
        </div> 
      </div>  
    </div> 
  </div> 
</div>
