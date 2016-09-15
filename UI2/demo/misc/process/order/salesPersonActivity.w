<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" extends="$UI/demo/misc/process/order/orderReportActivity.w">  
  <div xid="rule5" xui:update-mode="delete"/>  
  <!-- 
  <div xid="rule2" xui:update-mode="delete"/>
   -->  
  <rule xid="rule4_7" xui:parent="orderData" xui:update-mode="insert"> 
    <readonly xid="readonly36_7"> 
      <expr xid="default39_7">true</expr> 
    </readonly>  
    <col name="fAuditorID" xid="ruleCol36_7"> 
      <readonly xid="readonly37_7"> 
        <expr xid="default40_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorIsArgee" xid="ruleCol37_7"> 
      <readonly xid="readonly38_7"> 
        <expr xid="default41_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditor" xid="ruleCol38_7"> 
      <readonly xid="readonly39_7"> 
        <expr xid="default42_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorDate" xid="ruleCol39_7"> 
      <readonly xid="readonly40_7"> 
        <expr xid="default43_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineID" xid="ruleCol40_7"> 
      <readonly xid="readonly41_7"> 
        <expr xid="default44_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamine" xid="ruleCol41_7"> 
      <readonly xid="readonly42_7"> 
        <expr xid="default45_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineDate" xid="ruleCol42_7"> 
      <readonly xid="readonly43_7"> 
        <expr xid="default46_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineIsArgee" xid="ruleCol43_7"> 
      <readonly xid="readonly44_7"> 
        <expr xid="default47_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fTolotalAmt" xid="ruleCol44_7"> 
      <calculate xid="calculate4_7"> 
        <expr xid="default48_7">$model.orderDetailData.sum("fFactAmt")</expr> 
      </calculate> 
    </col>  
    <col name="fAuditorName" xid="ruleCol45_7"> 
      <readonly xid="readonly45_7"> 
        <expr xid="default49_7">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineName" xid="ruleCol46_7"> 
      <readonly xid="readonly46_7"> 
        <expr xid="default50_7">true</expr> 
      </readonly> 
    </col> 
  </rule>  
  <rule xid="rule1_7" xui:parent="orderDetailData" xui:update-mode="insert"> 
    <readonly xid="readonly1_7"> 
      <expr xid="default1_7">true</expr> 
    </readonly>  
    <col name="index" xid="ruleCol1_7"> 
      <calculate xid="calculate1_7"> 
        <expr xid="default2_7">$row.index()+1</expr> 
      </calculate> 
    </col> 
  </rule>  
  <a xid="addProductBtn" bind-enable="false" xui:update-mode="merge"/>  
  <a xid="editProductBtn" bind-enable="false" xui:update-mode="merge"/> 
</div>
