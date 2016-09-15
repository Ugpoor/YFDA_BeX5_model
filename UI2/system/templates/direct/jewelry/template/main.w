<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:404px;top:542px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="jewelry" idColumn="id" onCustomRefresh="jewelryCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="图片" name="image" type="String" xid="xid2"></column></div></div> 
<div xid="div1"><img src="" alt="" xid="image1" class="img-responsive" bind-attr-src="$model.toURL('./main/img/1.jpg')"></img></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="jewelry" filter="$row.val('id') == 1">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" class="col-xs-6"><img src="" alt="" xid="image2" bind-attr-src='$model.toURL( "./main/img/"+$object.val("image"))' class="img-responsive" bind-click="image2Click"></img>
  </li></ul> </div><div xid="div2" align="center"><span xid="span1" style="font-size:medium;"><![CDATA[新上架]]></span></div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="jewelry" filter="$row.val('id') == 2">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2" class="col-xs-6">
     <img src="" alt="" xid="image3" bind-attr-src='$model.toURL( "./main/img/"+$object.val("image"))' class="img-responsive" bind-click="image3Click"></img></li> </ul> 
  </div><div xid="div3" align="center" class="sTitle">
   <span xid="span8" style="font-size:medium;"><![CDATA[查看更多]]></span></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col1"></div>
   <div class="x-col" xid="col2"><a component="$UI/system/components/justep/button/button" class="btn x-red btn-block" label="按钮文字" xid="button6">
   <i xid="i6"></i>
   <span xid="span9">按钮文字</span></a></div>
   <div class="x-col" xid="col3"></div></div>
  
  
  
  
  
 </div>