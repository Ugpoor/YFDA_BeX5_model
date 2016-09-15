<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="$UI/portal/base/base.w"
  sysParam="false" xid="window" class="window">  
  <div class="x-portal-root hide" style="display:none;" xid="div1_6" xui:parent="window"
    xui:update-mode="insert"> 
    <div class="x-portal-head"> 
      <table class="x-portal-head-table"> 
        <tr> 
          <td class="x-portal-head-left"> 
            <img class="x-portal-head-logo" src="img/logo.png"/> 
          </td>  
          <td class="x-portal-head-main"> 
            <div class="x-portal-head-username"> 
              <span>欢迎</span>  
              <span class="x-portal-username"/> 
            </div>  
            <div class="x-portal-head-bar"> 
              <div class="btn-group x-portal-agent"> 
                <a aria-expanded="false" aria-haspopup="true" class="btn btn-link btn-icon-left dropdown-toggle"
                  data-toggle="dropdown"> 
                  <i class="icon-ios7-browsers"/>  
                  <span>代理</span> 
                </a>  
                <ul class="dropdown-menu"/> 
              </div>  
              <a class="btn btn-link btn-only-label x-portal-task-wait"> 
                <span>待办任务<span class="badge" bind-text="waitTaskCount"></span></span> 
              </a>  
              <a class="btn btn-link btn-icon-left x-portal-reload" component="$UI/system/components/justep/button/button"
                icon="icon-refresh" label="刷新" style="display:none;"> 
                <i class="icon-refresh"/>  
                <span>刷新</span> 
              </a>  
              <a class="btn btn-link btn-icon-left x-portal-setPassWord"
                component="$UI/system/components/justep/button/button" icon="icon-ios7-gear-outline"
                label="修改密码"> 
                <i class="icon-ios7-gear-outline"/>  
                <span>修改密码</span> 
              </a>  
              <a class="btn btn-link btn-icon-left x-portal-logout" component="$UI/system/components/justep/button/button"
                icon="icon-ios7-contact-outline" label="注销"> 
                <i class="icon-ios7-contact-outline"/>  
                <span>注销</span> 
              </a> 
            </div> 
          </td> 
        </tr> 
      </table>  
      <div class="x-portal-first-meun"/> 
    </div>  
    <div class="x-portal-second-meun"> 
      <a class="x-portal-second-meun-btn-left"> 
        <i class="icon-chevron-left"/> 
      </a>  
      <a class="x-portal-second-meun-btn-right"> 
        <i class="icon-chevron-right"/> 
      </a> 
    </div>  
    <div class="x-portal-content"> 
      <table class="x-portal-content-table"> 
        <tbody class=""> 
          <tr class="x-portal-content-tr"> 
            <td class="x-portal-content-main"> 
              <div> 
			    <div class="x-portal-func-head">
			      <a class="x-portal-closeall-btn" title="关闭所以打开功能"> 
			        <i class="icon-close"/> 
			      </a> 
                  <ul class="nav nav-tabs x-portal-func-tabs"/>
                </div>    
                <div class="x-portal-content-pages"> 
                  <div active="0" class="x-contents x-portal-pages" component="$UI/system/components/justep/contents/contents"
                    xid="contents"/> 
                </div> 
              </div> 
            </td> 
          </tr> 
        </tbody> 
      </table> 
    </div> 
  </div> 
</div>
