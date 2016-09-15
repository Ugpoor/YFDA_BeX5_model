<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="o1"> 
      <source xid="default1"> 
        <action name="masterDDReportAction1" type="action" columns="RORDERID,RCONTACTNAME,RSHIPNAME,RSHIPADDRESS,RSHIPCOUNTRY,RSHIPCITY,RSHIPPOSTALCODE,RORDERDATE,RREQUIREDDATE,RSHIPPEDDATE"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="d1"> 
      <source xid="default2"> 
        <action name="masterDDReportAction2" type="action" columns="RORDERDETAILSID,RUNITPRICE,RQUANTITY,RDISCOUNT"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default3"> 
        <action name="masterDDReportAction3" type="action" columns="RPRODUCTID,RCATEGORYNAME,RQUANTITYPERUNIT,RCOMPANYNAME"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="e1"> 
      <source xid="default4"> 
        <action name="masterDDReportAction4" type="action" columns="RNAME,RTITLE,RBIRTHDATE,RADDRESS"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.pageSetup'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.preview'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.print'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.exportPDF'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.exportWord'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report1.exportExcel'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span6"></span></a></div><div> 
    <div component="$UI/system/components/justep/report/report" src="reports/masterDDDReport.xml" reportName="report"
      autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report1"/> 
  </div> 
</div>
