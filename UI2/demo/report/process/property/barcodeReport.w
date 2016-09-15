<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="ds1" idColumn="id">
      <column label="id" name="id" type="String" xid="default2"/>  
      <column label="ITEM1" name="ITEM1" type="String" xid="default3"/>  
      <column label="ITEM2" name="ITEM2" type="String" xid="default4"/>  
      <data xid="default5">[{"id":"1","ITEM1":"AAA","ITEM2":"6823698713685"},{"id":"2","ITEM1":"BBB","ITEM2":"68214682722363"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.pageSetup'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.preview'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.print'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span3"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportPDF'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span4"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportWord'}" xid="button5"> 
      <i xid="i5"/>  
      <span xid="span5"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'report.exportExcel'}" xid="button6"> 
      <i xid="i6"/>  
      <span xid="span6"/> 
    </a> 
  </div>
<div component="$UI/system/components/justep/report/report" src="reports/barcodeReport.xml" reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report"></div></div>
