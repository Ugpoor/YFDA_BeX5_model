<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:391px;top:576px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="productData" idColumn="id" onCustomRefresh="productDataCustomRefresh"><column label="产品名称" name="productName" type="String" xid="xid1"></column>
  <column label="认购期" name="subscriptionPeriod" type="String" xid="xid2"></column>
  <column label="起购金额" name="money" type="String" xid="xid3"></column>
  <column label="理财期限" name="deadline" type="String" xid="xid4"></column>
  <column label="年收益" name="income" type="String" xid="xid5"></column>
  <column label="可购买账户" name="account" type="String" xid="xid6"></column>
  <column label="ID" name="id" type="String" xid="xid7"></column>
  <column label="操作" name="operate" type="String" xid="xid8"></column></div></div> 
<h4 xid="h41"><![CDATA[自定义样式]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="JS" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">JS</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h4><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="productGrid" data="productData" multiselect="true" showRowNumber="true" width="100%" onCellRender="productGridCellRender" height="500">
   <columns xid="columns1"><column name="productName" xid="column1"></column>
  <column name="subscriptionPeriod" xid="column2"></column>
  <column name="money" xid="column3" formatter="currency"><formatoptions xid="default1" suffix="万元" defaultValue="0" decimalPlaces="0"></formatoptions></column>
  <column name="deadline" xid="column4" formatter="currency"><formatoptions xid="default2" suffix="天" defaultValue="0" decimalPlaces="0"></formatoptions></column>
  <column name="income" xid="column5" formatter="currency"><formatoptions xid="default3" suffix="%" defaultValue="0" decimalPlaces="0"></formatoptions></column>
  <column name="id" xid="column7" hidden="true"></column>
  <column name="account" multiRowEditor="false" disableEditorDisplay="false" editable="false" editor="component" xid="column8">
   <editor xid="editor1">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit-focusin" bind-ref="ref('account')" xid="textarea1"></textarea></editor> </column>
  <column name="operate" xid="column9"></column></columns></div>
  </div>