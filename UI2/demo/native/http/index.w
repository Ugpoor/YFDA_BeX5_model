<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="测试"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            </div>  
          <div class="x-titlebar-title">测试</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div xid="div1" style="height:35px;"></div>
  <div xid="div2" style="height:52px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="发送post请求" xid="post" style="width:100%;" onClick="postClick">
   <i xid="i1"></i>
   <span xid="span1">发送post请求</span></a></div>
  <div xid="div3" style="height:59px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="发送get请求" xid="get" style="width:100%;" onClick="getClick">
   <i xid="i2"></i>
   <span xid="span2">发送get请求</span></a></div>
  </div>
  </div> 
</div>