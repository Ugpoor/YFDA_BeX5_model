<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1"> 
        <action columns="RCOMPANYNAME,RCATEGORYNAME,RCB" name="barHChartAction"
          type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1">水平柱图</a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Click">3D水平柱图</a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3" bind-click="tabItem3Click">堆叠式水平柱图</a> 
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4" bind-click="tabItem4Click">3D堆叠式水平柱图</a> 
      </li>  
      <li xid="li5"> 
        <a content="tabContent5" xid="tabItem5" bind-click="tabItem5Click">水平圆柱图</a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_chart_bar.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" data-list="" xid="horizontal_chart_bar" dataList="s1" style="width:700px;height:405px;"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries1" chart-type="horizontal-bar" name="horizontalbarchart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="RCB"
                  ref="s1" autoData="true" xid="default7"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'horizontal_3d_chart_bar.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="horizontal_3d_chart_bar" dataList="s1"
          style="width:700px;height:465px;"> 
          <chart xid="chart3"> 
            <config xid="default3"/>  
            <series-set xid="series-set2"> 
              <series xid="chartSeries2" chart-type="horizontal-bar-3d" name="horizontalbar3dchart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="RCB"
                  ref="s1" autoData="true" xid="default8"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_chart_bar.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="stackedh_chart_bar" style="width:700px;height:454px;"
          dataList="s1"> 
          <chart xid="chart5"> 
            <config xid="default4"/>  
            <series-set xid="series-set3"> 
              <series xid="chartSeries3" chart-type="stacked-horizontal-bar" name="stackedhorizontalbarchart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="RCB"
                  ref="s1" autoData="true" xid="default9"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent4"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar4"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'stackedh_3d_chart.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" xid="stackedh_3d_chart" style="width:700px;height:468px;"
          dataList="s1"> 
          <chart xid="chart7"> 
            <config xid="default5"/>  
            <series-set xid="series-set4"> 
              <series xid="chartSeries4" chart-type="stacked-horizontal-bar-3d"
                name="stackedhorizontalbar3dchart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="RCB"
                  ref="s1" autoData="true" xid="default10"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent5"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar5"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.pageSetup'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.preview'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.print'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.exportPDF'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.exportWord'}"> 
            <i/>  
            <span/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'cylinder_horizontal_bar_chart.exportExcel'}"> 
            <i/>  
            <span/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" data-list="" style="width:700px;height:430px;" dataList="s1"
          xid="cylinder_horizontal_bar_chart"> 
          <chart xid="chart9"> 
            <config xid="default6"/>  
            <series-set xid="series-set5"> 
              <series xid="chartSeries5" chart-type="cylinder-horizontal-bar"
                name="cylinderhorizontalbarchart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="RCB"
                  ref="s1" autoData="true" xid="default11"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
