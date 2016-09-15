<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:223px;top:568px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="formattingData" idColumn="date" onCustomRefresh="formattingDataCustomRefresh"><column label="日期格式化" name="date" type="String" xid="xid1"></column>
  <column label="金额格式化" name="money" type="String" xid="xid2"></column>
  <column label="小数" name="decimals" type="String" xid="xid3"></column>
  <column label="长数字处理" name="longNumber" type="String" xid="xid4"></column></div></div> 
<h4 xid="h41" class="center-block"><![CDATA[内容格式化]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="formattingGrid" data="formattingData" width="100%">
   <columns xid="columns1"><column name="date" xid="column1" formatter="date"><formatoptions xid="default1" newformat="Y年m月d日 H时i分s秒"></formatoptions></column>
  <column name="money" xid="column2" formatter="currency"><formatoptions xid="default2" prefix="￥"></formatoptions></column>
  <column name="longNumber" xid="column4" formatter="number"></column></columns></div></div>