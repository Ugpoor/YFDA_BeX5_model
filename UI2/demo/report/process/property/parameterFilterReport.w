<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="searchData"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="f1"> 
      <source xid="default1"> 
        <action name="parameterFilterReportAction" type="action" columns="RPRODUCTID,RPRODUCTNAME,RCATEGORYNAME,RCOMPANYNAME,RQUANTITYPERUNIT,RUNITPRICE,RUNITSINSTOCK"/> 
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.pageSetup'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.preview'}" xid="button3"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.print'}" xid="button4"> 
      <i xid="i3"/>  
      <span xid="span3"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.exportPDF'}" xid="button5"> 
      <i xid="i4"/>  
      <span xid="span4"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.exportWord'}" xid="button6"> 
      <i xid="i5"/>  
      <span xid="span5"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'grid.exportExcel'}" xid="button7"> 
      <i xid="i7"/>  
      <span xid="span7"/>
    </a>
  </div>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"> 
    <div class="col col-xs-2 text-right" xid="col4"> 
      <label style="margin-top:9px">产品名称：</label> 
    </div>  
    <div class="col col-xs-2" xid="col5"> 
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="proName"/> 
    </div>  
    <div class="col col-xs-2 text-right" xid="col6"> 
      <label style="margin-top:9px">产品ID：</label> 
    </div>  
    <div class="col col-xs-2" xid="col7"> 
      <input component="$UI/system/components/justep/input/input" class="form-control"
        xid="proId"/> 
    </div>  
    <div class="col col-xs-2" xid="col8"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-default"
        label="查询" xid="button2" onClick="searchData"> 
        <i xid="i6"/>  
        <span xid="span6">查询</span> 
      </a> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/report/report" src="reports/parameterFilterReport.xml"
    reportName="report" autoLoad="false" dataList="f1" class="x-report x-scroll-h" xid="grid" style="width:100%;height:100%;"/> 
</div>
