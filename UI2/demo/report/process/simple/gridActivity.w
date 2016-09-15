<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:28px;top:273px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="gridReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="grid" xid="tabItem1"><![CDATA[网格]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="fullGrid" xid="tabItem2"><![CDATA[完整报表]]></a> 
      </li>  
      <li xid="li3"> 
        <a content="scrossxGrid" xid="tabItem3"><![CDATA[横向扩展网格报表]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="grid"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report1.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/grid.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report1"/> 
      </div>  
      <div class="tab-pane" xid="fullGrid"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.pageSetup'}" xid="button7"> 
            <i xid="i7"/>  
            <span xid="span7"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.preview'}" xid="button8"> 
            <i xid="i8"/>  
            <span xid="span8"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.print'}" xid="button9"> 
            <i xid="i9"/>  
            <span xid="span9"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.exportPDF'}" xid="button10"> 
            <i xid="i10"/>  
            <span xid="span10"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.exportWord'}" xid="button11"> 
            <i xid="i11"/>  
            <span xid="span11"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report2.exportExcel'}" xid="button12"> 
            <i xid="i12"/>  
            <span xid="span12"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/fullGrid.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report2"/> 
      </div>  
      <div class="tab-pane" xid="scrossxGrid"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar3">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.pageSetup'}" xid="button13"> 
            <i xid="i13"/>  
            <span xid="span13"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.preview'}" xid="button14"> 
            <i xid="i14"/>  
            <span xid="span14"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.print'}" xid="button15"> 
            <i xid="i15"/>  
            <span xid="span15"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.exportPDF'}" xid="button16"> 
            <i xid="i16"/>  
            <span xid="span16"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.exportWord'}" xid="button17"> 
            <i xid="i17"/>  
            <span xid="span17"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report3.exportExcel'}" xid="button18"> 
            <i xid="i18"/>  
            <span xid="span18"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/scrossGrid.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report3"/> 
      </div> 
    </div> 
  </div> 
</div>
