<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:429px;top:-14px;"/> 
<div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="contents2">
   <div class="x-contents-content" xid="content2"><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1">
   <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" style="background-color:#EAF3F7;">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="return" icon="icon-arrow-left-c">
   <i xid="i5" class="icon-arrow-left-c"></i>
   <span xid="span9"></span>新手入门</a></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="popMenu_btn" icon="icon-navicon-round" onClick="popMenu_btnClick">
   <i xid="i4" class="icon-navicon-round"></i>
   <span xid="span8"></span></a></div></div></div>
   <div class="x-panel-content" xid="content3" _xid="C6F7F2C3A9800001A8991D869AA0D060">
   	
  <h4><![CDATA[WeX5开发指南
  ]]></h4>
   WeX5入门、UI2开发、App开发、服务端开发、扩展资料学习。
   <h5>1 新手入门</h5>
   1.1 运行WeX5的demo(视频)<br/>1.2 App开发、调试、打包部署完整过程（视频）<br/>
   1.3 创建第一个应用(视频)  (文字)<br/>
   1.4 开发环境IDE的使用(视频)<br/>
   1.5 轻松看透WeX5产品能力和技术！<br/>
   1.6 WeX5技术理念<br/>
   1.7 WeX5可以怎么玩？<br/>
   1.8 WeX5和BeX5比较
   <h5>2 UI2开发</h5>
   2.1 框架基础(一) (二)<br/>
   2.2 组件基础<br/>
   2.3 编程基础<br/>
   2.3.1 js引用<br/>
   2.3.2 css、text引用<br/>
   2.3.3 如何设置资源依赖（.w、cordova插件、目录和文件依赖）<br/>
   2.4 代码调试<br/>
   2.5 数据组件<br/>
   2.6 数据绑定核心(文字) (视频)<br/>
   2.7 数据绑定属性系列<br/>
  	 初识绑定 visible绑定 text绑定 html绑定 css绑定<br/>
  	 
	2.8 页面布局<br/>
	2.9 页面样式<br/>
	2.9.1 样式基础<br/>
	2.9.2 添加自定义图标(iconfont)<br/>
	2.10 常用组件<br/>
	2.11 前端路由和页面跳转<br/>
	2.11.1 路由模块<br/>
	2.11.2 页面跳转<br/>
	2.12 部署和发布<br/>
	2.12.1 三种部署方式<br/>
	2.12.2 Web app部署<br/>
	2.12.3 UIServer的缓存机制<br/>
	2.13 自定义组件开发<br/>
	2.13.1 组件运行时开发案例<br/>
	2.13.2 组件设计时开发案例<br/>
	2.13.3 组件设计时开发参考<br/>
	2.13.4 属性编辑器配置和开发<br/>
	2.14 自定义向导开发(waiting)<br/>
	2.15 第三方库集成<br/>
	2.15.1 集成Echarts<br/>
	2.15.2 集成百度和高德地图<br/>
	2.15.3 BeX5微信企业号集成
	<h4>3 App开发</h4>
	打包
	......
	<div>
		
	</div>
  </div>
   <div class="x-panel-bottom" xid="bottom1">
   <p style="float:left;margin:12px 0 0 5px; width:20%">分享到：</p>
   <ul xid="share_detail" class="share_detail" >
  	<li><img alt="" xid="qq" style=""  bind-click="qqClick" bind-attr-src="$model.getImageUrl('./img/qq.jpg')"></img></li>
   <li><img alt="" xid="kongjian" bind-click="kongjianClick" bind-attr-src="$model.getImageUrl('./img/kongjian.png')"></img></li>
   <li><img alt="" xid="pengyouquan" bind-click="pengyouquanClick" bind-attr-src="$model.getImageUrl('./img/pengyouquan.png')"></img></li>
   <li><img alt="" xid="weixin" bind-click="weixinClick" bind-attr-src="$model.getImageUrl('./img/weixin.png')"></img></li>
   <li><img alt="" xid="weibo" style="margin-left:5px;" bind-click="weiboClick" bind-attr-src="$model.getImageUrl('./img/weibo.png')"></img></li>
   </ul>
   </div>
  </div></div></div>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="popMenu" direction="right-bottom" anchor="popMenu_btn">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu2">
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="分享" xid="button11" icon="icon-ios7-redo"> 
          <i xid="i10" class="icon-ios7-redo"/>  
          <span xid="span21">分享</span>
        </a> 
      </li>  
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="收藏" xid="button15" icon="icon-ios7-star-outline"> 
          <i xid="i14" class="icon-ios7-star-outline"/>  
          <span xid="span25">收藏</span>
        </a> 
      </li>
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="截屏" xid="button13" icon="icon-ios7-albums-outline"> 
          <i xid="i12" class="icon-ios7-albums-outline"/>  
          <span xid="span23">截屏</span>
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="夜间模式" xid="button14" icon="icon-android-display"> 
          <i xid="i13" class="icon-android-display"/>  
          <span xid="span24">夜间模式</span>
        </a> 
      </li> 
    </ul></div></div>