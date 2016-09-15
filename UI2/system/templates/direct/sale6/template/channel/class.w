<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:27px;top:15px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="classData" idColumn="id">
      <column label="id" name="id" type="String" xid="xid1"/>  
      <column label="类名" name="fClassName" type="String" xid="xid2"/>  
      <data xid="default1">[{"id":"1","fClassName":"新品特辑"},{"id":"2","fClassName":"毛呢大衣"},{"id":"3","fClassName":"羽绒服"},{"id":"4","fClassName":"连衣裙"},{"id":"5","fClassName":"半身裙"},{"id":"6","fClassName":"风衣/外套"},{"id":"7","fClassName":"裤子"},{"id":"8","fClassName":"物价"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="分类"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="backBtnClick"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">分类</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/list/list" class="x-list x-classList"
        xid="list1" data="classData"> 
        <ul class="x-list-template x-min-height" xid="ul1" componentname="ul(html)"
          id="undefined_ul1"> 
          <li xid="li1" class="col-xs-3 pull-left" componentname="li(html)"
            id="undefined_li1" bind-click="openClick"> 
            <div class="text-center">
              <span xid="span1" bind-text="ref('fClassName')"/>
            </div>
          </li>
        </ul> 
      </div>
    </div> 
  </div> 
</div>
