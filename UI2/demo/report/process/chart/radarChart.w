<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="data" idColumn="id"><column label="id" name="id" type="String" xid="default1"></column>
  <column label="ITEM" name="ITEM" type="String" xid="default3"></column>
  <column label="NUM" name="NUM" type="String" xid="default4"></column>
  <data xid="default5">[{&quot;id&quot;:&quot;1&quot;,&quot;ITEM&quot;:&quot;外观&quot;,&quot;NUM&quot;:&quot;5&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;ITEM&quot;:&quot;性能&quot;,&quot;NUM&quot;:&quot;9&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;ITEM&quot;:&quot;功能&quot;,&quot;NUM&quot;:&quot;6&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;ITEM&quot;:&quot;易用性&quot;,&quot;NUM&quot;:&quot;3&quot;},{&quot;id&quot;:&quot;5&quot;,&quot;ITEM&quot;:&quot;灵活性&quot;,&quot;NUM&quot;:&quot;6&quot;},{&quot;id&quot;:&quot;6&quot;,&quot;ITEM&quot;:&quot;性价比&quot;,&quot;NUM&quot;:&quot;8&quot;}]</data></div></div> 
<div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs">
   <ul class="nav nav-tabs" xid="tabNav1">
    <li class="active" xid="li1">
     <a content="tabContent1" xid="tabItem1"><![CDATA[雷达图]]></a></li> 
    </ul> 
   <div class="tab-content" xid="div1">
    <div class="tab-pane active" xid="tabContent1">
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.pageSetup'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.preview'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.print'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.exportPDF'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.exportWord'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'chart_radar.exportExcel'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span6"></span></a></div><div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="true" data-list="" xid="chart_radar" style="width:500px;height:375px" dataList="data">
   <chart xid="chart2">
    <config xid="default2"></config>
    <series-set xid="series-set1"><series xid="chartSeries1" chart-type="radar" name="radarchart"><data ref="data" title="产品特性" categoryAxis="ITEM" numberAxis="NUM" xid="default6"></data></series></series-set></chart> </div></div>
    </div> </div></div>