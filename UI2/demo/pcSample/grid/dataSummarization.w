<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:426px;top:571px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="gradeData" idColumn="name" onCustomRefresh="gradeDataCustomRefresh"><column label="姓名" name="name" type="String" xid="xid1"></column>
  <column label="语文" name="chinese" type="Integer" xid="xid2"></column>
  <column label="数学" name="math" type="Integer" xid="xid3"></column>
  <column label="英语" name="english" type="Integer" xid="xid4"></column>
  <rule xid="rule2">
   <col name="chinese" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default2"></expr></calculate> </col> </rule></div>
  </div> 
<h4 xid="h41"><![CDATA[数据汇总 
  ]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="gradeGrid" data="gradeData" showRowNumber="true" width="100%" useFooter="true" height="auto">
   <columns xid="columns1"><column name="name" xid="column1"></column>
  <column name="chinese" xid="column2" footerData='"总分："+$model.gradeData.sum("chinese")'></column>
  <column name="math" xid="column3" footerData='"平均分："+ $model.gradeData.avg("math")'></column>
  <column name="english" xid="column4" footerData='"最大分："+ $model.gradeData.max("english")'></column></columns></div>
  </div>