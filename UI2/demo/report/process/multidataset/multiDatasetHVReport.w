<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:130px;"> 
    <div xid="s1" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="multiDatasetHVReportAction1" type="action" columns="RREGION,RCITY,RUNITPRICE,RQUANTITY,RDISCOUNT,RPRODUCTID,REMPLOYEEID,RORDERDATE,RORDERDATE_YEAR,RORDERDATE_MOUNTH"/> 
      </source> 
    </div>  
    <div xid="s2" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="multiDatasetHVReportAction2" type="action" columns="REMPLOYEEID,RPRODUCTID,RTITLE,RFIRSTNAME,RLASTNAME,RFULLNAME"/> 
      </source> 
    </div>  
    <div xid="s3" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="multiDatasetHVReportAction3" type="action" columns="RCATEGORYID,RCATEGORYNAME,RPRODUCTID"/> 
      </source> 
    </div> 
  </div>  
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.pageSetup'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.preview'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.print'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.exportPDF'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.exportWord'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'multiHV.exportExcel'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span6"></span></a></div><div class="x-report x-scroll-h" component="$UI/system/components/justep/report/report"
        xid="multiHV" src="reports/multiDatasetHVReport.xml" report-name="多源双向分片报表"
        autoLoad="true" data-list=""/> 
</div>
