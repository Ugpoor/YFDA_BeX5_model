<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:127px;top:15px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="d1" idColumn="id">
      <column label="id" name="id" type="String" xid="default3"/>  
      <column label="E_NAME" name="E_NAME" type="String" xid="default4"/>  
      <column label="ORDER_DATE" name="ORDER_DATE" type="String" xid="default5"/>  
      <column label="SALSE" name="SALSE" type="String" xid="default6"/>  
      <data xid="default7">[{"id":"1","E_NAME":"范西平","ORDER_DATE":"2008-01-05","SALSE":"6823"},{"id":"2","E_NAME":"范西平","ORDER_DATE":"2008-03-05","SALSE":"6598"},{"id":"3","E_NAME":"范西平","ORDER_DATE":"2008-04-05","SALSE":"5983"},{"id":"4","E_NAME":"范西平","ORDER_DATE":"2008-06-05","SALSE":"3246"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[时序图]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'chart_time_xreport.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chartName="chart"
          autoLoad="true" data-list="" xid="chart_time_xreport" style="width:700px;height:415px;"
          dataList="d1"> 
          <chart xid="chart2"> 
            <config xid="default2"/>  
            <series-set xid="series-set1">
              <series xid="chartSeries1" chart-type="time-series" name="timeserieschart">
                <data ref="d1" title="范西平" categoryAxis="ORDER_DATE" numberAxis="SALSE"
                  xid="default8"/>
              </series>
            </series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
