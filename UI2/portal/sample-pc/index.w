<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/portal/sample-pc/base/base.w" 
  sysParam="false" 
  xid="window" 
  class="page-footer-fixed body page-sidebar-fixed page-header-fixed window page-quick-sidebar-over-content page-sidebar-closed-hide-logo" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <div class="page-root" style="display: none;" xui:parent="window" xui:update-mode="insert" >
<div class="page-header navbar navbar-fixed-top" style="height:46px;" >
<div class="page-header-inner" >
<div class="page-logo" >
<a >
<img alt="logo" class="logo-default" src="./assets/admin/layout/img/logo.png" />
</a>
<div class="menu-toggler sidebar-toggler" >
</div>
</div>
<a class="menu-toggler responsive-toggler" data-target=".navbar-collapse" data-toggle="collapse" href="javascript:;" />
<div class="top-menu" >
<ul class="nav navbar-nav pull-right" >
<li class="dropdown dropdown-user" id="portal-opened" style="display:none;" >
<a class="dropdown-toggle" data-close-others="true" data-toggle="dropdown" data-x5-hover="dropdown" href="#" >
<i class="icon-ios7-browsers" />
<span class="username username-hide-on-mobile" >

已打开功能</span>
<i class="fa fa-angle-down" />
</a>
<ul class="dropdown-menu dropdown-menu-default" >
<li class="external" >
<h3 >
<span class="bold" >

12</span>

 个打开的功能</h3>
<a class="closeAll" href="#" >

全部关闭</a>
</li>
<li >
<ul class="dropdown-menu-content scroller" data-height="160px" />
</li>
</ul>
</li>
<li class="dropdown dropdown-user" >
<a class="dropdown-toggle x-portal-reload" id="portal-reload" style="display:none;" >
<i class="icon-refresh" />
<span class="username username-hide-on-mobile" >

刷新</span>
</a>
</li>
<li class="dropdown dropdown-user" >
<a class="dropdown-toggle" data-close-others="true" data-toggle="dropdown" data-x5-hover="dropdown" href="#" >
<i class="icon-user" />
<span class="username username-hide-on-mobile x-portal-username" id="username" />
<i class="fa fa-angle-down" />
</a>
<ul class="dropdown-menu dropdown-menu-default" >
<li >
<a component="$UI/system/components/justep/button/button" label="配置" onClick="configBtnClick" xid="configBtn" >
<i class="icon-settings" />

 配置</a>
</li>
<li class="divider" />
<li >
<a class="x-portal-logout" component="$UI/system/components/justep/button/button" icon="icon-power" label="注销" xid="logoutBtn" >
<i class="icon-power" xid="i1" />
<span xid="span1" >

注销</span>
</a>
</li>
</ul>
</li>
</ul>
</div>
</div>
</div>
<div class="clearfix" />
<div class="page-container" >
<div class="page-sidebar-wrapper" >
<div class="page-sidebar navbar-collapse collapse" >
<ul class="page-sidebar-menu" data-auto-scroll="true" data-keep-expanded="false" data-slide-speed="200" >
<li class="sidebar-search-wrapper" style="display:none;" >
<form action="extra_search.html" class="sidebar-search sidebar-search-bordered sidebar-search-solid" method="POST" >
<a class="remove" href="javascript:;" >
<i class="icon-close" />
</a>
<div class="input-group" >
<input class="form-control" placeholder="Search..." type="text" />
<span class="input-group-btn" >
<a class="btn submit" href="javascript:;" >
<i class="icon-magnifier" />
</a>
</span>
</div>
</form>
</li>
<li class="start active open" >
<a class="ajaxify" isMain="true" >
<i class="icon-home" />
<span class="title" >

主页</span>
<span class="selected" />
</a>
</li>
</ul>
</div>
</div>
<div class="page-content-wrapper" >
<div class="page-content" >
<div class="page-content-close" >
<a component="$UI/system/components/justep/button/button" onClick="closeFuncBtnClick" xid="closeFuncBtn" >
<i class="icon-close-round" />
</a>
</div>
<h3 class="page-title" >

首页</h3>
<div active="0" class="x-contents x-portal-pages" component="$UI/system/components/justep/contents/contents" routable="true" swipe="false" wrap="false" xid="pages" />
</div>
</div>
<div class="page-quick-sidebar-wrapper" >
<div class="page-quick-sidebar" >
<div class="nav-justified" />
</div>
</div>
</div>
<div class="page-footer" style="height: 33px;" >
<div class="page-footer-inner" >

2000-2016 © 北京起步科技有限公司</div>
<div class="scroll-to-top" >
<i class="icon-arrow-up" />
</div>
</div>
</div>
    <div xui:parent="window" xui:update-mode="insert" >
<span component="$UI/system/components/justep/windowDialog/windowDialog" height="auto" src="$UI/portal/sample-pc/config/theme.w" status="normal" style="left:36px;top:60px;" top="100px" width="420px" xid="configDialog" />
</div>

</div>