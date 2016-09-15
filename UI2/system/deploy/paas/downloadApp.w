<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" class="window"
  sysParam="false">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:408px;top:314px;"
    onLoad="modelLoad"/>  
  <div xid="div6" style="padding-left: 8px;"> 
    <label class="x-label">服务地址：</label>  
    <label xid="showUrl" class="x-label" bind-click="showUrlClick" style="cursor:pointer;"><![CDATA[正在获取……]]></label> 
  </div>  
  <div xid="div7" style="padding: 8px"> 
    <label class="x-label"><![CDATA[应用状态：]]></label>  
    <label xid="showState" class="x-label"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      style="padding-top:0;padding-bottom: 10px;" label="打开CloudX5控制台" xid="openPaaSBtn"
      onClick="openPaaSBtnClick"> 
      <i xid="i2"/>  
      <span xid="span2">打开CloudX5控制台</span> 
    </a> 
  </div>  
  <div xid="div9" style="padding: 8px"> 
    <div xid="androidDiv" style="position:relative;display:inline-block;" class="clearfix"> 
      <img src="$UI/system/deploy/package/img/android.png" alt="" xid="androidImage"
        style="cursor:pointer;position:absolute;top:0px;left:0px;width:128px;margin-top:26px;"
        bind-click="androidImageClick" height="128px"/>  
      <div style="display:inline-block;margin-left:128px;text-align:center;"> 
        <div component="$UI/system/components/justep/barcode/barcodeImage"
          class="xui-barcodeImage" type="qr" templateName="templateName" xid="androidQR"
          style="height:180px;width:180px;display:block" barcodeConfig="{mw:1.0}"/>  
        <label xid="divAndroid"><![CDATA[正在生成……]]></label> 
      </div> 
    </div>  
    <div xid="iosDiv" style="position:relative;display:inline-block;" class="clearfix"> 
      <img src="$UI/system/deploy/package/img/apple.png" alt="" xid="iosImage"
        style="cursor:pointer;width:128px;position:absolute;top:0px;left:0px;margin-top:26px;"
        bind-click="iosImageClick" height="128px"/>  
      <div style="display:inline-block;margin-left:128px;text-align:center;"> 
        <div component="$UI/system/components/justep/barcode/barcodeImage"
          class="xui-barcodeImage" type="qr" templateName="templateName" xid="iosQR"
          style="height:180px;width:180px;display:block" barcodeConfig="{mw:1.0}"/>  
        <label xid="divIOS"><![CDATA[正在生成……]]></label> 
      </div> 
    </div>  
    <!--     <label xid="tipLabel" class="x-label" style="font-size:x-large;font-weight:bold;display:none"><![CDATA[未生成android或者ios本地App]]></label> --> 
  </div>  
    
  <div xid="div1" style="padding-left: 8px;"> 
    <label xid="howInstallLabel" class="x-label" bind-click="howInstallLabelClick" style="cursor:pointer;display:block;"><![CDATA[如何安装？请点这里]]></label>  
    <label xid="importentLabel" class="x-label" bind-click="howInstallLabelClick" style="color:#FF8000;"><![CDATA[]]></label> 
  </div><span component="$UI/system/components/justep/timer/timer" xid="checkServerState"
    onTimer="checkServerStateTimer" enabled="true" interval="1000" times="3"/>  
  <div component="$UI/system/components/justep/popOver/popOver" class="x-popOver"
    xid="restartPopOver"> 
    <div class="x-popOver-overlay" xid="div2"/>  
    <div class="x-popOver-content" xid="div3"/> 
  </div> 
</div>
