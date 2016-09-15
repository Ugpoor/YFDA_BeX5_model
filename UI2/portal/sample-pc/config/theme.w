<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window portal-theme-config" component="$UI/system/components/justep/window/window"
  sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:256px;top:6px;"
    onLoad="modelLoad"></div>  
  <div class="theme-panel"> 
    <div class="toggler-close" xid="closeBtn" bind-click="closeBtnClick"/>  
    <div class="theme-options"> 
      <div class="theme-option theme-colors clearfix"> 
        <span>主题颜色</span>  
        <ul> 
          <li class="color-default current tooltips" data-style="default"
            data-container="body" data-original-title="Default"/>  
          <li class="color-darkblue tooltips" data-style="darkblue" data-container="body"
            data-original-title="Dark Blue"/>  
          <li class="color-blue tooltips" data-style="blue" data-container="body"
            data-original-title="Blue"/>  
          <li class="color-grey tooltips" data-style="grey" data-container="body"
            data-original-title="Grey"/>  
          <li class="color-light tooltips" data-style="light" data-container="body"
            data-original-title="Light"/>  
          <li class="color-light2 tooltips" data-style="light2" data-container="body"
            data-html="true" data-original-title="Light 2"/> 
          <li class="color-blue2 tooltips" data-style="blue2" data-container="body"
            data-original-title="Blue2"/>  
        </ul> 
      </div>  
      <div class="theme-option"> 
        <span>布局</span>  
        <select class="layout-option form-control input-sm"> 
          <option value="fluid" selected="selected">流式的</option>  
          <option value="boxed">固定宽度</option> 
        </select> 
      </div>  
      <div class="theme-option"> 
        <span>头部</span>  
        <select class="page-header-option form-control input-sm"> 
          <option value="fixed" selected="selected">固定</option>  
          <option value="default">默认</option> 
        </select> 
      </div>  
      <!--   
            <div class="theme-option"> 
              <span>Top Menu Dropdown</span>  
              <select class="page-header-top-dropdown-style-option form-control input-sm"> 
                <option value="light" selected="selected">Light</option>  
                <option value="dark">Dark</option> 
              </select> 
            </div>
             -->  
      <div class="theme-option"> 
        <span>侧边栏模式</span>  
        <select class="sidebar-option form-control input-sm"> 
          <option value="fixed" selected="selected">固定</option>  
          <option value="default">默认</option> 
        </select> 
      </div>  
      <div class="theme-option"> 
        <span>菜单</span>  
        <select class="sidebar-menu-option form-control input-sm"> 
          <option value="accordion" selected="selected">收拉式</option>  
          <option value="hover">侧出式</option> 
        </select> 
      </div>  
      <div class="theme-option"> 
        <span>侧边栏风格</span>  
        <select class="sidebar-style-option form-control input-sm"> 
          <option value="default" selected="selected">默认</option>  
          <option value="light">简洁的</option> 
        </select> 
      </div>  
      <div class="theme-option"> 
        <span>侧边栏位置</span>  
        <select class="sidebar-pos-option form-control input-sm"> 
          <option value="left" selected="selected">左</option>  
          <option value="right">右</option> 
        </select> 
      </div>  
      <div class="theme-option"> 
        <span>底部</span>  
        <select class="page-footer-option form-control input-sm"> 
          <option value="fixed" selected="selected">固定</option>  
          <option value="default">默认</option> 
        </select> 
      </div> 
      <div class="theme-option"> 
        <span></span>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="恢复默认设置" xid="resetBtn" style="color:#cfcfcf" onClick="resetBtnClick">
   <i xid="i1"></i>
   <span xid="span1">恢复默认设置</span></a></div> 
    </div> 
  </div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="receiver" style="left:66px;top:18px;"></span></div>
