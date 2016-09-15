<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:56px;top:220px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="sudokuData" idColumn="fID"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="标题" name="fTitle" type="String" xid="xid2"></column>
  <column label="图片" name="fImg" type="String" xid="xid3"></column>
  <column label="功能1" name="fOptions1" type="String" xid="xid4"></column>
  <column label="功能2" name="fOptions2" type="String" xid="xid5"></column>
  <column label="功能3" name="fOptions3" type="String" xid="xid6"></column>
  <data xid="default1">[{&quot;fID&quot;:&quot;001&quot;,&quot;fTitle&quot;:&quot;个人中心&quot;,&quot;fImg&quot;:&quot;1.png&quot;,&quot;fOptions1&quot;:&quot;个人基础信息设置&quot;,&quot;fOptions2&quot;:&quot;手机短信提醒设置&quot;,&quot;fOptions3&quot;:&quot;更改密码&quot;},{&quot;fID&quot;:&quot;002&quot;,&quot;fTitle&quot;:&quot;个人收藏夹&quot;,&quot;fImg&quot;:&quot;2.png&quot;,&quot;fOptions1&quot;:&quot;查看曾经加入到收藏夹中的数据&quot;},{&quot;fID&quot;:&quot;003&quot;,&quot;fTitle&quot;:&quot;高级搜索&quot;,&quot;fImg&quot;:&quot;3.png&quot;,&quot;fOptions1&quot;:&quot;可搜索整个系统的数据&quot;,&quot;fOptions2&quot;:&quot;可选择多种过滤条件&quot;},{&quot;fID&quot;:&quot;004&quot;,&quot;fTitle&quot;:&quot;文档中心&quot;,&quot;fImg&quot;:&quot;4.png&quot;,&quot;fOptions1&quot;:&quot;保存了自己的文档附件和别人转发的文档&quot;,&quot;fOptions2&quot;:&quot;&quot;,&quot;fOptions3&quot;:&quot;&quot;},{&quot;fID&quot;:&quot;005&quot;,&quot;fTitle&quot;:&quot;帮助中心&quot;,&quot;fImg&quot;:&quot;5.png&quot;,&quot;fOptions1&quot;:&quot;系统使用常见问题&quot;,&quot;fOptions2&quot;:&quot;用户手册&quot;,&quot;fOptions3&quot;:&quot;系统更新日志等&quot;},{&quot;fID&quot;:&quot;006&quot;,&quot;fTitle&quot;:&quot;个人存储空间&quot;,&quot;fImg&quot;:&quot;6.png&quot;,&quot;fOptions1&quot;:&quot;每个用户在系统中有100M的存储空间。在这里可进行管理&quot;},{&quot;fID&quot;:&quot;007&quot;,&quot;fTitle&quot;:&quot;附件管理&quot;,&quot;fImg&quot;:&quot;7.png&quot;,&quot;fOptions1&quot;:&quot;保存了自己上传的附件 可进行下载、删除等操作&quot;},{&quot;fID&quot;:&quot;008&quot;,&quot;fTitle&quot;:&quot;通知消息&quot;,&quot;fImg&quot;:&quot;8.png&quot;,&quot;fOptions1&quot;:&quot;系统发送的消息&quot;,&quot;fOptions2&quot;:&quot;其他用户发送的消息&quot;,&quot;fOptions3&quot;:&quot;&quot;},{&quot;fID&quot;:&quot;009&quot;,&quot;fTitle&quot;:&quot;回收站&quot;,&quot;fImg&quot;:&quot;9.png&quot;,&quot;fOptions1&quot;:&quot;保存了曾经删除的数据和文档资料等&quot;}]</data></div></div> 

  <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar" title="功能图标展示" style="color:#FFFFFF;">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">功能图标展示</div>
   <div class="x-titlebar-right reverse" xid="right1"></div><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="jsBtn" onClick="showjsSource">
   <i xid="i2"></i>
   <span xid="span3">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="showPageSource">
   <i xid="i3"></i>
   <span xid="span4">源码</span></a></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list" data="sudokuData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="pull-left" style="width:30%;height:180px;"><div style="background-color:#F7F7F7;height:160px;white-space:nowrap;overflow:hidden;" class="div" bind-click="gridClick" xid="grid"><img src="" alt="" xid="image2" style="height:130px;width:72px;" bind-attr-src=' $model.getUrl( $object.val("fImg"))' class="pull-left image"></img>
  <div xid="div2" style="width:125px;height:180px;white-space:normal;" class="pull-right div2"><label xid="label2" bind-text="ref('fTitle')">label</label>
  <div xid="div3" style="height:auto;width:120px;" bind-text=' $object.val("fOptions1")'></div>
  <div xid="div4" style="height:auto;width:120px;" bind-text=' $object.val("fOptions2")'></div>
  <div xid="div5" style="width:120px;height:auto;"></div></div></div></li></ul> </div>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog"></span>
  
  </div>