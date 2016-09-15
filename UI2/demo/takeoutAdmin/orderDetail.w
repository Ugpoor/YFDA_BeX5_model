<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:57px;top:474px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="orderData" idColumn="fID"><column label="订单ID" name="fID" type="String" xid="xid1"></column>
  <column label="下单时间" name="fCreateTime" type="DateTime" xid="xid2"></column>
  <column label="订单内容" name="fContent" type="String" xid="xid3"></column>
  <column label="总价（元）" name="fSum" type="String" xid="xid4"></column>
  <column label="用户ID" name="fUserID" type="String" xid="xid5"></column>
  <column label="用户名" name="fUserName" type="String" xid="xid6"></column>
  <column label="电话" name="fPhoneNumber" type="String" xid="xid7"></column>
  <column label="地址" name="fAddress" type="String" xid="xid8"></column>
  <column label="付款状态" name="fPayState" type="String" xid="xid9"></column>
  <column label="配送状态" name="fDispatchingState" type="String" xid="xid10"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dispatchingStateData" idColumn="value"><column label="值" name="value" type="String" xid="xid11"></column>
  <column label="显示值" name="oValue" type="String" xid="xid12"></column>
  <data xid="default1">[{&quot;value&quot;:&quot;0&quot;,&quot;oValue&quot;:&quot;已取消&quot;},{&quot;value&quot;:&quot;1&quot;,&quot;oValue&quot;:&quot;未配送&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;oValue&quot;:&quot;已配送&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="payStateData" idColumn="value"><column label="值" name="value" type="String" xid="xid13"></column>
  <column label="显示值" name="oValue" type="String" xid="xid14"></column>
  <data xid="default2">[{&quot;value&quot;:&quot;0&quot;,&quot;oValue&quot;:&quot;货到付款&quot;},{&quot;value&quot;:&quot;1&quot;,&quot;oValue&quot;:&quot;网上支付&quot;}]</data></div></div> 

  
  
  
  
  
  
  
  
  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1">
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   
   <div class="panel-body" xid="body1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" bind-text="orderData.label('fUserID')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="orderData.ref('fUserID')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" bind-text="orderData.label('fUserName')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output2" bind-ref="orderData.ref('fUserName')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3" bind-text="orderData.label('fID')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output3" bind-ref="orderData.ref('fID')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label4" bind-text="orderData.label('fCreateTime')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output4" dataType="DateTime" format="yyyy-MM-dd hh:mm" bind-ref="orderData.ref('fCreateTime')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
   <label class="x-label" xid="label5" bind-text="orderData.label('fContent')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output5" bind-ref="orderData.ref('fContent')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
   <label class="x-label" xid="label6" bind-text="orderData.label('fAddress')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output6" bind-ref="orderData.ref('fAddress')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
   <label class="x-label" xid="label7" bind-text="orderData.label('fPhoneNumber')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output7" bind-ref="orderData.ref('fPhoneNumber')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
   <label class="x-label" xid="label8" bind-text="orderData.label('fSum')"></label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output8" bind-ref="orderData.ref('fSum')"></div></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
   <label class="x-label" xid="label9"><![CDATA[付款状态]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select1" bind-ref="orderData.ref('fPayState')" bind-options="payStateData" bind-optionsValue="value" bind-optionsLabel="oValue" disabled="true"></select></div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit10">
   <label class="x-label" xid="label10"><![CDATA[配送状态]]></label>
   <select component="$UI/system/components/justep/select/select" class="form-control x-edit" xid="select2" bind-ref="orderData.ref('fDispatchingState')" bind-options="dispatchingStateData" bind-optionsValue="value" bind-optionsLabel="oValue" disabled="true"></select></div></div>
   </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link x-dialog-button" label="取消" xid="cancel" onClick="cancelClick">
   <i xid="i1"></i>
   <span xid="span1">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="okbtn" onClick="okbtnClick">
   <i xid="i2"></i>
   <span xid="span2">确定</span></a></div></div></div>