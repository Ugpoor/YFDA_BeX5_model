<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:302px;left:12px;height:auto;"> 
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
    <div class="x-panel-content" xid="content1"><div xid="div1" style="padding:10px 20px 20px 20px;"><p xid="p1"><![CDATA[当前网页在手机系统浏览器中打开，点击下面的按钮即可回到原应用中去，应当注意的是跳转的URL必须是在插件中配置的URL，默认为“wex5app”，如果开发者修改了默认值，就需要在按钮的点击事件中修改URL，否则将无法跳转。]]></p><div xid="div3"></div></div>
  <div xid="div2" style="padding:40px;height:50px;"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="回到原应用" xid="button1" style="width:100%;" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span1">回到原应用</span></a></div>
  </div>
  </div> 
</div>