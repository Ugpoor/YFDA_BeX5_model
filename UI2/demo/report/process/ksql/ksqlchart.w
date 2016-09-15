<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="reportData1"> 
      <source xid="default1"> 
        <action id="default4" name="ksqlChartAction" type="ksqlaction"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.pageSetup'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.preview'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.print'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span3"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.exportPDF'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span4"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.exportWord'}" xid="button5"> 
      <i xid="i5"/>  
      <span xid="span5"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'chart.exportExcel'}" xid="button6"> 
      <i xid="i6"/>  
      <span xid="span6"/>
    </a>
  </div>  
  <div> 
    <div component="$UI/system/components/justep/chart/chart" chartName="chart"
      autoLoad="true" data-list="" xid="chart" dataList="reportData1" style="width:537px;height:323px;"> 
      <chart xid="chart2"> 
        <config xid="default2"/>  
        <series-set xid="series-set1"> 
          <series xid="chartSeries1" chart-type="pie" name="piechart"> 
            <data categoryAxis="fX" numberAxis="f1" ref="reportData1" xid="default3"/> 
          </series> 
        </series-set> 
      </chart> 
    </div> 
  </div> 
</div>
