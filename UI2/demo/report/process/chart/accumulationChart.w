<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1"> 
        <action name="accumulationChartAction" type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[累计分析对比]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'vertical_chart_bar.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" autoLoad="true"
          data-list="" xid="vertical_chart_bar" style="position:absolute;height:428px;width:700px;"
          dataList="s1" chartName="char"> 
          <chart xid="chart2"> 
            <config xid="default2">
              <title xid="default6" visible="true" position="TOP">累积分析</title>  
              <title-font xid="default7" name="黑体" style="1" size="20"/>
            </config>  
            <series-set xid="series-set1">
              <series xid="chartSeries1" chart-type="vertical-bar" name="verticalbarchart">
                <data ref="s1" title="库存" categoryAxis="RCATEGORYNAME" numberAxis="ALL_CB"
                  xid="default4"/>  
                <data ref="s1" title="总库存" categoryAxis="RCATEGORYNAME" numberAxis="SUM(ALL_CB)"
                  xid="default5"/>  
                <config xid="default8">
                  <category-title xid="default9">产品</category-title>  
                  <category-margin xid="default10">0.1</category-margin>
                </config>
              </series>
            </series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
