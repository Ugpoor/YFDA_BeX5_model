<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" 
	component="$UI/system/components/justep/window/window"
  	design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="textData" idColumn="fID" onCustomRefresh="textDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="姓名" name="fName" type="String" xid="xid2"></column>
  <column label="性别" name="fSex" type="String" xid="xid3"></column>
  <column label="地址" name="fAddress" type="String" xid="xid4"></column>
  <column label="备注" name="fRemark" type="String" xid="xid5"></column></div></div>  
  <label xid="label1"><![CDATA[图表与表格结合]]></label><a component="$UI/system/components/justep/button/button" class="btn btn-link btn1" label="js" xid="jsBtn" onClick="jsBtnClick">
   <i xid="i6"></i>
   <span xid="span11">js</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn1" label="源码" xid="sourceBtn" bind-visible="isVisible" onClick="sourceBtnClick">
   <i xid="i7"></i>
   <span xid="span17">源码</span></a><div xid="main" style="width:100%;height:300px;white-space:nowrap;overflow:hidden;"></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="textData" ordering="false" showRowNumber="true" style="width:100%;">
   <columns xid="columns1"><column name="fID" xid="column1"></column>
  <column name="fName" xid="column2"></column>
  <column name="fSex" xid="column3"></column>
  <column name="fAddress" xid="column4"></column>
  <column name="fRemark" xid="column5"></column></columns></div> 

  </div>
