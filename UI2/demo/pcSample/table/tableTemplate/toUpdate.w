<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:94px;top:337px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="educationData" idColumn="type">
      <column label="类型" name="type" type="String" xid="xid1"/>  
      <data xid="default1">[{"type":"博士"},{"type":"硕士"},{"type":"研究生"},{"type":"本科"},{"type":"专科"},{"type":"高中"},{"type":"初中"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="sexData" idColumn="type">
      <column label="性别" name="type" type="String" xid="xid2"/>  
      <data xid="default2">[{"type":"男"},{"type":"女"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div style="width:85%;">
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput2"> 
          <label class="x-label" xid="label6" style="text-align:right;"><![CDATA[姓名：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="nameInput" readonly="true"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelPassword1"> 
          <label class="x-label" xid="label2" style="text-align:right;"><![CDATA[密码：]]></label>  
          <input component="$UI/system/components/justep/input/password" class="form-control x-edit"
            xid="password"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelSelect1"> 
          <label class="x-label" xid="label3" style="text-align:right;"><![CDATA[学历：]]></label>  
          <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
            xid="educationSelect" bind-options="educationData" bind-optionsValue="type"
            bind-optionsLabel="type"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelRadioGroup1"> 
          <label class="x-label" xid="label4" style="text-align:right;"><![CDATA[性别：]]></label>  
          <span component="$UI/system/components/justep/select/radioGroup" class="x-radios x-edit"
            xid="radioGroup" bind-itemset="sexData" bind-itemsetValue="ref('type')"
            bind-itemsetLabel="ref('type')"/>
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput1"> 
          <label class="x-label" xid="label5" style="text-align:right;"><![CDATA[入职日期：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="dateInput" dataType="Date" format="yyyy-MM-dd" max="js:new Date()"/>
        </div>
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn x-gray pull-right o-marginLeft"
        label="清空" xid="clearButton" onClick="clearButtonClick"> 
        <i xid="i2"/>  
        <span xid="span2" class="text-muted">清空</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-info pull-right"
        label="确定" xid="OKButton" onClick="OKButtonClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a> 
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" onReceive="wReceiverReceive"/>
</div>
