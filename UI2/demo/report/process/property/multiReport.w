<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="crossReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RREGION,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default2"> 
        <action name="groupReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.pageSetup'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.preview'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.print'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span3"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportPDF'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span4"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportWord'}" xid="button5"> 
      <i xid="i5"/>  
      <span xid="span5"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportExcel'}" xid="button6"> 
      <i xid="i6"/>  
      <span xid="span6"/> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/report/report" src="reports/multiReport.xml" reportName="report"
    autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report"/>
</div>
