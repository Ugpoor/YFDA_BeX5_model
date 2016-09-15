<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:377px;top:514px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="statisticsOrderData" idColumn="times" onCustomRefresh="data1CustomRefresh">
      <column label="金额合计(元)" name="daySum" type="String" xid="xid1"></column>
  <column label="日期" name="times" type="Date" xid="xid2"></column>
  <column label="数量合计（份）" name="count" type="String" xid="xid3"></column>
  <column isCalculate="false" label="平均价格（元）" name="price" type="String" xid="xid4"></column>
  <rule xid="rule1">
   <col name="price" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default1"></expr></calculate> </col> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button"
      label="查看销售额折线图" xid="showPicture" icon="icon-android-image" onClick="showPictureClick"> 
      <i xid="i2" class="icon-android-image"/>  
      <span xid="span2">查看销售额折线图</span>
    </a>  
    <span xid="span3"><![CDATA[输入时间：]]></span>
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="startDate" dataType="Date" format="yyyy-MM-dd"/>  
    <span xid="span4"><![CDATA[~]]></span>
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="endDate" dataType="Date" format="yyyy-MM-dd"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="搜索" xid="select" icon="icon-android-search" onClick="selectClick"> 
      <i xid="i3" class="icon-android-search"/>  
      <span xid="span5">搜索</span>
    </a>
  </div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    responsive="true" rowActiveClass="active" class="table table-hover table-striped"
    xid="dataTables1" data="statisticsOrderData"> 
    <columns xid="columns1">
      <column name="times" xid="column2"/>
      <column name="daySum" xid="column1"/>  
      <column name="count" xid="column3"/>  
      <column name="price" xid="column4"/>
    </columns>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="echartWindowDialog"
    width="50%" height="50%" status="normal" src="statisticsEchart.w"/>
</div>
