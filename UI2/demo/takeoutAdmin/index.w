<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="$UI/demo/takeoutAdmin/base/base.w" 
  xid="window" class="window body page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-header-fixed page-sidebar-fixed page-footer-fixed"
  component="$UI/system/components/justep/window/window" design="device:pc" sysParam="false">  
  <div class="page-root" style="display: none;" xui:parent="window" xui:update-mode="insert"> 
    <!-- BEGIN HEADER -->  
    <div class="page-header navbar navbar-fixed-top" style="height:46px;"> 
      <!-- BEGIN HEADER INNER -->  
      <div class="page-header-inner"> 
        <!-- BEGIN LOGO -->  
        <div class="page-logo"> 
          <a> 
            <img src="./assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/> 
          </a>  
          <div class="menu-toggler sidebar-toggler"> 
            <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header --> 
          </div> 
        </div>  
        <!-- END LOGO -->  
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->  
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
          data-target=".navbar-collapse"/>  
        <!-- END RESPONSIVE MENU TOGGLER -->  
        <!-- BEGIN TOP NAVIGATION MENU -->  
        <div class="top-menu"> 
          <ul class="nav navbar-nav pull-right"> 
            <!-- BEGIN OPENED DROPDOWN -->  
            <li id="portal-opened" class="dropdown dropdown-user" style="display:none;"> 
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                data-x5-hover="dropdown" data-close-others="true"> 
                <i class="icon-ios7-browsers"/>  
                <span class="username username-hide-on-mobile">已打开功能</span>  
                <i class="fa fa-angle-down"/> 
              </a>  
              <ul class="dropdown-menu dropdown-menu-default"> 
                <li class="external"> 
                  <h3> 
                    <span class="bold">12</span> 个打开的功能
                  </h3>  
                  <a href="#" class="closeAll">全部关闭</a> 
                </li>  
                <li> 
                  <ul class="dropdown-menu-content scroller" data-height="160px"/> 
                </li> 
              </ul> 
            </li>  
            <li class="dropdown dropdown-user"> 
              <a id="portal-reload" class="dropdown-toggle x-portal-reload" style="display:none;"> 
                <i class="icon-refresh"/>  
                <span class="username username-hide-on-mobile">刷新</span> 
              </a> 
            </li>  
            <!-- END OPENED DROPDOWN -->  
            <!-- BEGIN USER LOGIN DROPDOWN -->  
            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->  
            <li class="dropdown dropdown-user"> 
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                data-x5-hover="dropdown" data-close-others="true"> 
                <i class="icon-user"/>  
                <!-- 
              <img alt="" class="img-circle" src="./assets/admin/layout/img/avatar3_small.jpg"/>  
              -->  
                <span id="username" class="username username-hide-on-mobile x-portal-username"/>  
                <i class="fa fa-angle-down"/> 
              </a>  
              <ul class="dropdown-menu dropdown-menu-default"> 
                <li> 
                  <a component="$UI/system/components/justep/button/button"
                    label="配置" xid="configBtn" onClick="configBtnClick"> 
                    <i class="icon-settings"/> 配置
                  </a> 
                </li>  
                <li class="divider"/>  
                <li> 
                  <a component="$UI/system/components/justep/button/button" class="x-portal-logout"
                    label="注销" xid="logoutBtn" icon="icon-power"> 
                    <i xid="i1" class="icon-power"/>  
                    <span xid="span1">注销</span> 
                  </a>  
                </li> 
              </ul> 
            </li>  
            <!-- END USER LOGIN DROPDOWN -->  
            <!-- BEGIN QUICK SIDEBAR TOGGLER -->  
            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->  
            <!--   
          <li class="dropdown dropdown-quick-sidebar-toggler"> 
            <a href="javascript:;" class="dropdown-toggle"> 
              <i class="icon-logout"/> 
            </a> 
          </li>
           -->  
            <!-- END QUICK SIDEBAR TOGGLER --> 
          </ul> 
        </div>  
        <!-- END TOP NAVIGATION MENU --> 
      </div>  
      <!-- END HEADER INNER --> 
    </div>  
    <!-- END HEADER -->  
    <div class="clearfix"/>  
    <!-- BEGIN CONTAINER -->  
    <div class="page-container"> 
      <!-- BEGIN SIDEBAR -->  
      <div class="page-sidebar-wrapper"> 
        <div class="page-sidebar navbar-collapse collapse"> 
          <!-- BEGIN SIDEBAR MENU -->  
          <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->  
          <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->  
          <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->  
          <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->  
          <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->  
          <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->  
          <ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true"
            data-slide-speed="200"> 
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->  
            <li class="sidebar-search-wrapper" style="display:none;"> 
              <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->  
              <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->  
              <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->  
              <form class="sidebar-search sidebar-search-bordered sidebar-search-solid"
                action="extra_search.html" method="POST"> 
                <a href="javascript:;" class="remove"> 
                  <i class="icon-close"/> 
                </a>  
                <div class="input-group"> 
                  <input type="text" class="form-control" placeholder="Search..."/>  
                  <span class="input-group-btn"> 
                    <a href="javascript:;" class="btn submit"> 
                      <i class="icon-magnifier"/> 
                    </a> 
                  </span> 
                </div> 
              </form>  
              <!-- END RESPONSIVE QUICK SEARCH FORM --> 
            </li>  
            <li class="start active open"> 
              <a isMain="true" class="ajaxify"> 
                <i class="icon-home"/>  
                <span class="title">主页</span>  
                <span class="selected"/> 
              </a> 
            </li> 
          </ul>  
          <!-- END SIDEBAR MENU --> 
        </div> 
      </div>  
      <!-- END SIDEBAR -->  
      <div class="page-content-wrapper"> 
        <div class="page-content"> 
          <div class="page-content-close"> 
            <a component="$UI/system/components/justep/button/button" xid="closeFuncBtn"
              onClick="closeFuncBtnClick"> 
              <i class="icon-close-round"/> 
            </a> 
          </div>  
          <h3 class="page-title">首页</h3>  
          <div component="$UI/system/components/justep/contents/contents" class="x-contents x-portal-pages"
            active="0" xid="pages" wrap="false" swipe="false" routable="true"/> 
        </div> 
      </div>  
      <!-- BEGIN QUICK SIDEBAR -->  
      <div class="page-quick-sidebar-wrapper"> 
        <div class="page-quick-sidebar"> 
          <div class="nav-justified"/> 
        </div> 
      </div>  
      <!-- END QUICK SIDEBAR --> 
    </div>  
    <!-- END CONTAINER -->  
    <!-- BEGIN FOOTER -->  
    <div class="page-footer" style="height: 33px;"> 
      <div class="page-footer-inner">2000-2016 © 北京起步科技有限公司</div>  
      <div class="scroll-to-top"> 
        <i class="icon-arrow-up"/> 
      </div> 
    </div>  
    <!-- END FOOTER --> 
  </div>
  <div xui:parent="window" xui:update-mode="insert">
  	<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="configDialog"
	    src="$UI/demo/takeoutAdmin/config/theme.w" status="normal" width="420px" height="auto"
	    top="100px" style="left:36px;top:60px;"/>
  </div>	      
</div>
