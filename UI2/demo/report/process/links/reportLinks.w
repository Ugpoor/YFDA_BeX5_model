<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="p1"> 
      <source xid="default1"> 
        <action name="linkReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="li1"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[列表详细页面]]></a>
      </li>  
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"><div component="$UI/system/components/justep/report/report" src="reports/reportLinks.xml" reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report"></div></div>  
    </div> 
  </div>
</div>
