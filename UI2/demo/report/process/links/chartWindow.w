<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="s1"> 
      <source> 
        <KSQL/>  
        <SQL> 
          <DEFAULT id="default1"/>  
          <ORACLE id="default2">SELECT RCATEGORYNAME ,SUM(PRICE) AS RSUMPRICE FROM( SELECT ( SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME ,RUNITPRICE*RUNITSINSTOCK AS PRICE FROM DEMO_REPORTPRODUCTS)A GROUP BY A.RCATEGORYNAME</ORACLE>  
          <MSSQL id="default3">SELECT RCATEGORYNAME ,SUM(PRICE) AS RSUMPRICE FROM( SELECT ( SELECT RCATEGORYNAME FROM DEMO_REPORTPRODUCTCATEGORY WHERE DEMO_REPORTPRODUCTCATEGORY.RCATEGORYID = DEMO_REPORTPRODUCTS.RCATEGORYID) AS RCATEGORYNAME ,RUNITPRICE*RUNITSINSTOCK AS PRICE FROM DEMO_REPORTPRODUCTS)A GROUP BY A.RCATEGORYNAME</MSSQL>  
          <SYBASE id="default4"/>  
          <DB2 id="default5"/> 
        </SQL>  
        <action id="default6" name="pieChartAction" type="action"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar"/>  
  <div component="$UI/system/components/justep/chart/chart" chartName="chart"
    autoLoad="true" dataList="" xid="pie3D" dialog="windowDialog" style="position:absolute;width:690px;height:423px;"> 
    <chart xid="chart2"> 
      <config xid="default2"/>  
      <series-set xid="series-set1">
        <series xid="chartSeries1" chart-type="pie-3d" name="pie3dchart">
          <data categoryAxis="RCATEGORYNAME" numberAxis="RSUMPRICE" ref="s1" xid="default3">
            <href model="window" title="明细-{$RCATEGORYNAME}" xid="default4">$UI/demo/report/process/links/chartLinks.w?category='RCATEGORYNAME'&amp;number=$RCATEGORYNAME&amp;process='/demo/report/process/links/linksProcess'&amp;activity='chartWindowActivity'</href>
          </data>
        </series>
      </series-set>
    </chart> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    status="normal" showTitle="true" forceRefreshOnOpen="true"/>
</div>
