<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:221px;top:12px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1"> 
        <action id="default6" columns="RCATEGORYNAME,RSUMPRICE" name="pieChartAction"
          type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[饼图]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Select"><![CDATA[3D饼图]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'pie1.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="true" xid="pie1" dataList="s1" chartName="饼图" style="width:642px;height:414px;"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries1" chart-type="pie" name="piechart"> 
                <data categoryAxis="RCATEGORYNAME" numberAxis="RSUMPRICE" ref="s1"
                  xid="default3"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.pageSetup'}" xid="button7">
   <i xid="i7"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.preview'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.print'}" xid="button9">
   <i xid="i9"></i>
   <span xid="span9"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.exportPDF'}" xid="button10">
   <i xid="i10"></i>
   <span xid="span10"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.exportWord'}" xid="button11">
   <i xid="i11"></i>
   <span xid="span11"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'pie3d1.exportExcel'}" xid="button12">
   <i xid="i12"></i>
   <span xid="span12"></span></a></div>  
        <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="false" xid="pie3d1" dataList="s1" style="width:604px;height:397px;"
          chartName="3D饼图"> 
          <chart xid="chart3"> 
            <config xid="default4"/>  
            <series-set xid="series-set2">
              <series xid="chartSeries2" chart-type="pie-3d" name="pie3dchart">
                <data categoryAxis="RCATEGORYNAME" numberAxis="RSUMPRICE" ref="s1"
                  xid="default5"/>
              </series>
            </series-set>
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
