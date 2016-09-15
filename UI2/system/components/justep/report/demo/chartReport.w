<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:130px;"> 
    <div xid="p1" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="chartReportAction1" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
    <div xid="s1" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="chartReportAction2" type="action" columns="COMPANYNAME,CATEGORYNAME,CB"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="图表混合报表"> 
        <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button1" icon="icon-chevron-left" onClick="btnCancelClick">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="div2">图表混合报表</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1">
      <div style="position:absolute;top:-1000px" component="$UI/system/components/justep/chart/chart" xid="chartA" chartName="chart" autoLoad="true" dataList="s1" class="x-chart">  
        <chart> 
          <config> 
            <title visible="true" position="TOP"/> 
          </config>  
          <series-set> 
            <series id="chartSeries1" chart-type="vertical-bar-3d" name="verticalbar3dchart" ref="s1"> 
              <config> 
                <category-title id="default11">分类</category-title>  
                <serie-title>成本</serie-title> 
              </config>  
              <data title="COMPANYNAME" categoryAxis="CATEGORYNAME" numberAxis="CB" ref="s1" autoData="true" id="data1"/> 
            </series> 
          </series-set> 
        </chart>
       </div>  
     
      <div class="x-report x-scroll-h" component="$UI/system/components/justep/report/report" xid="card" src="chartReport.xml" reportName="图表混合报表" autoLoad="true" dataList=""/>  
    </div> 
  </div> 
</div>
