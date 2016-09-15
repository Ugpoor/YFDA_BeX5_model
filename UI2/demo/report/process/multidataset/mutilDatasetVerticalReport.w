<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.pageSetup'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.preview'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.print'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.exportPDF'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.exportWord'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'verticalslice.exportExcel'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span6"></span></a></div><div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1">
        <action name="mutilDatasetVerticalReportAction" type="action" columns="RPRODUCTID,RSUPPLIERID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RREGION,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="s2" idColumn="RSUPPLIERID"> 
      <column label="RSUPPLIERID" name="RSUPPLIERID" type="String" xid="default2"/>  
      <column label="RCATEGORYNAME" name="RCATEGORYNAME" type="String" xid="default3"/>  
      <column label="RPRODUCTNAME" name="RPRODUCTNAME" type="String" xid="default4"/>  
      <column label="RCOMPANYNAME" name="RCOMPANYNAME" type="String" xid="default5"/>  
      <column label="RREGION" name="RREGION" type="String" xid="default6"/>  
      <column label="RUNITPRICE" name="RUNITPRICE" type="String" xid="default7"/>  
      <column label="RUNITSINSTOCK" name="RUNITSINSTOCK" type="String" xid="default8"/>  
      <data xid="default9">[{"RSUPPLIERID":"SUP0000001","RCATEGORYNAME":"新产品","RPRODUCTNAME":"地板砖","RCOMPANYNAME":"广州市番禺建材厂","RREGION":"广东","RUNITPRICE":"100","RUNITSINSTOCK":"15"},{"RSUPPLIERID":"SUP0000001","RCATEGORYNAME":"新产品","RPRODUCTNAME":"水泥","RCOMPANYNAME":"广州市番禺建材厂","RREGION":"广东","RUNITPRICE":"100","RUNITSINSTOCK":"24"}]</data> 
    </div> 
  </div>  
   
<div component="$UI/system/components/justep/report/report" src="reports/multiDatasetVerticalReport.xml" reportName="多源纵向分片报表" autoLoad="true" dataList="" class="x-report x-scroll-h" xid="verticalslice"></div>
  </div>
