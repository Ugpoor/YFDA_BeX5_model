<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xid="window" 
  class="window" 
  component="$UI/system/components/justep/window/window" 
  extends="managerActivity.m.w" >

  <div xid="rule1_3" xui:update-mode="delete"/>
    <rule xid="rule1_3" xui:parent="mainData" xui:update-mode="insert" >
<readonly xid="readonly1_3" >
<expr xid="default1_3" >
js:true</expr>
</readonly>
<col name="fCustomerID" xid="ruleCol1_3" >
<readonly xid="readonly2_3" >
<expr xid="default2_3" >
js:true</expr>
</readonly>
</col>
<col name="fRequiredDate" xid="ruleCol2_3" >
<readonly xid="readonly3_3" >
<expr xid="default3_3" >
js:true</expr>
</readonly>
</col>
<col name="fShippedDate" xid="ruleCol3_3" >
<readonly xid="readonly4_3" >
<expr xid="default4_3" >
js:true</expr>
</readonly>
</col>
<col name="fOrderDate" xid="ruleCol4_3" >
<readonly xid="readonly5_3" >
<expr xid="default5_3" >
js:true</expr>
</readonly>
</col>
<col name="fAuditorID" xid="ruleCol5_3" >
<readonly xid="readonly6_3" >
<expr xid="default6_3" >
js:true</expr>
</readonly>
</col>
<col name="fAuditorIsArgee" xid="ruleCol6_3" >
<readonly xid="readonly7_3" >
<expr xid="default7_3" >
js:true</expr>
</readonly>
</col>
<col name="fAuditor" xid="ruleCol7_3" >
<readonly xid="readonly8_3" >
<expr xid="default8_3" >
js:true</expr>
</readonly>
</col>
<col name="fAuditorDate" xid="ruleCol8_3" >
<readonly xid="readonly9_3" >
<expr xid="default9_3" >
js:true</expr>
</readonly>
</col>
<col name="fExamine" xid="ruleCol9_3" >
<readonly xid="readonly10_3" >
<expr xid="default10_3" >
js:true</expr>
</readonly>
</col>
<col name="fExamineIsArgee" xid="ruleCol10_3" >
<readonly xid="readonly11_3" >
<expr xid="default11_3" >
js:true</expr>
</readonly>
</col>
<col name="fPicture" xid="ruleCol11_3" >
<readonly xid="readonly12_3" >
<expr xid="default12_3" >
js:true</expr>
</readonly>
</col>
</rule>
   <div xid="titleBar1" title="订单通知"  xui:update-mode="merge"/>
   <div xid="div2" class="x-titlebar-title"  xui:update-mode="replace-and-replace">
订单通知</div>
</div>