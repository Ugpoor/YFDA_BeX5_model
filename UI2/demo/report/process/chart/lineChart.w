<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model">
    <div component="$UI/system/components/justep/reportData/reportData" xid="s2"> 
      <source xid="default1">
        <action columns="RORDERYEAR,RORDERMONTH,RSUMPRICE" name="lineChartAction1"
          type="action"/>
      </source>
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="s5"> 
      <source xid="default3"> 
        <action name="lineChartAction2" type="action"/> 
      </source>
    </div>
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1">垂直线图</a>
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Click">3D垂直线图</a>
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3" bind-click="tabItem3Click">水平线图</a>
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4" bind-click="tabItem4Click">3D水平线图</a>
      </li>  
      <li xid="li5"> 
        <a content="tabContent5" xid="tabItem5" bind-click="tabItem5Click">垂直XY-线图</a>
      </li>  
      <li xid="li6"> 
        <a content="tabContent6" xid="tabItem6" bind-click="tabItem6Click">水平XY-线图</a>
      </li>
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" data-list="" xid="v_line" dataList="s2" style="width:732px;height:419px;"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"><series xid="chartSeries1" chart-type="vertical-line" name="verticallinechart"><data title="RORDERYEAR" categoryAxis="RORDERMONTH" numberAxis="RSUMPRICE" ref="s2" autoData="true" xid="default9"></data></series></series-set>
          </chart> 
        </div>
      </div>  
      <div class="tab-pane" xid="tabContent2">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'v_line_3D.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>
      <div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="false" data-list="" xid="v_line_3D" dataList="s2" style="width:724px;height:429px;">
   <chart xid="chart3">
    <config xid="default4"></config>
    <series-set xid="series-set2"><series xid="chartSeries2" chart-type="vertical-line-3d" name="verticalline3dchart"><data title="RORDERYEAR" categoryAxis="RORDERMONTH" numberAxis="RSUMPRICE" ref="s2" autoData="true" xid="default10"></data></series></series-set></chart> </div></div>  
      <div class="tab-pane" xid="tabContent3">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>
      <div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="false" data-list="" xid="h_line" dataList="s2" style="width:724px;height:431px;">
   <chart xid="chart5">
    <config xid="default5"></config>
    <series-set xid="series-set3"><series xid="chartSeries3" chart-type="horizontal-line" name="horizontallinechart"><data title="RORDERYEAR" categoryAxis="RORDERMONTH" numberAxis="RSUMPRICE" ref="s2" autoData="true" xid="default11"></data></series></series-set></chart> </div></div>  
      <div class="tab-pane" xid="tabContent4">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'h_line_3d.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>
      <div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="false" data-list="" xid="h_line_3d" dataList="s2" style="width:700px;height:435px;">
   <chart xid="chart7">
    <config xid="default6"></config>
    <series-set xid="series-set4"><series xid="chartSeries4" chart-type="horizontal-line-3d" name="horizontalline3dchart"><data title="RORDERYEAR" categoryAxis="RORDERMONTH" numberAxis="RSUMPRICE" ref="s2" autoData="true" xid="default12"></data></series></series-set></chart> </div></div>  
      <div class="tab-pane" xid="tabContent5">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vxy_line.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>
      <div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="false" data-list="" xid="vxy_line" dataList="s5" style="width:705px;height:416px;">
   <chart xid="chart9">
    <config xid="default7"></config>
    <series-set xid="series-set5"><series xid="chartSeries5" chart-type="vertical-xy-line" name="verticalxylinechart"><data ref="s5" title="three" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM3" xid="default14"></data>
  <data ref="s5" title="two" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM2" xid="default15"></data>
  <data ref="s5" title="three" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM3" xid="default16"></data></series></series-set></chart> </div></div>  
      <div class="tab-pane" xid="tabContent6">
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar6"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'hxy_line.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>
      <div component="$UI/system/components/justep/chart/chart" chartName="chart" autoLoad="false" data-list="" xid="hxy_line" dataList="s5" style="width:700px;height:441px;">
   <chart xid="chart11">
    <config xid="default8"><title xid="default20" visible="true" position="TOP">2009年福彩3D走势图</title></config>
    <series-set xid="series-set6"><series xid="chartSeries6" chart-type="horizontal-xy-line" name="horizontalxylinechart"><data ref="s5" title="one" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM1" xid="default17"></data>
  <data ref="s5" title="two" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM2" xid="default18"></data>
  <data ref="s5" title="three" categoryAxis="RSTAGE" numberAxis="RLOTTERYNUM3" xid="default19"></data>
  <config xid="default21"></config></series></series-set></chart> </div></div>
    </div> 
  </div>
</div>
