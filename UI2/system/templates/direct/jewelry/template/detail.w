<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:380px;top:527px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="comment" idColumn="id" onCustomRefresh="commentCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="名称" name="name" type="String" xid="xid2"></column>
  <column label="头像" name="image" type="String" xid="xid3"></column>
  <column label="时间" name="time" type="String" xid="xid4"></column>
  <column label="内容" name="content" type="String" xid="xid5"></column>
  <column label="颜色" name="color" type="String" xid="xid6"></column></div></div> 
<div xid="div1" align="center" class="title"><h4 xid="h41" style="color:#000000;"><![CDATA[皮质耳环]]></h4></div>
  <img src="" alt="" xid="image1" class="img-responsive" bind-attr-src="$model.toURL('./main/img/big.png')"></img>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col x-col-10" xid="col1"></div>
   <div class="x-col" xid="col3"><a component="$UI/system/components/justep/button/button" class="btn x-red btn-block" label="按钮文字" xid="button1">
   <i xid="i1"></i>
   <span xid="span1">按钮文字</span></a></div>
  <div class="x-col" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn x-red btn-block" label="按钮文字" xid="button2">
   <i xid="i2"></i>
   <span xid="span2">按钮文字</span></a></div>
  <div class="x-col x-col-10" xid="col5"></div></div>
  <h5 xid="h52" style="color:#000000;text-indent:2em;"><![CDATA[评价详情（30）]]></h5>
  <div component="$UI/system/components/justep/list/list" class="x-list " xid="list1" data="comment">
   <ul class="list-group x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="list-group-item"><div xid="div2" class="media"><div xid="div3" class="media-left"><img src="" alt="" xid="image2" class="img-circled media-object" bind-attr-src='$model.toURL( "./main/img/"+$object.val("image"))' style="width:40;" height="40"></img></div>
  <div xid="div4" class="media-body"><h5 xid="h53" bind-text=' $object.val("name") + $object.val("content")' style="font-size:x-small;color:#000000;"><![CDATA[]]></h5><div xid="div5"><span xid="span4" bind-text="ref('time')" style="font-size:xx-small;"></span>
  <span xid="span5" style="font-size:xx-small;"><![CDATA[颜色分类：]]></span>
  <span xid="span6" bind-text="ref('color')" style="font-size:xx-small;"></span></div></div></div></li></ul> 
  </div></div>