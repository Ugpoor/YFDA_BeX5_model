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
    xid="toolBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.pageSetup'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.preview'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.print'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span3"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.exportPDF'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span4"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.exportWord'}" xid="button5"> 
      <i xid="i5"/>  
      <span xid="span5"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'pie.exportExcel'}" xid="button6"> 
      <i xid="i6"/>  
      <span xid="span6"/> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/chart/chart" chartName="chart"
    autoLoad="true" data-list="s1" xid="pie" style="width:642px;height:414px;" dataList="s1"
    dialog="windowDialog"> 
    <chart xid="chart2"> 
      <config xid="default2"/>  
      <series-set xid="series-set1"> 
        <series xid="chartSeries1" chart-type="pie" name="piechart"> 
          <data categoryAxis="RCATEGORYNAME" numberAxis="RSUMPRICE" ref="s1" xid="default3"> 
            <href model="dialog" title="明细-{$RCATEGORYNAME}" xid="default4">$UI/demo/report/process/links/chartLinks.w?category='RCATEGORYNAME'&amp;number=$RCATEGORYNAME&amp;process='/demo/report/process/links/linksProcess'&amp;activity='chartLinksActivity'</href> 
          </data> 
        </series> 
      </series-set> 
    </chart> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    showTitle="true" forceRefreshOnOpen="false" status="normal"/> 
</div>
