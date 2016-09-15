<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="gridReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1">隐藏行</a> 
      </li>  
      <li role="presentation" xid="li2"> 
        <a content="tabContent2" xid="tabItem2">隐藏列</a> 
      </li>  
      <li xid="li3"> 
        <a content="tabContent3" xid="tabItem3">按值隐藏</a> 
      </li>  
      <li xid="li4"> 
        <a content="tabContent4" xid="tabItem4">按条件隐藏</a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div component="$UI/system/components/justep/report/report" src="reports/visibleReport1.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report1"/> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/report/report" src="reports/visibleReport2.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report2"/> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
        <div component="$UI/system/components/justep/report/report" src="reports/visibleReport3.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report3"/> 
      </div>  
      <div class="tab-pane" xid="tabContent4"> 
        <div component="$UI/system/components/justep/report/report" src="reports/visibleReport4.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report4"/> 
      </div> 
    </div> 
  </div> 
</div>
