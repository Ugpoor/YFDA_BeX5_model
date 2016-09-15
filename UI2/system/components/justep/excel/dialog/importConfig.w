<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:483px;top:511px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="cfgData" idColumn="id"> 
      <column label="id" name="id" type="String" xid="default13"/>  
      <column label="导入映射配置" name="mapping" type="String" xid="default14"/>  
      <column label="导入Excel文件" name="excel" type="String" xid="default15"/>  
      <column label="自定义参数" name="userConfig" type="String" xid="default16"/>  
      <column label="全部页" name="allSheet" type="String" xid="default17"/>  
      <column label="开始页" name="sheetStart" type="String" xid="default18"/>  
      <column label="结束页" name="sheetEnd" type="String" xid="default19"/>  
      <column label="全部行" name="allRow" type="String" xid="default20"/>  
      <column label="开始行" name="rowStart" type="String" xid="default21"/>  
      <column label="结束行" name="rowEnd" type="String" xid="default22"/> 
    <data xid="default23">[{&quot;id&quot;:&quot;cfg&quot;}]</data>
  <rule xid="rule1">
   <col name="allSheet" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default24">$row.val('userConfig')!='1'</expr></readonly> </col> 
   <col name="sheetStart" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default25">$row.val('userConfig')!='1' || $row.val('allSheet')=='1'</expr></readonly> </col> 
   <col name="sheetEnd" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default26">$row.val('userConfig')!='1' || $row.val('allSheet')=='1'</expr></readonly> </col> 
   <col name="allRow" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default27">$row.val('userConfig')!='1'</expr></readonly> </col> 
   <col name="rowStart" xid="ruleCol5">
    <readonly xid="readonly5">
     <expr xid="default28"><![CDATA[$row.val('userConfig')!='1' || $row.val('allRow')=='1']]></expr></readonly> </col> 
   <col name="rowEnd" xid="ruleCol6">
    <readonly xid="readonly6">
     <expr xid="default29"><![CDATA[$row.val('userConfig')!='1' || $row.val('allRow')=='1']]></expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="mappingFilesdata" idColumn="file"> 
      <column label="file" name="file" type="String" xid="default30"></column>
  <column label="fileName" name="fileName" type="String" xid="default31"></column></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="Excel" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span3">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div class="form-group" xid="formGroup1"> 
            <div class="col-sm-2" xid="col1"> 
              <label class="control-label" xid="controlLabel1" bind-text=' $model.cfgData.label("mapping")'><![CDATA[]]></label> 
            </div>  
            <div class="col-sm-4" xid="col2"> 
              <select component="$UI/system/components/justep/select/select" class="form-control"
                xid="select1" bind-ref="cfgData.ref('mapping')" bind-options="mappingFilesdata"
                bind-optionsCaption="请选择..." bind-optionsValue="file" bind-optionsLabel="fileName"/> 
            </div>  
            <div class="col-sm-2" xid="col3"> 
              <label class="control-label" xid="controlLabel2" bind-text=' $model.cfgData.label("excel")'><![CDATA[]]></label> 
            </div>  
            <div class="col-sm-4" xid="col4"> 
              <div class="input-group" component="$UI/system/components/bootstrap/inputGroup/inputGroup"
                xid="inputGroup1"> 
                <input type="text" class="form-control" component="$UI/system/components/justep/input/input"
                  xid="input1" bind-ref="cfgData.ref('excel')" readonly="true"/>  
                <div class="input-group-btn" xid="div1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-default" xid="openBtn" label="选择"> 
                    <i xid="i3"/>  
                    <span xid="span5">选择</span> 
                  </a> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="自定义参数" xid="controlGroup2" collapsible="true"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span>  
        </div> 

      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form2"><div class="form-group" xid="formGroup2">
   <div class="col-sm-2" xid="col5"><label class="control-label" xid="controlLabel3" bind-text=' $model.cfgData.label("userConfig")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col6"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox2" checkedValue="1" bind-ref="cfgData.ref('userConfig')"></span></div>
   </div>
  <div class="form-group" xid="formGroup3">
   <div class="col-sm-2" xid="col9"><label class="control-label" xid="controlLabel4" bind-text=' $model.cfgData.label("allSheet")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col10"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox3" checkedValue="1" bind-ref="cfgData.ref('allSheet')"></span></div>
   </div>
  <div class="form-group" xid="formGroup4">
   <div class="col-sm-2" xid="col13"><label class="control-label" xid="controlLabel5" bind-text=' $model.cfgData.label("sheetStart")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col14"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="cfgData.ref('sheetStart')"></input></div>
   <div class="col-sm-2" xid="col15"><label class="control-label" xid="controlLabel6" bind-text=' $model.cfgData.label("sheetEnd")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col16"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="cfgData.ref('sheetEnd')"></input></div></div>
  <div class="form-group" xid="formGroup5">
   <div class="col-sm-2" xid="col17"><label class="control-label" xid="controlLabel7" bind-text=' $model.cfgData.label("allRow")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col18"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox4" checkedValue="1" bind-ref="cfgData.ref('allRow')"></span></div>
   </div>
  <div class="form-group" xid="formGroup6">
   <div class="col-sm-2" xid="col21">
  <label class="control-label" xid="controlLabel8" bind-text=' $model.cfgData.label("rowStart")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col22"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="cfgData.ref('rowStart')"></input></div>
   <div class="col-sm-2" xid="col23"><label class="control-label" xid="controlLabel9" bind-text=' $model.cfgData.label("rowEnd")'><![CDATA[]]></label></div>
   <div class="col-sm-4" xid="col24"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="cfgData.ref('rowEnd')"></input></div></div></div></div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick" bind-enable=' $model.cfgData.val("excel")'> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
