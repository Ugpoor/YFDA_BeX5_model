<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" class="main13" component="$UI/system/components/justep/window/window"
  design="device:mobile;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:284px;top:471px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="goodsData" idColumn="id" limit="20" confirmRefresh="false" confirmDelete="false"
      onCustomRefresh="goodsDataCustomRefresh"> 
      <column label="id" name="id" type="String" xid="column1"></column>
  <column label="店铺ID" name="fShopID" type="String" xid="xid1"></column>
  <column label="标题" name="fTitle" type="String" xid="column2"></column>
  <column label="图片" name="fImg" type="String" xid="column3"></column>
  <column label="价格" name="fPrice" type="Float" xid="column4"></column>
  <column label="原价格" name="fOldPrice" type="Float" xid="column5"></column>
  <column label="选择" name="fChoose" type="Integer" xid="xid4"></column>
  <column label="数量" name="fNumber" type="Integer" xid="xid5"></column>
  <column label="总价" name="fSum" type="Float" xid="xid6"></column>
  <rule xid="rule1">
   <col name="fColor" xid="ruleCol1">
    <constraint xid="constraint1">
     <expr xid="default1"></expr></constraint> 
    <calculate xid="calculate1">
     <expr xid="default2"></expr></calculate> 
    <readonly xid="readonly1">
     <expr xid="default6"></expr></readonly> </col> 
   <col name="fSize" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default3"></expr></calculate> </col> 
   <col name="fSum" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default4">$row.val('fChoose')==1?$row.val('fPrice')*$row.val('fNumber'):'0'</expr></calculate> </col> 
   <col name="fNumber" xid="ruleCol4">
    <calculate xid="calculate4">
     <expr xid="default5"></expr></calculate> </col> </rule></div>  
    </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1">
   <div class="x-titlebar-left" xid="left1"></div>
   <div class="x-titlebar-title" xid="title1">
    <span xid="span1">我的书库</span></div> 
   <div class="x-titlebar-right reverse" xid="right1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="菜单" xid="menuBtn" icon="icon-compose">
     <i xid="i1" class="icon-compose"></i>
     <span xid="span2">菜单</span></a> 
    <i xid="i2"></i></div> </div></div>
   <div class="x-panel-content" xid="content1"><div xid="div1" style="padding:8px 10px;background-color:#E8E8E8;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="allChoose" onChange="allChooseChange" label="哈哈哈哈衣服店" mark="haha"></span>
  <span xid="span3" class="pull-right" style="color:#008040;"><![CDATA[免邮]]></span>
  </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="goodsData" filter="$row.val('fShopID')=='f00102135'">
   <ul class="x-list-template list-group" xid="listTemplateUl2">
    <li xid="li2" class="list-group-item">
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col x-col-10  x-col-center" xid="col4"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox2" checkedValue="1" bind-ref="ref('fChoose')" onChange="singleChange" mark="haha"></span></div>
   <div class="x-col" xid="col5"><div xid="div2" class="media"><div xid="div3" class="media-left"><img src="" alt="" xid="image1" bind-attr-src='$model.toUrl( $object.val("fImg"))' style="height:109px;width:80px;" class="img-rounded"></img></div>
  <div xid="div4" class="media-body"><p xid="p1" bind-text=' $object.val("fTitle")'></p><span xid="span11" style="font-size:medium;color:#FF0080;"><![CDATA[￥]]></span><span xid="span5" bind-text="ref('fPrice')" style="font-size:medium;color:#FF0080;"></span><span xid="span12" style="text-decoration:line-through ;"><![CDATA[￥]]></span>
  
  <span xid="span6" bind-text="ref('fOldPrice')" style="text-decoration:line-through ;"></span><div class="tb-numberOperation" xid="div5">
   <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left" label="减" xid="reduceBtn1" icon="icon-android-remove" onClick="caculCount" mark="reduce">
    <i xid="i3" class="icon-android-remove"></i>
    <span xid="span13">减</span></a> 
   <span bind-text="ref('fNumber')" class="pull-left" xid="span10"></span>
   <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left" label="加" xid="addBtn1" icon="icon-android-add" onClick="caculCount" mark="add">
    <i xid="i3" class="icon-android-add"></i>
    <span xid="span29">加</span></a> </div>
  </div></div></div>
   </div></li></ul> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="row4">
   <div class="x-col" xid="col11"></div>
   <div class="x-col" xid="col12"><span xid="span14" style="font-size:medium;"><![CDATA[商品合计：]]>
  </span><span xid="span15" bind-text='$model.caculSum("haha")' style="color:#FF0080;"></span></div></div>
  <div xid="div8" style="padding:8px 10px;background-color:#E8E8E8;">
   <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="allCheck" onChange="allChooseChange" label="嘻嘻嘻嘻衣服店" mark="xixi"></span>
   <span xid="span17" class="pull-right" style="color:#008040;">免邮</span></div>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="goodsData" filter="$row.val('fShopID')=='f00105411'">
   <ul class="x-list-template list-group" xid="listTemplateUl3">
    <li xid="li3" class="list-group-item">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row5">
      <div class="x-col x-col-10  x-col-center" xid="col14">
       <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox4" checkedValue="1" bind-ref="ref('fChoose')" onChange="singleChange" mark="xixi"></span></div> 
      <div class="x-col" xid="col13">
       <div xid="div12" class="media">
        <div xid="div11" class="media-left">
         <img src="" alt="" xid="image2" bind-attr-src='$model.toUrl( $object.val("fImg"))' style="height:109px;width:80px;" class="img-rounded"></img></div> 
        <div xid="div10" class="media-body">
         <p xid="p2" bind-text=' $object.val("fTitle")'></p>
         <span xid="span19" style="font-size:medium;color:#FF0080;">￥</span>
         <span xid="span24" bind-text="ref('fPrice')" style="font-size:medium;color:#FF0080;"></span>
         <span xid="span18" style="text-decoration:line-through ;">￥</span>
         <span xid="span23" bind-text="ref('fOldPrice')" style="text-decoration:line-through ;"></span>
         <div class="tb-numberOperation" xid="div9">
          <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left" label="减" xid="reduceBtn2" icon="icon-android-remove" onClick="caculCount" mark="reduce">
           <i xid="i4" class="icon-android-remove"></i>
           <span xid="span22">减</span></a> 
          <span bind-text="ref('fNumber')" class="pull-left" xid="span20"></span>
          <a component="$UI/system/components/justep/button/button" class="btn x-gray btn-sm btn-only-icon pull-left" label="加" xid="addBtn2" icon="icon-android-add" onClick="caculCount" mark="add">
           <i xid="i4" class="icon-android-add"></i>
           <span xid="span21">加</span></a> </div> </div> </div> </div> </div> </li> </ul> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row6">
   <div class="x-col" xid="col16"></div>
   <div class="x-col" xid="col15">
    <span xid="span26" style="font-size:medium;">商品合计：</span>
    <span xid="span25" bind-text=' $model.caculSum("xixi")' style="color:#FF0080;"></span></div> </div></div>
   <div class="x-panel-bottom" xid="bottom2"><div component="$UI/system/components/justep/row/row" class="x-row text-center" xid="row1">
   <div class="x-col" xid="col1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书架" xid="bookshelvesBtn" icon="icon-android-book">
     <i xid="i5" class="icon-android-book"></i>
     <span xid="span7">书架</span></a> </div> 
   <div class="x-col" xid="col2">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="书城" xid="bookCityBtn" icon="icon-stats-bars">
     <i xid="i6" class="icon-stats-bars"></i>
     <span xid="span8">书城</span></a> </div> 
   <div class="x-col" xid="col3">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-xs btn-icon-top" label="个人中心" xid="personalCenterBtn" icon="icon-android-contact">
     <i xid="i7" class="icon-android-contact"></i>
     <span xid="span9">个人中心</span></a> </div> </div></div></div></div>
