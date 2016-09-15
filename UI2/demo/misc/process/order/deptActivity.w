<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/demo/misc/process/order/orderReportActivity.w" >

  <div xid="rule5" xui:update-mode="delete"/>
    <rule xid="rule2_2" xui:parent="orderData" xui:update-mode="insert" >
<col name="fCustomerID" xid="ruleCol15_2" >
<readonly xid="readonly14_2" >
<expr xid="default15_2" >






true</expr>
</readonly>
</col>
<col name="fRequiredDate" xid="ruleCol16_2" >
<readonly xid="readonly15_2" >
<expr xid="default16_2" >






true</expr>
</readonly>
</col>
<col name="fShippedDate" xid="ruleCol17_2" >
<readonly xid="readonly16_2" >
<expr xid="default17_2" >






true</expr>
</readonly>
</col>
<col name="fOrderDate" xid="ruleCol18_2" >
<readonly xid="readonly17_2" >
<expr xid="default18_2" >






true</expr>
</readonly>
</col>
<col name="fReportID" xid="ruleCol19_2" >
<readonly xid="readonly18_2" >
<expr xid="default19_2" >






true</expr>
</readonly>
</col>
<col name="fReporedDate" xid="ruleCol20_2" >
<readonly xid="readonly19_2" >
<expr xid="default20_2" >






true</expr>
</readonly>
</col>
<col name="fAuditorID" xid="ruleCol21_2" >
<readonly xid="readonly20_2" >
<expr xid="default21_2" >






false</expr>
</readonly>
</col>
<col name="fAuditorIsArgee" xid="ruleCol22_2" >
<readonly xid="readonly21_2" >
<expr xid="default22_2" >






false</expr>
</readonly>
</col>
<col name="fAuditor" xid="ruleCol23_2" >
<readonly xid="readonly22_2" >
<expr xid="default23_2" >






false</expr>
</readonly>
</col>
<col name="fAuditorDate" xid="ruleCol24_2" >
<readonly xid="readonly23_2" >
<expr xid="default24_2" >






false</expr>
</readonly>
</col>
<col name="fExamineID" xid="ruleCol25_2" >
<readonly xid="readonly24_2" >
<expr xid="default25_2" >






true</expr>
</readonly>
</col>
<col name="fExamine" xid="ruleCol26_2" >
<readonly xid="readonly25_2" >
<expr xid="default26_2" >






true</expr>
</readonly>
</col>
<col name="fExamineDate" xid="ruleCol27_2" >
<readonly xid="readonly26_2" >
<expr xid="default27_2" >






true</expr>
</readonly>
</col>
<col name="fExamineIsArgee" xid="ruleCol28_2" >
<readonly xid="readonly27_2" >
<expr xid="default28_2" >






true</expr>
</readonly>
</col>
<col name="fEmploueeName" xid="ruleCol29_2" >
<readonly xid="readonly28_2" >
<expr xid="default29_2" >






true</expr>
</readonly>
</col>
<col name="fCustomerName" xid="ruleCol30_2" >
<readonly xid="readonly29_2" >
<expr xid="default30_2" >






true</expr>
</readonly>
</col>
<col name="fTolotalAmt" xid="ruleCol31_2" >
<readonly xid="readonly30_2" >
<expr xid="default31_2" >






true</expr>
</readonly>
<calculate xid="calculate2_2" >
<expr xid="default32_2" >






$model.orderDetailData.sum("fFactAmt")</expr>
</calculate>
</col>
<col name="fEmploueeID" xid="ruleCol32_2" >
<readonly xid="readonly31_2" >
<expr xid="default33_2" >






true</expr>
</readonly>
</col>
<col name="fAuditorName" xid="ruleCol33_2" >
<readonly xid="readonly32_2" >
<expr xid="default34_2" >






false</expr>
</readonly>
</col>
<col name="fExamineName" xid="ruleCol34_2" >
<readonly xid="readonly33_2" >
<expr xid="default35_2" >






true</expr>
</readonly>
</col>
<col name="fPicture" xid="ruleCol35_2" >
<readonly xid="readonly34_2" >
<expr xid="default36_2" >






true</expr>
</readonly>
</col>
</rule>
    <rule xid="rule1_25" xui:parent="orderDetailData" xui:update-mode="insert" >
<readonly xid="readonly1_25" >
<expr xid="default1_25" >


true</expr>
</readonly>
</rule>
   <a xid="addProductBtn" bind-enable="false"  xui:update-mode="merge"/>
   <a xid="editProductBtn" bind-enable="false"  xui:update-mode="merge"/>

</div>