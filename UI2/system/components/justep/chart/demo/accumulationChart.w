<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:130px;">
    <div xid="s1" component="$UI/system/components/justep/reportData/reportData">
      <source> 
        <action name="accumulationChartAction" type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="累积对比分析"> 
        <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button1" icon="icon-chevron-left" onClick="btnCancelClick">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="div2">累积对比分析</div>  
        <div class="x-titlebar-right reverse" xid="div3"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/chart/chart" xid="vertical_chart_bar" chartName="垂直柱图" autoLoad="true" dataList="s1" class="x-chart">  
        <chart> 
          <config> 
            <!--visible:是否显示，position：显示位置-->  
            <title visible="true" position="TOP">累积分析</title>  
            <!--name:字体，style：样式(粗体，斜体)，size：字号-->  
            <title-font name="黑体" style="1" size="20"/> 
          </config>  
          <series-set> 
            <!--chart-type:图表类型-->  
            <series chart-type="vertical-bar" ref="s1"> 
              <!--title：数据关系，categoryAxis：分类轴关系，numberAxis：数据轴关系-->  
              <data title="库存" categoryAxis="RCATEGORYNAME" numberAxis="ALL_CB" id="reportData_1"/>  
              <data title="总库存" categoryAxis="RCATEGORYNAME" numberAxis="SUM(ALL_CB)" id="reportData_2"/>  
              <config> 
                <!--category-title:分类轴标题-->  
                <category-title>产品</category-title>  
                <!--serie-title: 数据轴标题-->  
                <serie-title>库存</serie-title>  
                <!--category-item-label-visible:分类轴数值显示-->  
                <category-item-label-visible>true</category-item-label-visible>  
                <!--serie-number:数据轴数值，visible:显示，auto:根据数据变化，start:开始数值，end:结束数值，step:步长-->  
                <serie-number visible="true" auto="true" start="0" end="300000" step="40000"/>  
                <!--category-item-label-angle:分类轴标签显示角度-->  
                <category-item-label-angle>30</category-item-label-angle> 
              </config> 
            </series> 
          </series-set> 
        </chart> 
      </div>  
    </div>  
  </div>
</div>
