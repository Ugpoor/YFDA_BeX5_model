<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:373px;top:515px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="furniture" idColumn="id" onCustomRefresh="furnitureCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="图片" name="image" type="String" xid="xid2"></column>
  <column label="标题" name="title" type="String" xid="xid3"></column>
  <column label="内容" name="content" type="String" xid="xid4"></column>
  <column label="时间" name="time" type="String" xid="xid5"></column></div></div> 
<div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"><img src="" alt="" xid="image1" class="img-responsive" bind-attr-src="$model.toURL('./main/img/s1.png')"></img></div>
   <div class="x-col" xid="col2"><img src="" alt="" xid="image2" class="img-responsive" bind-attr-src="$model.toURL('./main/img/s1.png')"></img></div>
   <div class="x-col" xid="col3"><img src="" alt="" xid="image3" class="img-responsive" bind-attr-src="$model.toURL('./main/img/s1.png')"></img></div></div>
  <div xid="div1" class="sTitle"><h4 xid="h41" style="color:#000000;"><![CDATA[产品推荐]]></h4></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="furniture">
   <ul class="list-group x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="list-group-item"><div xid="div2" class="media"><div xid="div3" class="media-left"><img src="" alt="" xid="image4" style="height:89px;width:123px;" bind-attr-src='$model.toURL( "./main/img/"+$object.val("image"))' class="img-rounded"></img></div>
  <div xid="div4" class="media-body"><h4 xid="h43" bind-text="ref('title')">h4</h4><div xid="div5"><span xid="span1" bind-text="ref('content')" style="font-size:x-small;"></span></div>
  <div xid="div6"><span xid="span2" bind-text="ref('time')" style="font-size:x-small;"></span></div>
  </div></div></li></ul> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="col4"></div>
   <div class="x-col" xid="col5"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="联系电话" xid="contactUS" icon="glyphicon glyphicon-earphone">
   <i xid="i1" class="glyphicon glyphicon-earphone"></i>
   <span xid="span3">联系电话</span></a></div>
   <div class="x-col" xid="col6"></div></div></div>