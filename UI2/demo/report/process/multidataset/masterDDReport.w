<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:238px;top:453px;"> 
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
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[主从从报表一]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[主从从报表二]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
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
   <span xid="span6"></span></a></div><div component="$UI/system/components/justep/report/report" reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
           xid="report1" src="reports/masterDDReport1.xml"/>
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
                <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.pageSetup'}" xid="button7">
   <i xid="i7"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.preview'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.print'}" xid="button9">
   <i xid="i9"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.exportPDF'}" xid="button10">
   <i xid="i10"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.exportWord'}" xid="button11">
   <i xid="i11"></i>
   <span xid="span11"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report2.exportExcel'}" xid="button12">
   <i xid="i12"></i>
   <span xid="span12"></span></a></div><div component="$UI/system/components/justep/report/report" src="reports/masterDDReport2.xml"  
                  reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"  
                  xid="report2"/> 
      </div> 
    </div> 
  </div> 
</div>
