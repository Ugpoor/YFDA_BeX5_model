<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" extends="$UI/demo/misc/process/order/orderReportActivity.w">  
  <div xid="rule5" xui:update-mode="delete"/>  
  <rule xid="rule1_5" xui:parent="orderData" xui:update-mode="insert"> 
    <col name="fCustomerID" xid="ruleCol1_5"> 
      <readonly xid="readonly1_5"> 
        <expr xid="default1_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fRequiredDate" xid="ruleCol2_5"> 
      <readonly xid="readonly2_5"> 
        <expr xid="default2_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fShippedDate" xid="ruleCol3_5"> 
      <readonly xid="readonly3_5"> 
        <expr xid="default3_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fOrderDate" xid="ruleCol4_5"> 
      <readonly xid="readonly4_5"> 
        <expr xid="default4_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fReportID" xid="ruleCol5_5"> 
      <readonly xid="readonly5_5"> 
        <expr xid="default5_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fReporedDate" xid="ruleCol6_5"> 
      <readonly xid="readonly6_5"> 
        <expr xid="default6_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorID" xid="ruleCol7_5"> 
      <readonly xid="readonly7_5"> 
        <expr xid="default7_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorIsArgee" xid="ruleCol8_5"> 
      <readonly xid="readonly8_5"> 
        <expr xid="default8_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditor" xid="ruleCol9_5"> 
      <readonly xid="readonly9_5"> 
        <expr xid="default9_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorDate" xid="ruleCol10_5"> 
      <readonly xid="readonly10_5"> 
        <expr xid="default10_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineID" xid="ruleCol11_5"> 
      <readonly xid="readonly11_5"> 
        <expr xid="default11_5">false</expr> 
      </readonly> 
    </col>  
    <col name="fExamine" xid="ruleCol12_5"> 
      <readonly xid="readonly12_5"> 
        <expr xid="default12_5">false</expr> 
      </readonly> 
    </col>  
    <col name="fExamineDate" xid="ruleCol13_5"> 
      <readonly xid="readonly13_5"> 
        <expr xid="default13_5">false</expr> 
      </readonly> 
    </col>  
    <col name="fExamineIsArgee" xid="ruleCol14_5"> 
      <readonly xid="readonly14_5"> 
        <expr xid="default14_5">false</expr> 
      </readonly> 
    </col>  
    <col name="fEmploueeName" xid="ruleCol15_5"> 
      <readonly xid="readonly15_5"> 
        <expr xid="default15_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fCustomerName" xid="ruleCol16_5"> 
      <readonly xid="readonly16_5"> 
        <expr xid="default16_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fTolotalAmt" xid="ruleCol17_5"> 
      <readonly xid="readonly17_5"> 
        <expr xid="default17_5">true</expr> 
      </readonly>  
      <calculate xid="calculate1_5"> 
        <expr xid="default18_5">$model.orderDetailData.sum("fFactAmt")</expr> 
      </calculate> 
    </col>  
    <col name="fEmploueeID" xid="ruleCol18_5"> 
      <readonly xid="readonly18_5"> 
        <expr xid="default19_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAuditorName" xid="ruleCol19_5"> 
      <readonly xid="readonly19_5"> 
        <expr xid="default20_5">true</expr> 
      </readonly> 
    </col>  
    <col name="fExamineName" xid="ruleCol20_5"> 
      <readonly xid="readonly20_5"> 
        <expr xid="default21_5">false</expr> 
      </readonly> 
    </col>  
    <col name="fPicture" xid="ruleCol21_5"> 
      <readonly xid="readonly21_5"> 
        <expr xid="default22_5">true</expr> 
      </readonly> 
    </col> 
  </rule>  
  <rule xid="rule1_17" xui:parent="orderDetailData" xui:update-mode="insert"> 
    <readonly xid="readonly1_17"> 
      <expr xid="default1_17">true</expr> 
    </readonly> 
  </rule>  
  <a xid="addProductBtn" bind-enable="false" xui:update-mode="merge"/>  
  <a xid="editProductBtn" bind-enable="false" xui:update-mode="merge"/> 
</div>
