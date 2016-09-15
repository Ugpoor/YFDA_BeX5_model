<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:48px;top:421px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="masterDetailReportAction1" type="action" columns="RORDERID,RSHIPNAME,RCONTACTNAME,RNAME,RORDERDATE,RREQUIREDDATE,RSHIPPEDDATE,RSHIPCOUNTRY,RSHIPCITY,RSHIPPOSTALCODE"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="e1"> 
      <source xid="default2"> 
        <action name="masterDetailReportAction2" type="action" columns="RORDERID,RUNITPRICE,RQUANTITY,RDISCOUNT,RPRODUCTNAME"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[主从表一]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[主从表二]]></a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[主从表三]]></a> 
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4"><![CDATA[主从表四]]></a> 
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
   <span xid="span6"></span></a></div><div component="$UI/system/components/justep/report/report" src="reports/masterDetailReport1.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report1"/>
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
   <span xid="span12"></span></a></div><div component="$UI/system/components/justep/report/report" src="reports/masterDetail2.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report2"/>
      </div>  
      <div class="tab-pane" xid="tabContent3">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar3"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.pageSetup'}" xid="button13">
   <i xid="i13"></i>
   <span xid="span13"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.preview'}" xid="button14">
   <i xid="i14"></i>
   <span xid="span14"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.print'}" xid="button15">
   <i xid="i15"></i>
   <span xid="span15"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.exportPDF'}" xid="button16">
   <i xid="i16"></i>
   <span xid="span16"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.exportWord'}" xid="button17">
   <i xid="i17"></i>
   <span xid="span17"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report3.exportExcel'}" xid="button18">
   <i xid="i18"></i>
   <span xid="span18"></span></a></div><div component="$UI/system/components/justep/report/report" src="reports/masterDetail3.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report3"/>
      </div>  
      <div class="tab-pane" xid="tabContent4">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar4"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.pageSetup'}" xid="button19">
   <i xid="i19"></i>
   <span xid="span19"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.preview'}" xid="button20">
   <i xid="i20"></i>
   <span xid="span20"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.print'}" xid="button21">
   <i xid="i21"></i>
   <span xid="span21"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.exportPDF'}" xid="button22">
   <i xid="i22"></i>
   <span xid="span22"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.exportWord'}" xid="button23">
   <i xid="i23"></i>
   <span xid="span23"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report4.exportExcel'}" xid="button24">
   <i xid="i24"></i>
   <span xid="span24"></span></a></div><div component="$UI/system/components/justep/report/report" src="reports/masterDetail4.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report4"/>
      </div> 
    </div> 
  </div> 
</div>
