<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:459px;top:396px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="jewelry" idColumn="id" onCustomRefresh="jewelryCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="名称" name="name" type="String" xid="xid2"></column>
  <column label="价格" name="price" type="String" xid="xid3"></column>
  <column label="点赞数" name="Praise" type="String" xid="xid4"></column>
  <column label="图片" name="image" type="String" xid="xid5"></column></div></div> 
<div component="$UI/system/components/justep/list/list" class="x-list x-cards" xid="list1" data="jewelry">
   <ul class="list-group x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="list-group-item" bind-click="li1Click"><div xid="div1" class="media"><div xid="div2" class="media-left"><img src="" alt="" xid="image1" class="media-object" bind-attr-src='$model.transURL("./main/img/"+ $object.val("image"))' height="90" style="width:80;"></img></div>
  <div xid="div3" class="media-body"><h5 xid="h51" bind-text="ref('name')">h5</h5>
  <div xid="div4"><span xid="span1" bind-text="ref('price')" style="color:#FF00FF;"></span>
  
  <span xid="span3" class="pull-right"><i xid="i1" class="icon-heart " style="color:#FF00FF;"></i><span xid="span2" bind-text="ref('Praise')"></span></span></div></div></div></li></ul> </div></div>