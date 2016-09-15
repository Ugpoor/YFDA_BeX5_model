<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:130px;"> 
    <div xid="e1" component="$UI/system/components/justep/reportData/reportData"> 
      <source> 
        <action name="cardReportAction" type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="卡片报表"> 
        <div class="x-titlebar-left" xid="div1"><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button1" icon="icon-chevron-left" onClick="btnCancelClick">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>  
        <div class="x-titlebar-title" xid="div2">卡片报表</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="x-report x-scroll-h" component="$UI/system/components/justep/report/report" xid="card" src="cardReport.xml" report-name="卡片报表" autoLoad="true" data-list=""/>  
    </div> 
  </div> 
</div>
