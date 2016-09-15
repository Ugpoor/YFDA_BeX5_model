<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action id="default12" name="chartReportAction1" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default2"> 
        <action id="default13" name="chartReportAction2" type="action" columns="COMPANYNAME,CATEGORYNAME,CB"/> 
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
  <div component="$UI/system/components/justep/report/report" src="reports/chartReport.xml"
    reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report"/>  
  <div component="$UI/system/components/justep/chart/chart" chartName="chart"
    autoLoad="false" xid="chartA" dataList="s1" style="width:500px;height:323px;"> 
    <chart xid="chart2"> 
      <config xid="default3"/>  
      <series-set xid="series-set1"> 
        <series xid="chartSeries1" chart-type="vertical-bar-3d" name="verticalbar3dchart"> 
          <data title="COMPANYNAME" categoryAxis="CATEGORYNAME" numberAxis="CB"
            ref="s1" autoData="true" xid="default4"/> 
        </series> 
      </series-set> 
    </chart> 
  </div> 
</div>
