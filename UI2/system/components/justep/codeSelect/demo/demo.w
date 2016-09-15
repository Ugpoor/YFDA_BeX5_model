<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:257px;top:301px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="data1" idColumn="code" autoNew="true">
      <column name="code" type="String" xid="xid1"/>  
      <column name="name" type="String" xid="xid2"/>
    </div>
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form1">
    <div class="form-group" xid="formGroup1"> 
      <div class="col-sm-2" xid="col1">
        <label class="control-label" xid="controlLabel1"><![CDATA[codeSelect]]></label>
      </div>  
      <div class="col-sm-4" xid="col2">
        <select component="$UI/system/components/justep/codeSelect/codeSelect"
          class="form-control" xid="codeSelect1" bind-ref="data1.ref('code')" bind-labelRef="data1.ref('name')"
          codeType="taskKind"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
            xid="bizData1"/>
        </select>
      </div>  
      <div class="col-sm-2" xid="col3"/>  
      <div class="col-sm-4" xid="col4"/>
    </div>  
    <div class="form-group" xid="formGroup2"> 
      <div class="col-sm-2" xid="col5">
        <label class="control-label" xid="controlLabel2"><![CDATA[codeSelectPC]]></label>
      </div>  
      <div class="col-sm-4" xid="col6">
        <div class="x-gridSelect" component="$UI/system/components/justep/codeSelect/codeSelectPC"
          xid="codeSelectPC1" bind-ref="data1.ref('code')" codeType="taskKind" bind-labelRef="data1.ref('name')"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
            xid="bizData2"/>  
          <option xid="option1"> 
            <columns xid="columns1"> 
              <column name="sName" xid="column1"/>
            </columns> 
          </option> 
        </div>
      </div>  
      <div class="col-sm-2" xid="col7"/>  
      <div class="col-sm-4" xid="col8"/>
    </div>  
    <div class="form-group" xid="formGroup4"> 
      <div class="col-sm-2" xid="col13">
        <label class="control-label" xid="controlLabel3"><![CDATA[code]]></label>
      </div>  
      <div class="col-sm-4" xid="col14">
        <div component="$UI/system/components/justep/output/output" class="x-output"
          xid="output1" bind-ref="data1.ref('code')"/>
      </div>  
      <div class="col-sm-2" xid="col15">
        <label class="control-label" xid="controlLabel4"><![CDATA[name]]></label>
      </div>  
      <div class="col-sm-4" xid="col16">
        <div component="$UI/system/components/justep/output/output" class="x-output"
          xid="output2" bind-ref="data1.ref('name')"/>
      </div>
    </div>
  </div>
</div>
