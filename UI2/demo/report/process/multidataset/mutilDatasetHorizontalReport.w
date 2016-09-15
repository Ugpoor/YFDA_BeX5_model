<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.pageSetup'}" xid="button7">
   <i xid="i7"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.preview'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.print'}" xid="button9">
   <i xid="i9"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.exportPDF'}" xid="button10">
   <i xid="i10"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.exportWord'}" xid="button11">
   <i xid="i11"></i>
   <span xid="span11"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'d_horizontalSlicing.exportExcel'}" xid="button12">
   <i xid="i12"></i>
   <span xid="span12"></span></a></div><div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:249px;top:109px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="s2" idColumn="RPRODUCTID"><column label="RPRODUCTID" name="RPRODUCTID" type="String" xid="default2"></column>
  <column label="RCOMPANYNAME" name="RCOMPANYNAME" type="String" xid="default3"></column>
  <column label="RREGION" name="RREGION" type="String" xid="default4"></column>
  <column label="RUNITPRICE" name="RUNITPRICE" type="String" xid="default5"></column>
  <column label="RUNITSINSTOCK" name="RUNITSINSTOCK" type="String" xid="default6"></column>
  <data xid="default7">[{&quot;RPRODUCTID&quot;:&quot;P0000001&quot;,&quot;RCOMPANYNAME&quot;:&quot;安徽黄山市建材厂&quot;,&quot;RREGION&quot;:&quot;安徽&quot;,&quot;RUNITPRICE&quot;:&quot;100&quot;,&quot;RUNITSINSTOCK&quot;:&quot;15&quot;},{&quot;RPRODUCTID&quot;:&quot;P0000001&quot;,&quot;RCOMPANYNAME&quot;:&quot;乌鲁木齐建材公司&quot;,&quot;RREGION&quot;:&quot;新疆&quot;,&quot;RUNITPRICE&quot;:&quot;100&quot;,&quot;RUNITSINSTOCK&quot;:&quot;24&quot;}]</data></div>
  <div component="$UI/system/components/justep/reportData/reportData" xid="s1">
      <source> 
        <action name="mutilDatasetHorizontalReportAction" type="action" columns="RPRODUCTID,RSUPPLIERID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RREGION,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
   </div></div> 

  <div xid="div1"><div component="$UI/system/components/justep/report/report" src="reports/multiDatasetHorizontalReport.xml" reportName="多源横向分片报表" autoLoad="true" dataList="s1,s2" class="x-report x-scroll-h" xid="d_horizontalSlicing"></div></div></div>