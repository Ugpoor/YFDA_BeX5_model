<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:331px;top:67px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source xid="default1"> 
        <action columns="RCOMPANYNAME,RCATEGORYNAME,CB" name="areaChartAction"
          type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[垂直面积图]]></a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2" bind-click="tabItem2Select"><![CDATA[水平面积图]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_v.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" xid="area_v" style="width:700px;height:400px;"
          dataList="s1"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries1" chart-type="vertical-area" name="verticalareachart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="CB"
                  ref="s1" autoData="true" xid="default3"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.pageSetup'}" xid="button7"> 
            <i xid="i7"/>  
            <span xid="span7"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.preview'}" xid="button8"> 
            <i xid="i8"/>  
            <span xid="span8"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.print'}" xid="button9"> 
            <i xid="i9"/>  
            <span xid="span9"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.exportPDF'}" xid="button10"> 
            <i xid="i10"/>  
            <span xid="span10"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.exportWord'}" xid="button11"> 
            <i xid="i11"/>  
            <span xid="span11"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'area_h.exportExcel'}" xid="button12"> 
            <i xid="i12"/>  
            <span xid="span12"/>
          </a>
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="false" xid="area_h" dataList="s1" style="width:700px;height:426px;"> 
          <chart xid="chart3"> 
            <config xid="default4"/>  
            <series-set xid="series-set2"> 
              <series xid="chartSeries2" chart-type="horizontal-area" name="horizontalareachart"> 
                <data title="RCOMPANYNAME" categoryAxis="RCATEGORYNAME" numberAxis="CB"
                  ref="s1" autoData="true" xid="default5"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
