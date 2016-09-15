<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div xid="divLabel" style="height:100%;margin-top:12px;" align="center">输入密码：</div></div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="div1" style="height:100%;width:100%;"> 
        <table style="height:100%;width:100%;"> 
          <tr style="vertical-align: middle;text-align: center;">
            <td style="vertical-align: middle;text-align: center;"> 
              <canvas xid="locker" component="$UI/system/components/justep/locker/locker" class="x-locker" mode="0"
                style="width:320px;height:320px;" 
                onInput="linePoint"/> 
            </td>
          </tr> 
        </table> 
      </div> 
    </div> 
  <div class="x-panel-bottom" xid="bottom1"></div></div> 
</div>
