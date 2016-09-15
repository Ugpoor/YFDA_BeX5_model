<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:84px;top:274px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="data" idColumn="tID"> 
      <column label="ID" name="tID" type="String" xid="xid1"/>  
      <column label="姓名" name="tName" type="String" xid="xid2"/>  
      <column label="性别" name="tSex" type="String" xid="xid3"/>  
      <column label="年龄 " name="tAge" type="Integer" xid="xid4"/>  
      <data xid="default1">[{"tID":"1","tName":"张小三","tSex":"男","tAge":21},{"tID":"2","tName":"张小三","tSex":"男","tAge":22},{"tID":"3","tName":"张小三","tSex":"男","tAge":23},{"tID":"4","tName":"张小三","tSex":"男","tAge":24},{"tID":"5","tName":"张小三","tSex":"男","tAge":25},{"tID":"6","tName":"张小三","tSex":"男","tAge":26},{"tID":"7","tName":"张小三","tSex":"男","tAge":27},{"tID":"8","tName":"张小三","tSex":"男","tAge":28},{"tID":"9","tName":"张小三","tSex":"男","tAge":29},{"tID":"10","tName":"张小三","tSex":"男","tAge":20}]</data>
    </div> 
  </div>  
  <h4 xid="h41"><![CDATA[列表-点击行选中checkbox模式]]>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="JS" xid="showJSButton" onClick="showJSButtonClick"> 
      <i xid="i1"/>  
      <span xid="span1">JS</span>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="源码" xid="source" onClick="sourceClick"> 
      <i xid="i2"/>  
      <span xid="span2">源码</span>
    </a>
  </h4>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="blueActive" class="table table-bordered table-hover table-striped"
    xid="dataTables" data="data" showRowNumber="false" multiSelect="true" onRowCheckedAll="dataTablesRowCheckedAll"
    onRowClick="dataTablesRowClick"> 
    <columns xid="columns1"> 
      <column name="tName" xid="column1" label="姓名" orderable="false"/>  
      <column name="tSex" xid="column2" label="性别" orderable="false"/>  
      <column name="tAge" xid="column3" label="年龄" orderable="false"/>  
      <column name="tID" xid="column4" orderable="false"/>
    </columns> 
  </div> 
</div>
