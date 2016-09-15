<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:794px;top:191px;"
    onLoad="modelLoad"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="x5 api 示例"
        class="x-titlebar"> 
        <div class="x-titlebar-left"/>  
        <div class="x-titlebar-title">x5 api 示例</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <!--      <div>body</div> -->  
      <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
        <ul class="nav nav-tabs" xid="ul1"> 
          <li class="active" xid="li1"> 
            <a content="tabContent1" xid="tabItem1"><![CDATA[基础接口]]></a>
          </li>  
          <li role="presentation" xid="li2"> 
            <a content="tabContent2" xid="tabItem2"><![CDATA[分享接口]]></a>
          </li>  
          <li xid="li3"> 
            <a content="tabContent3" xid="tabItem3"><![CDATA[图像接口]]></a>
          </li>  
          <li xid="li4"> 
            <a content="tabContent4" xid="tabItem4"><![CDATA[音频接口]]></a>
          </li>  
          <li xid="li5"> 
            <a content="tabContent5" xid="tabItem5"><![CDATA[智能接口]]></a>
          </li>  
          <li xid="li6"> 
            <a content="tabContent6" xid="tabItem6"><![CDATA[设备信息接口]]></a>
          </li>  
          <li xid="li7"> 
            <a content="tabContent7" xid="tabItem7"><![CDATA[地理位置接口]]></a>
          </li>  
          <li xid="li8"> 
            <a content="tabContent8" xid="tabItem8"><![CDATA[界面操作接口]]></a>
          </li>  
          <li xid="li9"> 
            <a content="tabContent9" xid="tabItem9"><![CDATA[微信扫一扫接口]]></a>
          </li>  
          <li xid="li10"> 
            <a content="tabContent10" xid="tabItem10"><![CDATA[微信小店接口]]></a>
          </li>  
          <li xid="li11"> 
            <a content="tabContent11" xid="tabItem11"><![CDATA[微信卡券接口]]></a>
          </li>  
          <li xid="li12"> 
            <a content="tabContent12" xid="tabItem12"><![CDATA[微信支付接口]]></a>
          </li>
        </ul>  
        <div class="tab-content" xid="div1"> 
          <div class="tab-pane active" xid="tabContent1">
            <h3 id="menu-basic" xid="h31">基础接口</h3>  
            <span class="desc" xid="span1">判断当前客户端是否支持指定JS接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              xid="checkJsApi" onClick="checkJsApiClick" class="btn btn-default">checkJsApi</a>
          </div>  
          <div class="tab-pane" xid="tabContent2">
            <h3 id="menu-share" xid="h32">分享接口</h3>  
            <span class="desc" xid="span2">获取“分享到朋友圈”按钮点击状态及自定义分享内容接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="onMenuShareTimeline" onClick="shareToTimeline">shareToTimeline</a>  
            <span class="desc" xid="span3">获取“分享给朋友”按钮点击状态及自定义分享内容接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="onMenuShareAppMessage" onClick="shareToAppmessage">shareToAppmessage</a>  
            <span class="desc" xid="span4">获取“分享到QQ”按钮点击状态及自定义分享内容接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="onMenuShareQQ" onClick="shareToQQ">shareToQQ</a>  
            <span class="desc" xid="span5">获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="onMenuShareWeibo" onClick="shareToWeibo">shareToWeibo</a>  
            <span class="desc" xid="span6">获取“分享到QZone”按钮点击状态及自定义分享内容接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="onMenuShareQZone" onClick="shareToQzone">shareToQzone</a>
          </div>  
          <div class="tab-pane" xid="tabContent3">
            <h3 id="menu-image" xid="h33">图像接口</h3>  
            <span class="desc" xid="span7">拍照或从手机相册中选图接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="chooseImage" onClick="chooseImageClick">chooseImage</a>  
            <span class="desc" xid="span8">预览图片接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="previewImage" onClick="previewImageClick">previewImage</a>  
            <span class="desc" xid="span9">上传图片接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="uploadImage" onClick="uploadImageClick">uploadImage</a>  
            <span class="desc" xid="span10">下载图片接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="downloadImage" onClick="downloadImageClick">downloadImage</a>
          </div>  
          <div class="tab-pane" xid="tabContent4">
            <h3 id="menu-voice" xid="h34">音频接口</h3>  
            <span class="desc" xid="span11">开始录音接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="startRecord" onClick="startRecordClick">startRecord</a>  
            <span class="desc" xid="span12">停止录音接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="stopRecord" onClick="stopRecordClick">stopRecord</a>  
            <span class="desc" xid="span13">播放语音接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="playVoice" onClick="playVoiceClick">playVoice</a>  
            <span class="desc" xid="span14">暂停播放接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="pauseVoice" onClick="pauseVoiceClick">pauseVoice</a>  
            <span class="desc" xid="span15">停止播放接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="stopVoice" onClick="stopVoiceClick">stopVoice</a>  
            <span class="desc" xid="span16">上传语音接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="uploadVoice" onClick="uploadVoiceClick">uploadVoice</a>  
            <span class="desc" xid="span17">下载语音接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="downloadVoice" onClick="downloadVoiceClick">downloadVoice</a>
          </div>  
          <div class="tab-pane" xid="tabContent5">
            <h3 id="menu-smart" xid="h35">智能接口</h3>  
            <span class="desc" xid="span18">识别音频并返回识别结果接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="translateVoice" onClick="translateVoiceClick">translateVoice</a>
          </div>  
          <div class="tab-pane" xid="tabContent6">
            <h3 id="menu-device" xid="h36">设备信息接口</h3>  
            <span class="desc" xid="span19">获取网络状态接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="getNetworkType" onClick="getNetworkTypeClick">getNetworkType</a>
          </div>  
          <div class="tab-pane" xid="tabContent7">
            <h3 id="menu-location" xid="h37">地理位置接口</h3>  
            <span class="desc" xid="span20">使用微信内置地图查看位置接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="openLocation" onClick="openLocationClick">openLocation</a>  
            <span class="desc" xid="span21">获取地理位置接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="getLocation" onClick="getLocationClick">getLocation</a>
          </div>  
          <div class="tab-pane" xid="tabContent8">
            <h3 id="menu-webview" xid="h38">界面操作接口</h3>  
            <span class="desc" xid="span22">隐藏右上角菜单接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="hideOptionMenu" onClick="hideOptionMenuClick">hideOptionMenu</a>  
            <span class="desc" xid="span23">显示右上角菜单接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="showOptionMenu" onClick="showOptionMenuClick">showOptionMenu</a>  
            <span class="desc" xid="span24">关闭当前网页窗口接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="closeWindow" onClick="closeWindowClick">closeWindow</a>  
            <span class="desc" xid="span25">批量隐藏功能按钮接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="hideMenuItems" onClick="hideMenuItemsClick">hideMenuItems</a>  
            <span class="desc" xid="span26">批量显示功能按钮接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="showMenuItems" onClick="showMenuItemsClick">showMenuItems</a>  
            <span class="desc" xid="span27">隐藏所有非基础按钮接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="hideAllNonBaseMenuItem" onClick="hideAllNonBaseMenuItemClick">hideAllNonBaseMenuItem</a>  
            <span class="desc" xid="span28">显示所有功能按钮接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="showAllNonBaseMenuItem" onClick="showAllNonBaseMenuItemClick">showAllNonBaseMenuItem</a>
          </div>  
          <div class="tab-pane" xid="tabContent9">
            <h3 id="menu-scan" xid="h39">微信扫一扫</h3>  
            <span class="desc" xid="span29">调起微信扫一扫接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="scanQRCode0" onClick="scanQRCode0Click">scanQRCode(微信处理结果)</a>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="scanQRCode1" onClick="scanQRCode1Click">scanQRCode(直接返回结果)</a>
          </div>  
          <div class="tab-pane" xid="tabContent10">
            <h3 id="menu-shopping" xid="h310">微信小店接口</h3>  
            <span class="desc" xid="span30">跳转微信商品页接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="openProductSpecificView" onClick="openProductSpecificViewClick">openProductSpecificView</a>
          </div>  
          <div class="tab-pane" xid="tabContent11">
            <h3 id="menu-card" xid="h311">微信卡券接口</h3>  
            <span class="desc" xid="span31">批量添加卡券接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="addCard" onClick="addCardClick">addCard</a>  
            <span class="desc" xid="span32">调起适用于门店的卡券列表并获取用户选择列表</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="chooseCard" onClick="chooseCardClick">chooseCard</a>  
            <span class="desc" xid="span33">查看微信卡包中的卡券接口</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="openCard" onClick="openCardClick">openCard</a>
          </div>  
          <div class="tab-pane" xid="tabContent12">
            <h3 id="menu-pay" xid="h312">微信支付接口</h3>  
            <span class="desc" xid="span34">发起一个微信支付请求</span>  
            <a component="$UI/system/components/justep/button/button" bind-enable="ready"
              class="btn btn-default " xid="chooseWXPay" onClick="chooseWXPayClick">chooseWXPay</a>
          </div>
        </div> 
      </div>
<!--       <div class="wxapi_container"> 
                <div class="wxapi_index_container"> 
          <ul class="label_box lbox_close wxapi_index_list"> 
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-basic">基础接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-share">分享接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-image">图像接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-voice">音频接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-smart">智能接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-device">设备信息接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-location">地理位置接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-webview">界面操作接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-scan">微信扫一扫接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-shopping">微信小店接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-card">微信卡券接口</a> 
            </li>  
            <li class="label_item wxapi_index_item"> 
              <a class="label_inner" href="#menu-pay">微信支付接口</a> 
            </li> 
          </ul> 
        </div>    
        <div class="lbox_close wxapi_form"></div> 
      </div>  -->
    </div> 
  </div> 
</div>
