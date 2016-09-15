<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:385px;top:703px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="bankData" idColumn="id" onCustomRefresh="bankDataCustomRefresh"><column label="ID" name="id" type="String" xid="xid1"></column>
  <column label="银行" name="bank" type="String" xid="xid2"></column>
  <column label="信用卡" name="creditCard" type="String" xid="xid3"></column>
  <column label="账单日" name="billingDate" type="String" xid="xid4"></column>
  <column label="还款日" name="repaymentDate" type="String" xid="xid5"></column>
  <column label="取现额度" name="cash" type="String" xid="xid6"></column></div></div> 
<h3 xid="h31"><![CDATA[表格跨列附加行]]>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="js" xid="js" onClick="jsClick">
   <i xid="i1"></i>
   <span xid="span1">js</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="源码" xid="source" onClick="sourceClick">
   <i xid="i2"></i>
   <span xid="span2">源码</span></a></h3><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="bankGrid" data="bankData" width="100%" onReload="bankGridReload" onCellRender="bankGridCellRender" height="auto">
   <columns xid="columns1"><column name="id" xid="column1" hidden="true"></column>
  <column name="bank" xid="column2"></column>
  <column name="creditCard" xid="column3"></column>
  <column name="billingDate" xid="column4"></column>
  <column name="repaymentDate" xid="column5"></column>
  <column name="cash" xid="column6"></column></columns></div>
  </div>