<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:435px;top:157px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mainData" idColumn="id"> 
      <column name="id" type="String" xid="xid1"/>  
      <column name="type" type="String" xid="xid2"/>  
      <data xid="default1">[{"id":"001","type":"datetime"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="typeData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="xid4"/>  
      <column label="name" name="name" type="String" xid="xid5"/>  
      <data xid="default2">[{"id":"datetime","name":"日期时间"},{"id":"date","name":"日期"},{"id":"time","name":"时间"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="时间选择"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">时间选择</div>  
        <div class="x-titlebar-right reverse"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1">title</span> 
        </div>  
        <span component="$UI/system/components/justep/select/radioGroup" class="x-radio-group"
          xid="radioGroup1" bind-itemset="typeData" bind-itemsetValue="ref('id')"
          bind-itemsetLabel="ref('name')" bind-ref="$model.mainData.ref(&quot;type&quot;)"/>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block"
          label="选择日期时间" xid="button1" onClick="datePickerClick"> 
          <i xid="i1"/>  
          <span xid="span2">选择日期时间</span> 
        </a> 
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output"></div></div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/datePicker/datePicker" class="x-popPicker"
    xid="datePicker" type="datetime" onOK="doOK" style="left:75px;top:11px;"> 
    <div class="x-popPicker-overlay"/>  
    <div class="x-popPicker-content"> 
      <div class="x-poppicker-header"> 
        <button class="btn btn-default x-btn-ok">确定</button> 
      </div>  
    </div> 
  </div> 
</div>
