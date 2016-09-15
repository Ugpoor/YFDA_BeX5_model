<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:130px;"> 
    <div xid="s1" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="pieChartAction" type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="饼图"> 
        <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button1" icon="icon-chevron-left" onClick="btnCancelClick">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="div2">饼图</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/chart/chart" xid="pie" chartName="饼图"
        autoLoad="true" dataList="s1" class="x-chart"> 
        <chart> 
          <config> 
            <title visible="true" position="TOP">产品采购中各类型构成分析</title>  
            <title-font name="黑体" style="1" size="20"/> 
          </config>  
          <series-set> 
            <series chart-type="pie" ref="s1"> 
              <data categoryAxis="RCATEGORYNAME" numberAxis="RSUMPRICE" id="reportData_1"
                ref="s1"/>  
              <config> 
                <explode-percent index="0" value="0.3D"/>  
                <no-data-message>没有数据</no-data-message>  
                <explode-percent index="2" value="0.5"/> 
              </config> 
            </series> 
          </series-set> 
        </chart> 
      </div> 
    </div> 
  </div> 
</div>
