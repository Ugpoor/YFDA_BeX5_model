<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1"> 
        <action name="ganttChartAction" columns="RPROJECTROLE,RPROJECTTYPE,RSTARTTIME,RENDTIME,RPLANSTARTTIME,RPLANENDTIME"
          type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[垂直甘特图]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Click"><![CDATA[水平甘特图]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_gantt_v.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" data-list="" xid="chart_gantt_v" style="width:700px;height:369px;"
          dataList="s1"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries5" chart-type="vertical-gantt" name="verticalganttchart"><data title="实际" categoryAxis="RPROJECTROLE" startDate="RSTARTTIME" endDate="RENDTIME" ref="s1" xid="default5"></data>
  <data title="计划" categoryAxis="RPROJECTROLE" startDate="RPLANSTARTTIME" endDate="RPLANENDTIME" ref="s1" xid="default6"></data></series></series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="chart_gantt_hBar"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.pageSetup'}" xid="button7">
   <i xid="i7"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.preview'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.print'}" xid="button9">
   <i xid="i9"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.exportPDF'}" xid="button10">
   <i xid="i10"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.exportWord'}" xid="button11">
   <i xid="i11"></i>
   <span xid="span11"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_gantt_h.exportExcel'}" xid="button12">
   <i xid="i12"></i>
   <span xid="span12"></span></a></div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="chart_gantt_h" dataList="s1" style="width:700px;height:401px;"> 
          <chart xid="chart3"> 
            <config xid="default3"/>  
            <series-set xid="series-set2"><series xid="chartSeries4" chart-type="horizontal-gantt" name="horizontalganttchart"><data title="实际" categoryAxis="RPROJECTROLE" startDate="RSTARTTIME" endDate="RENDTIME" ref="s1" xid="default7"></data>
  <data title="计划" categoryAxis="RPROJECTROLE" startDate="RPLANSTARTTIME" endDate="RPLANENDTIME" ref="s1" xid="default8"></data></series></series-set>
          </chart> 
        </div>
      </div> 
    </div> 
  </div> 
</div>
