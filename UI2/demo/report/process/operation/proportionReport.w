<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="gridReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="s6"> 
      <source xid="default2"> 
        <action id="default2" name="gridReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[占比报表一]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[占比报表二]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="aToolBar">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'a_proportion.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/>
          </a>
        </div>  
        <div component="$UI/system/components/justep/report/report" src="reports/proportionReport1.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="a_proportion"/> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="bToolBar">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.pageSetup'}" xid="button7"> 
            <i xid="i7"/>  
            <span xid="span7"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.preview'}" xid="button8"> 
            <i xid="i8"/>  
            <span xid="span8"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.print'}" xid="button9"> 
            <i xid="i9"/>  
            <span xid="span9"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.exportPDF'}" xid="button10"> 
            <i xid="i10"/>  
            <span xid="span10"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.exportWord'}" xid="button11"> 
            <i xid="i11"/>  
            <span xid="span11"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'b_proportion.exportExcel'}" xid="button12"> 
            <i xid="i12"/>  
            <span xid="span12"/>
          </a>
        </div>  
        <div component="$UI/system/components/justep/report/report" src="reports/proportionReport2.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="b_proportion"/> 
      </div> 
    </div> 
  </div> 
</div>
