<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action id="default6" name="groupReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[一级分组]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[二级分组]]></a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[分组行统计]]></a> 
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4"><![CDATA[分组行列统计]]></a> 
      </li>  
      <li xid="li5"> 
        <a content="tabContent5" xid="tabItem5"><![CDATA[条件分组]]></a> 
      </li>  
      <li xid="li6"> 
        <a content="tabContent6" xid="tabItem6"><![CDATA[分组多层统计]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
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
        <div component="$UI/system/components/justep/report/report" src="report/1group.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report1"/> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
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
        <div component="$UI/system/components/justep/report/report" src="report/2group.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report2"/> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
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
        <div component="$UI/system/components/justep/report/report" src="report/group-sum-row.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report3"/> 
      </div>  
      <div class="tab-pane" xid="tabContent4"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar4">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.pageSetup'}" xid="button19"> 
            <i xid="i19"/>  
            <span xid="span19"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.preview'}" xid="button20"> 
            <i xid="i20"/>  
            <span xid="span20"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.print'}" xid="button21"> 
            <i xid="i21"/>  
            <span xid="span21"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.exportPDF'}" xid="button22"> 
            <i xid="i22"/>  
            <span xid="span22"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.exportWord'}" xid="button23"> 
            <i xid="i23"/>  
            <span xid="span23"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report4.exportExcel'}" xid="button24"> 
            <i xid="i24"/>  
            <span xid="span24"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/group-sum-row-column.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report4"/> 
      </div>  
      <div class="tab-pane" xid="tabContent5"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar5">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.pageSetup'}" xid="button25"> 
            <i xid="i25"/>  
            <span xid="span25"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.preview'}" xid="button26"> 
            <i xid="i26"/>  
            <span xid="span26"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.print'}" xid="button27"> 
            <i xid="i27"/>  
            <span xid="span27"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.exportPDF'}" xid="button28"> 
            <i xid="i28"/>  
            <span xid="span28"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.exportWord'}" xid="button29"> 
            <i xid="i29"/>  
            <span xid="span29"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report5.exportExcel'}" xid="button30"> 
            <i xid="i30"/>  
            <span xid="span30"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/group-custom.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report5"/> 
      </div>  
      <div class="tab-pane" xid="tabContent6"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar6">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.pageSetup'}" xid="button31"> 
            <i xid="i31"/>  
            <span xid="span31"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.preview'}" xid="button32"> 
            <i xid="i32"/>  
            <span xid="span32"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.print'}" xid="button33"> 
            <i xid="i33"/>  
            <span xid="span33"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.exportPDF'}" xid="button34"> 
            <i xid="i34"/>  
            <span xid="span34"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.exportWord'}" xid="button35"> 
            <i xid="i35"/>  
            <span xid="span35"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report6.exportExcel'}" xid="button36"> 
            <i xid="i36"/>  
            <span xid="span36"/>
          </a>
        </div>
        <div component="$UI/system/components/justep/report/report" src="report/group-sum.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report6"/> 
      </div> 
    </div> 
  </div> 
</div>
