<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:407px;top:522px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="jewelry" idColumn="id" onCustomRefresh="jewelryCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="图片" name="image" type="String" xid="xid2"></column>
  <column label="点赞数" name="Praise" type="String" xid="xid3"></column>
  <column label="名称" name="name" type="String" xid="xid4"></column>
  <column label="价钱" name="price" type="String" xid="xid5"></column></div></div> 
<div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="jewelry">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="col-xs-6" bind-click="li1Click"><div xid="div1"><img src="" alt="" xid="image1" class="img-responsive" bind-attr-src='$model.transURL("./main/img/"+ $object.val("image"))'></img>
  <div xid="div4" class="redHeart">
   <i xid="i1" class="icon-heart" style="color:#FF00FF;"></i>
   <span xid="span3" bind-text="ref('Praise')"></span></div></div><div xid="div2"><h5 xid="h51" bind-text="ref('name')">h5</h5></div><div xid="div3" align="center" style="color:#FF0080;"><span xid="span1" bind-text="ref('price')"></span></div></li></ul> </div>
  
  </div>