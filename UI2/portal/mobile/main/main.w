<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-main" component="$UI/system/components/justep/window/window" sysParam="portal" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:190px;top:137px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/data" xid="mainData"
      idColumn="fID" onCustomRefresh="mainDataCustomRefresh" confirmRefresh="false"> 
      <data xid="default7"/>  
      <column label="id" name="fID" type="String" xid="default1"/>  
      <column label="label" name="fLabel" type="String" xid="default2"/>  
      <column label="content" name="fContent" type="String" xid="default3"/>  
      <column label="time" name="fDate" type="DateTime" xid="default4"/>  
      <column label="count" name="fCount" type="String" xid="default5"/>  
      <column label="iconClass" name="fIconClass" type="String" xid="default6"/>  
      <column label="color" name="fColor" type="String" xid="default9"/>  
      <column label="process" name="fProcess" type="String" xid="default10"/>  
      <column label="activity" name="fActivity" type="String" xid="default11"/>  
      <column label="url" name="fUrl" type="String" xid="default12"/>  
      <column label="subLabel" name="fSubLabel" type="String" xid="default13"/>  
      <column label="tag" name="fTag" type="String" xid="default14"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="agentData"
      idColumn="executor" confirmRefresh="false"> 
      <data xid="default7_1"/>  
      <column label="执行者" name="executor" type="String" xid="default1_1"/>  
      <column label="显示名" name="name" type="String" xid="default2_1"/>  
    </div>  
    </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-top" xid="top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="首页"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="menuBtn" icon="icon-calendar" onClick="menuBtnClick"> 
            <i class="icon-navicon-round icon-calendar"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">首页</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="moreBtn" icon="icon-android-more" onClick="moreBtnClick"> 
            <i xid="i1" class="icon-android-more"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content">
      <div class="debug-mode hide">警告：当前运行在调试模式下， 调试模式下系统运行速度会慢！</div>	 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list" data="mainData" disableInfiniteLoad="true" disablePullToRefresh="true"
        limit="20"> 
        <ul class="x-list-template" xid="listTemplateUl4"> 
          <li xid="li4" class="x-flex list-row" bind-click="li4Click"> 
            <div xid="col21" class="head-pic-data"> 
              <!-- 
              <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                xid="orgImage1" bind-ref="ref('fCreatorID')" orgKind="person"> 
                <div class="x-blob-bar" xid="div5"> 
                  <i class="x-blob-edit icon-compose" xid="i5"/>  
                  <i class="x-blob-del icon-close-round" xid="i6"/> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image7"/> 
              </div>  
            -->  
              <i class="" style="font-size: 44px;" bind-css="val('fIconClass')"
                bind-style="{color: val('fColor')}"/>  
              <div component="$UI/system/components/justep/output/output" bind-visible="val('fCount') &gt; 0"
                class="x-output message-count" xid="output81" bind-ref="ref('fCount')"/> 
            </div>  
            <div class="x-flex1" xid="col23" style="padding-left:10px;"> 
              <div _component="$UI/system/components/justep/row/row" class="x-flex"
                xid="row8"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output title-data" xid="output6" bind-ref="ref('fLabel')"/>  
                <div component="$UI/system/components/justep/output/output"
                  class="x-flex1 x-output subTitle-data" xid="output12" bind-ref="ref('fSubLabel')"/>  
                <div component="$UI/system/components/justep/output/output"
                  class="x-output right-content-data" xid="output2" bind-ref="ref('fDate')"
                  format="yyyy-MM-dd hh:mm"/> 
              </div>  
              <div _component="$UI/system/components/justep/row/row" class="x-flex"
                xid="row9"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-flex1 x-output content-data" xid="output7" bind-ref="ref('fContent')"/>  
                <div component="$UI/system/components/justep/output/output"
                  class="x-output right-content-data" xid="output17" bind-ref="ref('fTag')"/> 
              </div> 
            </div> 
          </li> 
        </ul> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="menu" anchor="moreBtn" dismissible="true" opacity="0.1"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="刷新" xid="soreBtn" onClick="soreBtnClick"> 
          <i xid="i2"/>  
          <span xid="span2">刷新</span> 
        </a> 
      </li> 
      <li class="x-menu-item x-portal-agent hide" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="代理" xid="agentBtn" onClick="agentBtnClick"> 
          <i xid="i3"/>  
          <span xid="span3">代理</span> 
        </a> 
      </li> 
      <li class="x-menu-item x-portal-reload hide" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="reload" xid="reloadBtn" onClick="reloadBtnClick"> 
          <i xid="i4"/>  
          <span xid="span4">reload</span> 
        </a> 
      </li> 
    </ul> 
  </div> 
</div>
