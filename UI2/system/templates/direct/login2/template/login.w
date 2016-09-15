<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:13px;top:202px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel2"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            label="返回" xid="backBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span6">返回</span> 
          </a>  
          </div>  
        <div class="x-titlebar-title" xid="div3"/>  
        <div class="x-titlebar-right reverse" xid="div4"/> 
      </div> 
    </div>  
    <div class="x-panel-content  x-cards container" xid="content1"> 
      <div xid="div1" class="list-group"> 
        <div class="list-group-item"> 
          <div class="input-group" xid="div7"> 
            <span class="input-group-addon" xid="span2"> 
              <i class="icon-ios7-contact"/> 
            </span>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="nameInput" placeHolder="邮箱/手机号"/>
          </div> 
        </div>  
        <div class="list-group-item" xid="div6"> 
          <div class="input-group" xid="div8"> 
            <span class="input-group-addon" xid="span3"> 
              <i class="icon-unlocked" xid="i3"/> 
            </span>  
            <input component="$UI/system/components/justep/input/input" class="form-control x-inputText" xid="passwordInput" placeHolder="密码"/>
          </div> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn list-group x-black btn-only-label btn-block"
        label="登录" xid="loginBtn"> 
        <i xid="i4"/>  
        <span xid="span4">登录</span> 
      </a>  
      <div class="text-muted" bind-text="'还可以选择以下方式登录'"></div>
      <div class="list-group"><div class="list-group-item">
        <div component="$UI/system/components/bootstrap/row/row" class="x-row  text-center" xid="row1"> 
          <div class="x-col " xid="col5"> 
            <img src="" alt="" bind-attr-src="$model.toUrl('./img/weixin.png')" class="img3" xid="image2" />  
            <div bind-text="'微信账号登录'" class="text-muted" xid="div15" />
          </div>
          <div class="x-col " xid="col6"> 
            <img src="" alt="" bind-attr-src="$model.toUrl('./img/weibo.png')" class="img3" xid="image1" />  
            <div bind-text="'新浪微博登录'" class="text-muted" xid="div13" />
          </div>
          <div class="x-col " xid="col7"> 
            <img src="" alt="" xid="image4" bind-attr-src="$model.toUrl('./img/qq.png')" class="img3" />  
            <div bind-text="'QQ账号登录'" class="text-muted" xid="div14" />
          </div>
        </div>  
        <div class="h5">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-only-icon pull-right" label="button" xid="button2" icon="icon-ios7-arrow-right">
   <i xid="i1" class="icon-ios7-arrow-right text-muted"></i><span xid="span5"></span></a><span xid="span8" class="text-black">没有账号？</span>  
          <span class="text-danger" xid="register"><![CDATA[注册]]></span>
  </div>
      </div></div>
    </div> 
  </div> 
</div>
